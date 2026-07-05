# Quantitative Risk Management (QRM) — Analyse GARCH d'un portefeuille d'actions

*Projet I de Quantitative Risk Management* · *Équipe : KAMGA Romaric · MAFEULO Tavinia*

💻 [Code R](./code/QRM_analysis.R)

---

## Contexte

Analyse quantitative des risques d'un portefeuille d'actions (dont **Caterpillar Inc. — `CAT`**) via des modèles de la famille **GARCH**.

## Données

- Prix quotidiens issus d'un fichier local `stocks.csv`.
- Colonne date au format `%d/%m/%Y`.
- Séries construites en **xts** (extensible time series) pour un traitement propre des index temporels.

## Pipeline d'analyse

### 1. Statistiques descriptives et tests

- Rendements logarithmiques.
- Moments d'ordre supérieur (**skewness, kurtosis**) via `moments`.
- **Tests de normalité** — Jarque-Bera, Anderson-Darling (`tseries`, `nortest`).

### 2. Modèles GARCH univariés

Avec `rugarch` et `fGarch` :

- **GARCH(1,1)** de référence.
- **GJR-GARCH** — capture de l'effet levier (asymétrie).
- **EGARCH** — variante logarithmique de la volatilité conditionnelle.

### 3. Tests de spécification

Via `FinTS` et `lmtest` :

- **Test ARCH-LM** — détection d'hétéroscédasticité conditionnelle.
- **Ljung-Box** sur les résidus standardisés (autocorrélation résiduelle).
- **Diagnostic graphique** — QQ-plot des résidus, ACF/PACF.

### 4. Mesures de risque

- **Value-at-Risk (VaR)** conditionnelle à horizon 1 jour et 1 semaine.
- **Expected Shortfall (ES)** conditionnelle.
- Comparaison paramétrique vs historique.

## Packages R utilisés

```r
xts, TTR, moments, nortest, tseries,
rugarch, fGarch, lmtest, FinTS
```

## Note

Le rapport PDF associé n'était pas inclus dans les livrables partagés au moment de la mise en ligne. Le code R est fourni tel quel, avec les commentaires méthodologiques inline.

## Compétences mobilisées

Séries temporelles, modèles GARCH et extensions, tests d'hétéroscédasticité, mesures de risque cohérentes, R avancé (xts, rugarch).
