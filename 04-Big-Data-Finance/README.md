# Big Data in Finance — Optimisation de portefeuille

*Cours LLSMS2138 — Prof. Nathan LASSANCE (Louvain School of Management)* · *Année 2025-2026*
*Équipe : KAMGA BOPDA Davy · AGOGUE DE TETIO Prince · DINOCK DINOCK Yvan · THIRY Charles*

📄 [Lire le rapport (PDF, 29 pages)](./Rapport_Big_Data.pdf) · 💻 [Notebook Jupyter](./code/Big_Data_Portfolio.ipynb)

---

## Contexte

Dans un cadre **Big Data** (grand nombre d'actifs par rapport à la fenêtre d'estimation), la matrice de covariance devient **mal conditionnée**, ce qui pénalise les stratégies d'allocation classiques hors-échantillon. Ce projet compare plusieurs approches d'optimisation et évalue la **valeur ajoutée de la régularisation ℓ₂**.

## Stratégies comparées

| Stratégie | Description | Régularisation |
|---|---|---|
| **Equal Weight (1/N)** | *w_i = 1/N* pour tout actif | Aucune (naïve) |
| **Minimum Variance (MinVar)** | Minimise σ_p² | Aucune |
| **Maximum Sharpe Ratio (MSR)** | Maximise μ_p / σ_p | Aucune |
| **MinVar-ℓ₂ (Ridge)** | MinVar + pénalité γ‖w‖² | ℓ₂ (Ridge) |

## Méthodologie

### 1. Baselines
Estimation *in-sample* et *out-of-sample* des poids optimaux, calcul du Sharpe, du drawdown, du turnover.

### 2. MinVar régularisé
Résolution du problème pénalisé :

```
min_w  wᵀΣw + γ‖w‖²    s.t.   1ᵀw = 1
```

Étude de l'**effet de γ sur la performance out-of-sample** par balayage sur une grille.

### 3. Sélection optimale de γ par cross-validation

- **Cross-validation temporelle** (walk-forward).
- Choix de γ maximisant le Sharpe hors-échantillon moyen.

## Résultats clés

- Trois conclusions principales sur l'arbitrage biais-variance dans l'estimation.
- **Best practices** pour l'évaluation out-of-sample :
  - Éviter le *data snooping bias*.
  - Utiliser une fenêtre glissante réaliste.
  - Reporter Sharpe *net des coûts de transaction*.
- **Reformulation du standard warning** classique en gestion quantitative.

## Compétences mobilisées

Optimisation quadratique convexe, régularisation, sélection de modèle par CV, backtesting, mesures de performance et de risque, pandas_datareader/yfinance.
