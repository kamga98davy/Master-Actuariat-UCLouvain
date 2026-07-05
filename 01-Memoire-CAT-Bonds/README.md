# Mémoire de Master — Tarification d'obligations catastrophes liées à la mortalité

> **Sauts corrélés entre mortalité et taux d'intérêt.**
> *Master en Sciences Actuarielles (ACTU2M)* — *Année académique 2025-2026* — *Faculté des Sciences, UCLouvain*

**Auteur :** KAMGA BOPDA Davy Romaric
**Promoteur :** Prof. Karim BARIGOU

📄 [Lire le mémoire (PDF, 58 pages)](./Memoire_KAMGA_BOPDA_Davy_Romaric.pdf)

---

## 1. Résumé

La pandémie de COVID-19 a provoqué un choc de mortalité d'une ampleur inédite qui a rompu brutalement les tendances d'amélioration de la longévité. Les **obligations catastrophes (CAT bonds) liées à la mortalité** — dont l'exemple emblématique est le *pandemic bond* de la Banque mondiale — offrent un mécanisme de titrisation permettant aux assureurs de transférer le risque de mortalité extrême aux marchés financiers.

La littérature traditionnelle repose sur une hypothèse d'**indépendance entre mortalité et taux d'intérêt**. Or les crises sanitaires majeures affectent simultanément les deux dimensions, créant un effet d'amplification que cette hypothèse sous-estime. Ce mémoire lève cette hypothèse en proposant un **modèle affine à sauts corrélés** entre le taux d'intérêt court r_t et l'intensité de mortalité μ_t, puis en dérivant une formule de tarification sous mesure risque-neutre. Une **application empirique sur données belges** est menée pour quantifier l'impact de la dépendance sur la prime de risque exigée par les investisseurs.

## 2. Motivation empirique

- **Excès de mortalité mondial COVID-19** : ~14,8 millions de décès supplémentaires entre janvier 2020 et décembre 2021 (OMS, Msemburi et al., 2022).
- **Belgique** : P-score = 17,5 % en 2020 → **~29 000 décès excédentaires** sur 2020-2022, concentrés sur les 65+.
- **Pandemic bond de la Banque mondiale** : déclenché durant la COVID-19, **133 M USD** mobilisés pour les pays vulnérables.

Le **P-score** est défini par :

```
P-score_t = (D_obs_t - D_att_t) / D_att_t × 100 %
```

## 3. Question de recherche

> *Comment modéliser et tarifer une obligation catastrophe liée à la mortalité en tenant compte de la dépendance dynamique entre les chocs de mortalité extrême et les variations des taux d'intérêt, et quel impact cette dépendance exerce-t-elle sur la prime de risque exigée par les investisseurs ?*

## 4. Cadre méthodologique

### 4.1 Modèle bivarié affine à sauts corrélés

Le modèle proposé s'inscrit dans la famille des **Affine Jump-Diffusions (AJD)** de Duffie, Pan & Singleton (2000). Il spécifie conjointement :

- Le **taux d'intérêt court** *r_t*  (dynamique à sauts corrélés) ;
- L'**intensité de mortalité** *μ_t* (idem) ;
- Un **choc systémique commun** qui déclenche simultanément un saut positif sur μ (surmortalité) et un saut sur r (réaction du marché monétaire).

La structure affine garantit une **forme semi-analytique** pour les prix d'obligations et permet d'utiliser la transformée de Fourier pour le pricing.

### 4.2 Changement de mesure et tarification

- Spécification du **noyau de Radon-Nikodym** *dQ/dP* pour passer de la mesure historique à la mesure risque-neutre.
- Extraction des **primes de risque de mortalité** (λ_μ) et **de taux** (λ_r) à partir des cotations de marché.
- Formule de pricing du CAT bond :

```
P₀ = E^Q [ exp(-∫₀^T r_s ds) · payoff(μ_T) ]
```

où le *payoff* dépend d'un **trigger** basé sur μ_T (perte totale si μ franchit un seuil) ou d'une **indexation continue**.

### 4.3 Modèles de mortalité en concurrence

Revue systématique des approches classiques :

- **Age-Period-Cohort** (APC).
- **Lee-Carter** et extensions (Renshaw-Haberman, CBD).
- **Modèles stochastiques à intensité** (avec/sans sauts).

## 5. Étude empirique — Belgique

- **Analyse descriptive** des données belges de mortalité (2000-2023) et de la courbe zéro-coupon.
- **Calibration sous P** — Méthode des moments généralisés (GMM) et pseudo-maximum de vraisemblance sur les séries historiques.
- **Calibration sous Q** — Ajustement au marché des obligations souveraines belges (OLO) et éventuellement à des instruments de longévité.
- **Analyse de sensibilité** — Impact des primes de risque λ_μ et λ_r sur le prix P₀ pour différentes maturités et triggers.

## 6. Structure du document

| # | Chapitre / Section | Pages |
|---|---|---|
| — | Introduction | 1-2 |
| 1 | **Cadre théorique et revue de la littérature** | 3-20 |
| 1.1 | Les obligations catastrophes (CAT bonds) | 4-12 |
| 1.2 | Le cadre traditionnel : hypothèse d'indépendance | 13 |
| 1.3 | Hypothèse d'indépendance remise en cause | 14-16 |
| 1.4 | Revue sur la dynamique de la mortalité | 17-20 |
| 2 | **Cadre méthodologique et modélisation** | 21-30 |
| 2.1 | Fondements mathématiques des processus stochastiques | 21-22 |
| 2.2 | Spécification du modèle bivarié affine à diffusion avec sauts | 23-25 |
| 2.3 | Tarification des obligations liées à la mortalité | 26-30 |
| 3 | **Étude empirique : cas de la Belgique** | 31-43 |
| 3.1 | Analyse descriptive des données belges | 31-32 |
| 3.2 | Résultats de la calibration sous P | 33-35 |
| 3.3 | Résultats de la calibration sous Q | 36-39 |
| 3.4 | Analyse de sensibilité du prix P₀ aux primes de risque | 40-43 |
| — | Conclusion | 44 |
| A | **Annexes** — Preuves changements de mesure et martingales | i-vi |

## 7. Références principales

- **Msemburi, W. et al. (2022).** The WHO estimates of excess mortality associated with the COVID-19 pandemic. *Nature*.
- **Li, J. et al. (2023).** Pricing mortality-linked CAT bonds with correlated jumps.
- **Xu et al.** Affine mortality models with correlated shocks.
- **Duffie, D., Pan, J. & Singleton, K. (2000).** Transform analysis and asset pricing for affine jump-diffusions. *Econometrica*, 68(6), 1343-1376.
- **Lee, R. & Carter, L. (1992).** Modeling and forecasting U.S. mortality. *JASA*.
- **Cairns, A., Blake, D. & Dowd, K. (2006).** A two-factor model for stochastic mortality. *Journal of Risk and Insurance*.
