# Actuarial Finance — Processus de Lévy et GMIB

*Cours LACTU2240 — Advanced Processes and Life Insurance Engineering — Prof. Donatien HAINAUT* · *Année 2025-2026*
*Équipe : DAKTOU TCHAGAM Martial · KAMGA BOPDA Davy Romaric*

📄 [Lire le rapport (PDF, 22 pages)](./Rapport_Actuarial_Finance_Levy_GMIB.pdf)

---

## Partie I — Processus de Lévy sur le S&P 500

### Données
- **Log-rendements journaliers du S&P 500**.
- Période : **07/08/2020 – 07/08/2025** (5 ans).
- Source : Investing.com (`S&P 500 Historical Data.csv`).

### Processus ajustés

1. **Mouvement Brownien avec dérive (BMD)** — *dX_t = μ dt + σ dW_t*.
   - Calibration par méthode des moments.
2. **Diffusion avec sauts négatifs Gamma** — *dX_t = μ dt + σ dW_t − dJ_t*, *J_t ∈ Γ*.
   - Calibration **Peak Over Threshold (POT)** : la loi Gamma est ajustée sur les excès sous un seuil négatif.
3. **Processus Normal Inverse Gaussien (NIG)** — subordination normale-inverse-gaussienne.
   - Ajustement par méthode des moments (4 paramètres : α, β, δ, μ).

### Comparaison

- Reproduction de l'**asymétrie** et du **kurtosis leptokurtique** empirique.
- **Simulation** des trajectoires et comparaison à l'histogramme des rendements réels.
- **Calibration sous mesure risque-neutre Q** via changement de mesure d'Esscher.

## Partie II — Tarification d'un GMIB

**GMIB** = *Guaranteed Minimum Income Benefit* : rente annuelle minimale garantie sur un contrat de type variable annuity.

### Formulation

Prime *V₀* fonction du **plancher de rente c_min** :

- Étude des **propriétés analytiques de V₀(c_min)** — monotonie, convexité, comportement asymptotique.
- **Méthode de résolution numérique** (bisection ou Newton) pour trouver le c_min tel que V₀ = 100.

### Résultats

Sensibilité de la prime au choix du modèle (BMD, Jump-Diffusion, NIG) et implication pour la marge de sécurité de l'assureur.

## Compétences mobilisées

Processus stochastiques à sauts, mesure d'Esscher, POT et théorie des valeurs extrêmes, subordination, méthode des moments, pricing d'options à barrière, résolution numérique.
