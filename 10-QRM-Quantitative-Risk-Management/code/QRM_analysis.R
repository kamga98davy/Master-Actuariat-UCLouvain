#####
####    Code R du Projet I de Quantitave Risk Management
###     Auteurs : KAMGA Romaric et MAFEULO Tavinia
###
####
####

# Packages du projet

library(xts)
library(TTR)
library(moments)
library(nortest)
library(tseries)
library(rugarch)
library(fGarch)
library(lmtest)
library(FinTS)

data <- read.csv("C:/Users/LGC/Desktop/Cours actuariat/Projet QRM/stocks.csv")

head(data)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")  

data <- data[order(data$Date), ]

# Convertir en série temporelle (xts)

ts_data <- xts(data$CAT, order.by = data$Date)

# Visualisation de la série des prix

plot(ts_data, main = "Prix de l'action Caterpillar (CAT)", 
     ylab = "Prix", xlab = "Date", col = "blue", lwd = 2)

# Calcul des rendements log

logtsdata <- log(ts_data)
rendement <- diff(logtsdata)
rendement <- na.omit(rendement)

# Graphique des rendements

par(mfrow = c(1, 1))
plot.ts(rendement, xlab = "Année-Jours", ylab = "Rendement CAT", col = "red")

# Ajouter la moyenne des rendements
abline(h = mean(rendement, na.rm = TRUE), col = "blue", lty = 2)

#  Filtrage avec moyenne mobile (Correction du filtre)

M <- filter(rendement, rep(1/50, 50), sides = 2)

lines(M, col = "green", lwd = 2)

# Test de normalité des rendements

skewness(rendement)   # Asymétrie
kurtosis(rendement)   # Aplatissement

anscombe.test(rendement, alternative = "less")  # Test d'Anscombe
agostino.test(rendement, alternative = "two.sided")

## Histogramme + Densité

hist(rendement, col = "yellow", freq = FALSE, main = "Histogramme des rendements")
#lines(density(rendement), col = "blue", lwd = 2)

##  Comparaison avec une densité normale

dens <- rnorm(400, mean(rendement), sd(rendement))
lines(density(dens), col = "red", lwd = 2)

##  QQ-plot

qqnorm(rendement)
qqline(rendement, col = "red", lwd = 3)


## Boxplot

boxplot(rendement, main = "Boxplot des rendements de CAT", 
        ylab = "Rendement", col = "lightblue", border = "darkblue", notch = TRUE)


# Test de normalité (Jarque-Bera)

jarque.bera.test(rendement)


# Stationnarité

par(mfrow = c(1, 2))
acf(rendement, lag.max = 30, main = "Autocorrélation des rendements", col = "blue")
acf(rendement^2, lag.max = 30, main = "Autocorrélation des rendements au carré", col = "red")



# Test de DQ 

## Dynamic quantile test

DQtest <- function(y, VaR, tau, cLags) {
  
  cT = length(y)
  vHit = numeric(cT)
  vHit[y < VaR] = 1 - tau
  vHit[y > VaR] = -tau
  
  vConstant = rep(1, (cT - cLags))
  vHIT = vHit[(cLags + 1):cT]
  vVaRforecast = VaR[(cLags + 1):cT]
  mZ = matrix(0, cT - cLags, cLags)
  vY2_lag = y[cLags:(cT - 1)]^2
  
  for (st in 1:cLags) {
    mZ[, st] = vHit[st:(cT - (cLags + 1L - st))]
  }
  
  mX = cbind(vConstant, vVaRforecast, mZ, vY2_lag)
  dDQstatOut = (t(vHIT) %*% mX %*% MASS::ginv(t(mX) %*% mX) %*% t(mX) %*% (vHIT))/(tau * (1 - tau))
  dDQpvalueOut = 1 - pchisq(dDQstatOut, ncol(mX))
  out = list(stat = dDQstatOut, pvalue = dDQpvalueOut)
}


DQ=DQtest(rendement, var, tau=alpha, 5)
DQ
DQ=DQtest(-rendement, var, tau=alpha, 5)
DQ

# Model Garch avec distribution normal


garchspec <- ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(1,1)),
                        mean.model = list(armaOrder = c(2,0), include.mean = T),
                        distribution.model = "norm")

garchnorm <- ugarchfit(spec = garchspec, data = rendement)

summary(garchnorm)

vargarchnorm <- as.numeric(quantile(garchnorm, probs = alpha))

sigma2=sigma(garchnorm)

par(mfrow = c(1, 1))
plot(dates, sigma2[2:n], type = "l", main = "RiskMetrics Volatility", xlab = "Date", ylab = "Volatility")
plot(dates, rendement[2:n], type = "l", main = "CAT: RiskMetrics 1% VaR", xlab = "Date", ylab = "Returns")
lines(dates, vargarchnorm[2:n], col = "red", lwd = 2)

## Validation du modele GARCH avec la loi normale

wilcox.test(residuals(garchnorm))

t.test(residuals(garchnorm))
Box.test(residuals(garchnorm), lag = 12, type = "Box-Pierce")

ArchTest(residuals(garchnorm),lags=12,demean = FALSE)

jarque.bera.test(residuals(garchnorm))

DQ=DQtest(rendement, vargarchnorm, tau=alpha, 5)
DQ
DQ=DQtest(-rendement, vargarchnorm, tau=alpha, 5)
DQ


# Modele Garch avec la loi student

garchspecstude <- ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(1,1)),
                         mean.model = list(armaOrder = c(2,0), include.mean = T),
                         distribution.model = "std")

garchstud = ugarchfit(spec = garchspecstude, data = rendement)


summary(garchstud)

vargarchstu <- as.numeric(quantile(garchstud, probs = alpha))

rendement <- as.numeric(rendement)

sigma2_std=sigma(garchstud)

##  Tracés des volatilités

par(mfrow = c(1, 1))
plot(dates, sigma2_std[2:n], type = "l", main = "RiskMetrics Volatility", xlab = "Date", ylab = "Volatility")
plot(dates, rendement[2:n], type = "l", main = "CAT: RiskMetrics 1% VaR", xlab = "Date", ylab = "Returns")
lines(dates, vargarchstu[2:n], col = "red", lwd = 2)

## Validation du modele GARCH avec de student

wilcox.test(residuals(garchstud))

t.test(residuals(garchstud))

Box.test(residuals(garchstud), lag = 12, type = "Box-Pierce")

ArchTest(residuals(garchstud),lags=12,demean = FALSE)

jarque.bera.test(residuals(garchstud))

## Summary du modele 

garchstud


## Afficher l'AIC


aic_value <- infocriteria(garchstud)[1]  


print(aic_value)


# Test DQ

DQ=DQtest(rendement, vargarchstu, tau=alpha, 5)
DQ

DQ=DQtest(-rendement, vargarchstu, tau=alpha, 5)
DQ


# Ajuster le modèle GARCH(1,1) avec distribution t de Student asymétrique


garchspecsstd<- ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(1,1)),
                             mean.model = list(armaOrder = c(2,0), include.mean = T),
                             distribution.model = "sstd")

garchskewn = ugarchfit(spec = garchspecsstd, data = rendement)


summary(garchskewn)

vargarchskew = quantile(garchskewn, probs = alpha) 

vargarchskew <- as.numeric(vargarchskew)
rendement <- as.numeric(rendement)

sigma_sstd = sigma(garchskewn)

par(mfrow = c(1, 1))
plot(dates, sigma_sstd[2:n], type = "l", main = "RiskMetrics Volatility", xlab = "Date", ylab = "Volatility")
plot(dates, rendement[2:n], type = "l", main = "CAT: RiskMetrics 1% VaR", xlab = "Date", ylab = "Returns")
lines(dates, vargarchskew[2:n], col = "red", lwd = 2)

## Validation du modele GARCH avec de student asymetrique

t.test(residuals(garchskewn))

Box.test(residuals(garchskewn), lag = 12, type = "Box-Pierce")

ArchTest(residuals(garchskewn),lags=12,demean = FALSE)

jarque.bera.test(residuals(garchskewn))

## Summary du modele 

garchskewn


## Afficher l'AIC


aic_value <- infocriteria(garchskewn)[1]  


print(aic_value)


## Test DQ

DQ=DQtest(rendement, vargarchskew, tau=alpha, 5)
DQ

DQ=DQtest(-rendement, vargarchskew, tau=alpha, 5)
DQ

## Ajuster le modèle GARCH(1,1) avec la distribution GED

garchspecged<- ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(1,1)),
                          mean.model = list(armaOrder = c(2,0), include.mean = T),
                          distribution.model = "ged")

garchged = ugarchfit(spec = garchspecged, data = rendement)


summary(garchged)


vargarchged = quantile(garchged, probs = alpha) 

vargarchged <- as.numeric(vargarchged)
rendement <- as.numeric(rendement)

sigma_ged = sigma(garchged)

par(mfrow = c(1, 1))
plot(dates, sigma_ged[2:n], type = "l", main = "RiskMetrics Volatility", xlab = "Date", ylab = "Volatility")
plot(dates, rendement[2:n], type = "l", main = "CAT: RiskMetrics 1% VaR", xlab = "Date", ylab = "Returns")
lines(dates, vargarchged[2:n], col = "red", lwd = 2)


# Validation du modele GARCH avec la loi GED

t.test(residuals(garchged))

Box.test(residuals(garchged), lag = 12, type = "Box-Pierce")

ArchTest(residuals(garchged),lags=12,demean = FALSE)

jarque.bera.test(residuals(garchged))

# Summary du modele 

garchged


# Afficher l'AIC


aic_value <- infocriteria(garchged)[1]  


print(aic_value)


# Test DQ

DQ=DQtest(rendement, vargarchged, tau=alpha, 5)
DQ

DQ=DQtest(-rendement, vargarchged, tau=alpha, 5)
DQ



### Spécifier un modèle GJR-GARCH(1,1) avec distribution t de Student


spec_gjr <- ugarchspec(
  variance.model = list(model = "gjrGARCH", garchOrder = c(1,1)),
  mean.model = list(armaOrder = c(0,0), include.mean = FALSE),
  distribution.model = "std")

fit_gjr <- ugarchfit(spec = spec_gjr, data = rendement)

vargarchgjr <- as.numeric(quantile(fit_gjr, probs = alpha))

sigma_gjr = sigma(fit_gjr)

par(mfrow = c(1, 2))
plot(dates, sigma_gjr[2:n], type = "l", main = "RiskMetrics Volatility", xlab = "Date", ylab = "Volatility")
plot(dates, rendement[2:n], type = "l", main = "CAT: RiskMetrics 1% VaR", xlab = "Date", ylab = "Returns")
lines(dates, vargarchgjr[2:n], col = "red", lwd = 2)

# Validation du modele GARCH avec la loi GJR

t.test(residuals(fit_gjr))

Box.test(residuals(fit_gjr), lag = 12, type = "Box-Pierce")

ArchTest(residuals(fit_gjr),lags=12,demean = FALSE)

jarque.bera.test(residuals(fit_gjr))

# Summary du modele 

fit_gjr

# Afficher l'AIC


aic_value <- infocriteria(fit_gjr)[1]  

print(aic_value)


DQ=DQtest(rendement, vargarchgjr, tau=alpha, 5)
DQ
DQ=DQtest(-rendement, vargarchgjr, tau=alpha, 5)
DQ