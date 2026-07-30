# Projet 2 QRM 
# Auteur : [KAMGA et Tavinia]



# Chargement des bibliothèques nécessaires
library(readxl)
library(matrixcalc)
library(rmgarch)
library(BEKKs)
library(copula)
library(ggplot2)
library(gridExtra)
library(dplyr)
library(lubridate)



# -----------------------------
# QUESTION 1 : Préparation des données
# -----------------------------

# Le fichier contient les prix journaliers pour plusieurs actifs
# Pour notre projet, nous sélectionnons la colonne 6 pour l'actif (X) et la colonne 27 pour l'indice S&P 500 (Y)


data <- read.csv("C:\\Users\\LGC\\Desktop\\Cours actuariat\\QRM--\\stocks2.csv")

date = as.Date(data[,1], format= "%d/%m/%Y")
X = data.frame(date, data[,6])
SP500 = data[,27]
date2 = date[-1]  

# Calcul des rendements logarithmiques


dX = diff(log(X[,2]))
dY = diff(log(SP500))

# Tracé des rendements

par(mfrow = c(1, 2))
plot(date2, dX, main = "Rendement de CAT", type = "l", col = "blue")
plot(date2, dY, main = "Rendement de S&P500", type = "l", col = "red")


df_CAT <- data.frame(date = date2, rendement = dX, serie = "CAT")
df_SP500 <- data.frame(date = date2, rendement = dY, serie = "S&P500")

df_combined <- rbind(df_CAT, df_SP500)

plot_CAT <- ggplot(df_CAT, aes(x = date, y = rendement)) +
  geom_line(color = "#1E88E5", size = 0.8) +
  labs(title = "Rendement de CAT",
       x = "Date",
       y = "Rendement") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.title = element_text(face = "bold"),
    panel.grid.minor = element_blank(),
    panel.border = element_rect(fill = NA, color = "gray80")
  )

plot_SP500 <- ggplot(df_SP500, aes(x = date, y = rendement)) +
  geom_line(color = "#E53935", size = 0.8) +
  labs(title = "Rendement de S&P500",
       x = "Date",
       y = "Rendement") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.title = element_text(face = "bold"),
    panel.grid.minor = element_blank(),
    panel.border = element_rect(fill = NA, color = "gray80")
  )


grid.arrange(plot_CAT, plot_SP500, ncol = 2)

plot_combined <- ggplot(df_combined, aes(x = date, y = rendement, color = serie)) +
  geom_line(size = 0.8) +
  scale_color_manual(values = c("CAT" = "#1E88E5", "S&P500" = "#E53935")) +
  labs(title = "Comparaison des rendements CAT vs S&P500",
       x = "Date",
       y = "Rendement",
       color = "Série") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.title = element_text(face = "bold"),
    legend.position = "bottom",
    panel.grid.minor = element_blank(),
    panel.border = element_rect(fill = NA, color = "gray80")
  )


print(plot_combined)


# -----------------------------
# QUESTION 2 : BEKK + VaR conditionnelle
# -----------------------------

# 1. Création des rendements centrés pour le modèle BEKK

eps = cbind(dX - mean(dX), dY - mean(dY))

# 2. Estimation du modèle BEKK bivarié

spec = bekk_spec()
model = bekk_fit(spec, eps)
fit = model$sigma_t
summary(model)

# 3. Extraction des éléments de variance et covariance conditionnelles

v1bekk = fit[,1]^2
v2bekk = fit[,3]^2
covbekk = fit[,2] * fit[,1] * fit[,3]


H11_t <- fit[,1]^2                      # H_{11,t} = variance conditionnelle de CAT
H22_t <- fit[,3]^2                      # H_{22,t} = variance conditionnelle de S&P500
H12_t <- fit[,1] * fit[,2] * fit[,3]    # H_{12,t} = covariance conditionnelle

Hij_df <- data.frame(
  Date = date2,    # ou la même longueur que les rendements
  H11 = H11_t,
  H22 = H22_t,
  H12 = H12_t
)

head(Hij_df)  # aperçu des premières valeurs



# 4. Corrélation conditionnelle estimée

par(mfrow = c(1, 1))
tcor = covbekk / (sqrt(v1bekk) * sqrt(v2bekk))
plot(tcor, type = "l", main = "Corrélation conditionnelle BEKK", col= "blue")

# 5. Calcul des rendements d’un portefeuille égal-pondéré

r_portfolio = 0.5 * dX + 0.5 * dY
var_portfolio = 0.25 * v1bekk + 0.25 * v2bekk + 0.5 * covbekk
sd_portfolio = sqrt(var_portfolio)

# 6. VaR conditionnelle à 1% (hypothèse normale)

z_1pct = qnorm(0.01)
VaR = -z_1pct * sd_portfolio

# 7. Tracé des rendements et de la VaR
par(mfrow = c(1, 1))
plot(r_portfolio, type = "l", col = "blue", ylab = "Rendement", main = "VaR à 1% BEKK")
lines(-VaR, col = "red", lwd = 2)
legend("topright", legend = c("Rendement", "VaR 1%"), col = c("blue", "red"), lty = 1)

# 8. Calcul des excédences de VaR

exc = sum(r_portfolio < -VaR)
prop_exc = exc / length(r_portfolio)

cat("Excédences VaR:", exc, "Proportion:", round(100 * prop_exc, 2), "%\n")



# -----------------------------
# QUESTION 3 : standardisation
# -----------------------------

# Rendements standardisés Z1t et Z2t
Z1t = eps[,1] / sqrt(v1bekk)
Z2t = eps[,2] / sqrt(v2bekk)

# Scatterplot des rendements standardisés

par(mfrow = c(1, 1))

plot(Z1t, Z2t, main = "Scatterplot des Z1t et Z2t", xlab = "Z1t", ylab = "Z2t")

# Calcul et tracé des rangs empiriques (pseudo-observations)

u1 = rank(Z1t) / (length(Z1t) + 1)
u2 = rank(Z2t) / (length(Z2t) + 1)

plot(u1, u2, main = "Scatterplot des rangs empiriques", xlab = "u1", ylab = "u2")

# -----------------------------
# QUESTION 4 : Ajustement de copules
# -----------------------------

library(copula)

# 1. Données copule : pseudo-observations

cop_data <- cbind(u1, u2)

# 2. Estimation par Maximum de Vraisemblance (ML)

cop_norm_ml  <- fitCopula(normalCopula(dim = 2), cop_data, method = "ml")
cop_t_ml     <- fitCopula(tCopula(dim = 2, df = 4, df.fixed = FALSE), cop_data, method = "ml")
cop_clay_ml  <- fitCopula(claytonCopula(dim = 2), cop_data, method = "ml")
cop_gumb_ml  <- fitCopula(gumbelCopula(dim = 2), cop_data, method = "ml")
cop_frank_ml <- fitCopula(frankCopula(dim = 2), cop_data, method = "ml")

# 3. Estimation par inversion de la corrélation de Spearman (IRHO)
# Student-t non supportée avec 'irho', donc exclue

cop_norm_irho  <- fitCopula(normalCopula(dim = 2), cop_data, method = "irho")
cop_clay_irho  <- fitCopula(claytonCopula(dim = 2), cop_data, method = "irho")
cop_gumb_irho  <- fitCopula(gumbelCopula(dim = 2), cop_data, method = "irho")
cop_frank_irho <- fitCopula(frankCopula(dim = 2), cop_data, method = "irho")


# Créer une fonction pour calculer l'erreur d'estimation de tau de Kendall

compare_tau <- function(copula_fit, empirical_data) {

  emp_tau <- cor(empirical_data[,1], empirical_data[,2], method = "kendall")
  
  theo_tau <- tau(copula_fit@copula)

  error <- abs(emp_tau - theo_tau)
  
  return(list(empirical = emp_tau, theoretical = theo_tau, error = error))
}

# Calculer les erreurs pour chaque copule

tau_norm <- compare_tau(cop_norm_irho, cop_data)
tau_clay <- compare_tau(cop_clay_irho, cop_data)
tau_gumb <- compare_tau(cop_gumb_irho, cop_data)
tau_frank <- compare_tau(cop_frank_irho, cop_data)



# Créer un tableau de comparaison

comparison_tau <- data.frame(
  Copula = c("Normale", "Clayton", "Gumbel", "Frank"),
  Empirical_Tau = c(tau_norm$empirical, tau_clay$empirical, tau_gumb$empirical, tau_frank$empirical),
  Theoretical_Tau = c(tau_norm$theoretical, tau_clay$theoretical, tau_gumb$theoretical, tau_frank$theoretical),
  Error = c(tau_norm$error, tau_clay$error, tau_gumb$error, tau_frank$error)
)

# Afficher le tableau de comparaison

print(comparison_tau)

# La copule Gumbel est celle qui capture le mieux la structure de dépendance de vos 
# données selon la mesure du tau de Kendall 


# 4. Résultats MLE

results_ml <- data.frame(
  Copule = c("Gaussian", "Student-t", "Clayton", "Gumbel", "Frank"),
  Methode = "ML",
  LogLik = c(logLik(cop_norm_ml), logLik(cop_t_ml), logLik(cop_clay_ml), logLik(cop_gumb_ml), logLik(cop_frank_ml)),
  AIC = c(AIC(cop_norm_ml), AIC(cop_t_ml), AIC(cop_clay_ml), AIC(cop_gumb_ml), AIC(cop_frank_ml))
)


# 5. Résultats IRHO (sans Student-t)

results_irho <- data.frame(
  Copule = c("Gaussian", "Clayton", "Gumbel", "Frank"),
  Methode = "IRHO",
  LogLik = c(logLik(cop_norm_irho), logLik(cop_clay_irho), logLik(cop_gumb_irho), logLik(cop_frank_irho)),
  AIC = c(AIC(cop_norm_irho), AIC(cop_clay_irho), AIC(cop_gumb_irho), AIC(cop_frank_irho))
)


# 6. Fusion et affichage

cop_results <- rbind(results_ml)

# Tri par AIC croissant pour interprétation facile

cop_results <- cop_results[order(cop_results$AIC), ]

# Affichage clair
print(cop_results, row.names = FALSE)

summary(cop_t_ml)

# -----------------------------
# QUESTION 5 : Dépendance en queue
# -----------------------------


# Taille de l'échantillon
n <- length(u1)

# Données uniformisées
u <- cbind(u1, u2)

# ---- Cas seuil 5% ----
s5 <- sum(u[,1] < 0.05 & u[,2] < 0.05)
s5
p_joint_5 <- s5 / n
p_cond_5 <- p_joint_5 / 0.05

# ---- Cas seuil 1% ----

s1 <- sum(u[,1] < 0.01 & u[,2] < 0.01)
s1
p_joint_1 <- s1 / n
p_joint_1
p_cond_1 <- p_joint_1 / 0.01

# ---- Indice de queue gauche théorique pour la t-copule ----

cop_t <- tCopula(param = 0.6773, df = 6.17, dim = 2, dispstr = "un")

# Extraire l'indice de queue gauche (lower tail dependence)
lambda_L <- lambda(cop_t)[1]  # [1] = gauche, [2] = droite

# Affichage

cat("P(u2 < 0.05 | u1 < 0.05) =", round(p_cond_5, 4), "\n")
cat("P(u2 < 0.01 | u1 < 0.01) =", round(p_cond_1, 4), "\n")
cat("Indice de queue gauche (lambda_L) :", round(lambda_L, 4), "\n")


n <- nrow(cop_data)
u <- cop_data

# -- Seuil 5% --
s5 <- sum(u[,1] < 0.05 & u[,2] < 0.05)
p_joint_5 <- s5 / n
p_cond_5 <- p_joint_5 / 0.05
cat("P(u2 < 0.05 | u1 < 0.05) =", round(p_cond_5, 4), "\n")

# -- Seuil 1% --
s1 <- sum(u[,1] < 0.01 & u[,2] < 0.01)
p_joint_1 <- s1 / n
p_cond_1 <- p_joint_1 / 0.01
cat("P(u2 < 0.01 | u1 < 0.01) =", round(p_cond_1, 4), "\n")

# -- Indice de dépendance en queue de la t-Copule ajustée --

rho_est <- cop_t_ml@estimate[1]
df_est <- cop_t_ml@estimate[2]
lambda_val <- lambda(tCopula(param = rho_est, df = df_est, dim = 2, df.fixed = TRUE))
cat("Indice de queue théorique (λ) =", round(lambda_val["lower"], 4), "\n")

