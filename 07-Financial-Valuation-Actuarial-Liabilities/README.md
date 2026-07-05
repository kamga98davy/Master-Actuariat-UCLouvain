# Financial Valuation of Actuarial Liabilities

*Cours LACTU2170 — Prof. Donatien HAINAUT* · *Année 2024-2025*
*Équipe : KAMGA BOPDA Davy Romaric · DINOCK DINOCK Yvan Bienvenue*

📄 [Partie I — Best Estimate (PDF)](./Rapport_Partie_I_BestEstimate.pdf) · 📄 [Partie II — Pricing (PDF)](./Rapport_Partie_II_Pricing.pdf) · 💻 [Notebook Jupyter](./code/Valorisation_Financiere.ipynb)

---

## Partie I — Best Estimate et sensibilité

Ce premier volet met en pratique le calcul du **Best Estimate** (BE) d'un portefeuille d'assurance-vie et les **indicateurs de sensibilité** classiques.

### 1. Estimation de la courbe zéro-coupon

- **Intérêts courus et Dirty Price** — passage du prix coté au prix théorique.
- **Rendements des obligations (yields)** — YTM par actif.
- **Lissage par le modèle de Svensson** (6 paramètres) :

```
y(t; β₀,β₁,β₂,β₃,τ₁,τ₂) = β₀ + β₁·f₁(t/τ₁) + β₂·f₂(t/τ₁) + β₃·f₃(t/τ₂)
```

- **Bootstrapping des taux spots** à partir des rendements de coupon.

### 2. Best Estimate et sensibilités

- **Pondération de la prime et des cash-flows vie et décès** puis actualisation aux taux spots.
- **Résultat : BE négatif** → favorable à l'assureur (marge bénéficiaire), défavorable à l'assuré.
- Calcul du **yield**, de la **duration modifiée**, de la **convexité**.
- **Estimation ΔBE pour une variation d'un point du yield.**

### Limites discutées

Les indicateurs yield/duration/convexité se révèlent difficiles à interpréter du fait de l'**hypothèse forte d'un taux de mortalité μ instantanément constant**.

## Partie II — Pricing d'un produit variable annuity

Le second volet évalue un **produit combinant assurance-vie et finance** : fonds investi dans un actif risqué, retrait annuel garanti K_T, mortalité modélisée.

### Structure de la prime V₀

```
V₀ = γF₀ · Σₖ ₖpₓ (1-γ)ᵏ + e^(-rT) · ₜpₓ · [K_T + A·E^Q((S_T - K_T/A)₊)]
```

avec *A = F₀(1-γ)^T / S₀*.

**Décomposition** :
- Partie **déterministe** *γF₀ Σₖ ₖpₓ (1-γ)ᵏ*.
- Partie **aléatoire** *E^Q((S_T - K_T/A)₊)* → analogue à une **call européen** sur (S_T - K).

### Trois méthodes de pricing comparées

1. **Arbre binomial** (Cox-Ross-Rubinstein).
2. **Simulation de Monte-Carlo** avec réduction de variance.
3. **Analyse des rendements de deux actifs corrélés** (extension multivariée).

### Analyse de convergence

Étude du taux de convergence et de la variance de chaque méthode selon le nombre de pas / trajectoires.

## Compétences mobilisées

Courbe des taux, modèle de Svensson, bootstrapping, Best Estimate, duration modifiée, convexité, arbre binomial, Monte-Carlo, formule fermée pour un call, pricing sous mesure risque-neutre.
