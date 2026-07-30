# Quantitative Risk Management (LACTU2210)

*Cours LACTU2210, Prof. Christian Hafner (UCLouvain)*
*Équipe : KAMGA BOPDA Davy Romaric, MAFEULO Tavinia*

Deux projets qui se suivent. Le premier modélise la volatilité d'un actif isolé, le second passe au cas bivarié et s'attaque à ce que la volatilité seule ne dit pas : la façon dont deux actifs chutent ensemble.

Actifs étudiés : l'action **Caterpillar Inc. (CAT)** et l'indice **S&P 500**, sur données journalières depuis 2000 (5 075 observations de rendements).

## Valeur en entreprise

Une salle des marchés, une direction des risques ou une équipe d'investissement d'assureur a besoin de répondre à deux questions : combien puis-je perdre demain sur ce portefeuille, et ma mesure de risque tient-elle la route quand on la confronte à l'historique ?

Ce projet répond aux deux et livre au passage un résultat inconfortable. La VaR à 1 % calculée sous hypothèse gaussienne à partir du modèle BEKK est dépassée **1,73 % des jours** au lieu des 1 % attendus. Elle sous-estime donc le risque de près de trois quarts, et un backtesting de VaR au sens de Bâle rejetterait ce modèle.

L'explication est dans la structure de dépendance. La copule ajustée sur les résidus standardisés est une t de Student à **ν = 6,17 degrés de liberté**, avec un coefficient de dépendance de queue gauche **λ_L = 0,2777**. Une copule gaussienne aurait donné λ_L = 0 : elle affirme qu'à la limite, deux actifs ne s'effondrent jamais simultanément. C'est précisément l'hypothèse qui a coûté cher aux modèles de risque de crédit en 2007-2008.

Applications directes : calibration et backtesting de VaR et d'Expected Shortfall, dimensionnement du module de risque de marché sous Solvabilité II, tests de résistance sur un portefeuille actions, choix de la structure de dépendance dans un modèle interne d'agrégation des risques.

---

## Projet I : volatilité conditionnelle univariée

[`code/Projet1_GARCH_univarie.R`](./code/Projet1_GARCH_univarie.R)

Point de départ classique : les rendements financiers ne sont ni indépendants ni gaussiens, et leur variance change dans le temps par grappes.

**Statistiques descriptives et tests.** Rendements logarithmiques, moments d'ordre supérieur (asymétrie, kurtosis) via `moments`, tests de normalité de Jarque-Bera et Anderson-Darling (`tseries`, `nortest`). La normalité est rejetée, ce qui justifie la suite.

**Modèles estimés** avec `rugarch` et `fGarch` :

| Modèle | Ce qu'il ajoute |
|---|---|
| GARCH(1,1) | Référence, volatilité persistante |
| GJR-GARCH | Effet de levier : une baisse fait monter la volatilité plus qu'une hausse de même ampleur |
| EGARCH | Volatilité en log, pas de contrainte de positivité sur les paramètres |

**Validation.** Test ARCH-LM sur les résidus (`FinTS`) pour vérifier qu'il ne reste pas d'hétéroscédasticité, Ljung-Box sur les résidus standardisés et leurs carrés, QQ-plot et ACF/PACF.

**Mesures de risque.** VaR et Expected Shortfall conditionnelles, à horizon 1 jour et 1 semaine, comparaison des approches paramétrique et historique.

Le rapport écrit de ce premier projet n'était pas disponible au moment de la mise en ligne. Le code est fourni avec ses commentaires méthodologiques.

## Projet II : dépendance bivariée, BEKK et copules

[`code/Projet2_BEKK_Copules.R`](./code/Projet2_BEKK_Copules.R) · [Rapport PDF](./Rapport_Projet2_BEKK_Copules.pdf)

### 1. Modèle BEKK(1,1) bivarié

Les rendements centrés de CAT et du S&P 500 alimentent un BEKK(1,1) estimé avec le package `BEKKs`. On en extrait la matrice de variance-covariance conditionnelle H_t, dont les trois composantes H11,t, H22,t et H12,t donnent la corrélation conditionnelle :

```
rho_t = H12,t / sqrt(H11,t * H22,t)
```

Cette corrélation n'est pas constante. Elle monte pendant les phases de tension, c'est-à-dire le comportement qui casse la diversification au pire moment.

### 2. VaR conditionnelle d'un portefeuille équipondéré

Portefeuille 50 % CAT, 50 % S&P 500. Sa variance conditionnelle vaut 0,25·H11,t + 0,25·H22,t + 0,5·H12,t, et la VaR à 1 % sous hypothèse gaussienne conditionnelle s'écrit −z₀,₀₁·σ_t.

Le comptage des excédences donne 1,73 % au lieu de 1 %. Le rapport discute quatre pistes de correction : distribution conditionnelle à queues épaisses (Student, GED), échantillon plus long, modélisation de la dépendance par copules, ou VaR non paramétrique.

### 3. Résidus standardisés et pseudo-observations

Pour isoler la dépendance des effets de volatilité, les résidus sont standardisés par leur écart-type conditionnel BEKK, puis transformés en rangs normalisés u_it = rang(Z_it)/(n+1). On travaille ensuite dans le carré unité, terrain naturel des copules.

### 4. Ajustement de cinq copules

Estimation par maximum de vraisemblance sur les 5 075 pseudo-observations :

| Copule | Log-vraisemblance | AIC |
|---|---:|---:|
| **Student-t** | 1 569,72 | **−3 135,45** |
| Gaussienne | 1 478,54 | −2 955,07 |
| Frank | 1 454,04 | −2 906,08 |
| Gumbel | 1 393,83 | −2 785,67 |
| Clayton | 1 100,43 | −2 198,87 |

Estimation concurrente par inversion du tau de Kendall (τ empirique = 0,4781) :

| Copule | τ théorique | Erreur |
|---|---:|---:|
| Gumbel | 0,4758 | 0,0023 |
| Clayton | 0,4754 | 0,0027 |
| Normale | 0,4695 | 0,0087 |
| Frank | 0,4661 | 0,0120 |

Les deux critères ne désignent pas le même gagnant. La t-Student l'emporte à l'AIC, Gumbel reproduit mieux le tau empirique. Nous avons retenu la t-Student pour la suite, parce que le tau de Kendall mesure une dépendance globale alors que la question posée porte sur les queues. Paramètres estimés : ρ̂ = 0,6773 (erreur standard 0,008) et ν̂ = 6,17 (erreur standard 0,603).

### 5. Dépendance de queue à gauche

Sur les 5 075 paires, 109 vérifient simultanément u₁ < 0,05 et u₂ < 0,05, soit une probabilité conditionnelle empirique de 0,4296. Au seuil de 1 %, il ne reste que 13 paires, pour une probabilité conditionnelle de 0,2562.

L'indice théorique de la t-copule ajustée vaut λ_L = 0,2777. L'écart se resserre quand le seuil descend, ce qui est cohérent puisque λ_L est une limite asymptotique quand α tend vers 0. Cette convergence confirme que la t-copule capte la co-occurrence des pertes extrêmes.

---

## Reproduire l'analyse

```r
install.packages(c(
  "xts", "TTR", "moments", "nortest", "tseries",
  "rugarch", "fGarch", "lmtest", "FinTS",
  "BEKKs", "rmgarch", "copula", "matrixcalc",
  "ggplot2", "gridExtra", "dplyr", "lubridate", "readxl"
))
```

Les deux scripts lisent un fichier de prix journaliers au format CSV (`stocks.csv` pour le projet I, `stocks2.csv` pour le projet II, colonne de dates au format `%d/%m/%Y`). Le chemin est codé en dur en tête de script, il faut l'adapter avant exécution. Les données ne sont pas redistribuées ici.

## Compétences mobilisées

Séries temporelles financières, GARCH univarié et extensions asymétriques, GARCH multivarié BEKK, théorie des copules avec estimation par maximum de vraisemblance et par inversion du tau de Kendall, dépendance de queue, VaR et Expected Shortfall, backtesting par comptage d'excédences, R avancé.
