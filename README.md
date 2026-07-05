# Master en Sciences Actuarielles — UCLouvain

<p align="center">
  <img src="https://img.shields.io/badge/UCLouvain-Master%20Actuariat-1e3a8a?style=flat-square" alt="UCLouvain"/>
  <img src="https://img.shields.io/badge/Année-2024--2026-6b7280?style=flat-square" alt="Année"/>
  <img src="https://img.shields.io/badge/Langages-Python%20%7C%20R%20%7C%20SAS%20%7C%20VBA-2563eb?style=flat-square" alt="Langages"/>
  <img src="https://img.shields.io/badge/Domaines-Assurance%20Vie%20%7C%20Non--Vie%20%7C%20Finance%20%7C%20ML-16a34a?style=flat-square" alt="Domaines"/>
</p>

> **Portfolio académique de KAMGA BOPDA Davy Romaric**, étudiant en Master en Sciences Actuarielles à l'Institut de Statistique, Biostatistique et Sciences Actuarielles (ISBA) de l'UCLouvain, sous la Faculté des Sciences et la Louvain School of Management. Ce dépôt regroupe les projets réalisés en Master 1 et Master 2, allant de la modélisation de portefeuille en assurance-vie à la tarification d'obligations catastrophes en passant par le deep learning appliqué à l'assurance non-vie.

---

## Table des matières

- [À propos](#à-propos)
- [Compétences mobilisées](#compétences-mobilisées)
- [Structure du dépôt](#structure-du-dépôt)
- [🎓 Mémoire de Master — Obligations catastrophes (CAT Bonds)](#-mémoire-de-master--obligations-catastrophes-cat-bonds)
- [Projets Master 1 et Master 2](#projets-master-1-et-master-2)
  - [1. ALM — Asset & Liability Management](#1-alm--asset--liability-management)
  - [2. Deep Learning for Insurance and Finance](#2-deep-learning-for-insurance-and-finance)
  - [3. Big Data in Finance](#3-big-data-in-finance)
  - [4. Statistical Learning Methods for Insurance](#4-statistical-learning-methods-for-insurance)
  - [5. Data Mining](#5-data-mining)
  - [6. Financial Valuation of Actuarial Liabilities](#6-financial-valuation-of-actuarial-liabilities)
  - [7. Réassurance et échange de risques](#7-réassurance-et-échange-de-risques)
  - [8. Actuarial Finance : Advanced Processes and Life Insurance Engineering](#8-actuarial-finance--advanced-processes-and-life-insurance-engineering)
  - [9. Quantitative Risk Management (QRM)](#9-quantitative-risk-management-qrm)
- [Reproductibilité](#reproductibilité)
- [Contact](#contact)

---

## À propos

Ce dépôt centralise les livrables des projets académiques réalisés au sein du **Master en Sciences Actuarielles (ACTU2M)** de l'UCLouvain durant les années 2024-2025 et 2025-2026. Chaque projet est structuré de manière autonome et contient :

- **Le rapport final** au format PDF (avec les développements mathématiques et l'interprétation des résultats).
- **Le code source** (Python, R, VBA/Excel selon le contexte).
- **Les données** ou fichiers de travail lorsqu'ils accompagnent le rapport.
- **Un README dédié** décrivant les objectifs, la méthodologie et les résultats du projet.

L'ensemble reflète une progression thématique : des fondations en assurance-vie et finance stochastique (M1) vers des applications avancées en machine learning, gestion actif-passif et titrisation des risques (M2), culminant avec un mémoire sur la **tarification des obligations catastrophes liées à la mortalité**.

## Compétences mobilisées

**Mathématiques & Statistiques.** Processus stochastiques (Brownien, Lévy, sauts, diffusion affine), calcul d'Itô, changement de mesure (Girsanov, mesures martingales), modèles de taux (Hull-White G1++, Vasicek, Svensson, bootstrapping de courbe zéro-coupon), modèles de mortalité (Lee-Carter, Age-Period-Cohort, sauts corrélés), inférence statistique, MLE et méthode des moments, GARCH, POT (Peak Over Threshold), copules.

**Machine Learning & Deep Learning.** Régression logistique et linéaire, GLM Poisson/binomial, arbres (CART, Random Forest, Gradient Boosting, XGBoost), Auto-Encodeurs (AE), Auto-Encodeurs Variationnels (VAE), MLP profonds, régularisation ℓ₁/ℓ₂, cross-validation, PDP/ICE pour l'interprétation, embedding de variables catégorielles.

**Actuariat.** Best Estimate, duration, convexité, matching de duration et gap ALM, provisions techniques (mathématiques et participation aux bénéfices), tarification par méthodes actuarielles et financières (arbre binomial, Monte-Carlo, formule fermée), pricing d'options embarquées (GMIB, rentes variables), réassurance (Burning Cost, Poisson-Pareto, XL/Stop-Loss), tarification en assurance non-vie (fréquence-sévérité).

**Programmation.** Python (NumPy, pandas, scikit-learn, TensorFlow/Keras, statsmodels, SciPy), R (rugarch, fGarch, xts, tseries, ggplot2, tidymodels), SAS (base et macros), Excel/VBA (macros de simulation ALM), LaTeX (rédaction scientifique).

## Structure du dépôt

```
Master-Actuariat-UCLouvain/
│
├── 01-Memoire-CAT-Bonds/                          # 🎓 Mémoire de Master 2 (58 pages)
│
├── 02-ALM-Asset-Liability-Management/             # Gestion actif-passif d'un assureur vie
│   ├── code/       (Python — partie stochastique)
│   └── data/       (Excel/VBA — partie déterministe)
│
├── 03-Deep-Learning-Insurance-Finance/            # GLM + AE/VAE sur 87k contrats auto
│   └── code/       (Jupyter Colab, TensorFlow 2.20)
│
├── 04-Big-Data-Finance/                           # Optimisation de portefeuille MSR / MinVar
│   └── code/       (Jupyter — pandas_datareader)
│
├── 05-Statistical-Learning-Insurance/             # Classification — souscription assurance voyage
│   └── code/       (RMarkdown HTML avec code embarqué)
│
├── 06-Data-Mining/                                # Prédiction de sinistres auto
│   └── code/       (SAS / R selon disponibilité)
│
├── 07-Financial-Valuation-Actuarial-Liabilities/  # Best Estimate + pricing produit variable
│   └── code/       (Jupyter — 3 méthodes de pricing)
│
├── 08-Reassurance/                                # Burning Cost et modèle Poisson-Pareto
│   └── data/       (Excel — analyse de sinistres)
│
├── 09-Actuarial-Finance-Levy/                     # Processus de Lévy + GMIB
│
├── 10-QRM-Quantitative-Risk-Management/           # GARCH sur actions
│   └── code/       (R — rugarch, fGarch)
│
├── .gitignore
└── README.md
```

---

## 🎓 Mémoire de Master — Obligations catastrophes (CAT Bonds)

> **Tarification d'obligations catastrophes liées à la mortalité avec sauts corrélés entre mortalité et taux d'intérêt.**
> *Auteur :* KAMGA BOPDA Davy Romaric — *Promoteur :* Karim Barigou — *Année académique :* 2025-2026 — *Master en Sciences Actuarielles ACTU2M*

📄 [Lire le mémoire (PDF, 58 pages)](./01-Memoire-CAT-Bonds/Memoire_KAMGA_BOPDA_Davy_Romaric.pdf)

### Contexte et enjeu

La pandémie de COVID-19 a produit un **choc de mortalité d'une ampleur inédite** : environ **14,8 millions de décès supplémentaires entre janvier 2020 et décembre 2021** selon l'OMS (Msemburi et al., 2022). En Belgique, le P-score a atteint un pic de **17,5 %** en 2020, soit près de **29 000 décès excédentaires sur 2020-2022**, essentiellement concentrés sur la tranche des plus de 65 ans. Ce choc a mis à l'épreuve la solidité des portefeuilles d'assurance-vie et a fait émerger un besoin urgent en **capital contingent**.

Les **obligations catastrophes (CAT bonds) liées à la mortalité** — dont l'exemple emblématique est le *pandemic bond* de la Banque mondiale, déclenché durant la COVID-19 et ayant mobilisé **133 M USD** — constituent un mécanisme de titrisation permettant de transférer le risque de mortalité extrême aux marchés financiers.

### Problématique

Le pricing traditionnel des CAT bonds repose sur une **hypothèse d'indépendance entre le risque de mortalité et les taux d'intérêt**. Or les crises sanitaires majeures modifient simultanément :

- **La probabilité de déclenchement** de l'obligation (via un choc de mortalité extrême) ;
- **Toute la structure des taux d'intérêt** (interventions de politique monétaire, fuite vers la qualité, ajustements de la prime de risque).

Cette **corrélation entre choc de mortalité et taux** crée un effet d'amplification qu'une tarification supposant l'indépendance sous-estime systématiquement. La question centrale du mémoire :

> *Comment modéliser et tarifer une obligation catastrophe liée à la mortalité en tenant compte de la dépendance dynamique entre les chocs de mortalité extrême et les variations des taux d'intérêt, et quel impact cette dépendance exerce-t-elle sur la prime de risque exigée par les investisseurs ?*

### Contribution méthodologique

Le mémoire propose un **modèle affine à sauts corrélés** intégrant explicitement cette dépendance, en s'inspirant des travaux récents de **Li et al. (2023)** et **Xu et al.**. Le cadre méthodologique s'articule autour :

1. **Fondements mathématiques des processus stochastiques** — Diffusions affines avec composante à sauts (Jump-Diffusion), théorie des semi-martingales, changement de mesure (P → Q).
2. **Modèle bivarié affine à diffusion avec sauts** — Modélisation conjointe du taux d'intérêt court r_t et de l'intensité de mortalité μ_t, avec des chocs communs (sauts corrélés) permettant de capter la dépendance dans la queue des distributions.
3. **Tarification** — Formule de pricing sous mesure risque-neutre Q, avec calcul du prix P₀ de l'obligation à mortalité par transformée de Fourier / méthode semi-analytique.

### Étude empirique : cas de la Belgique

- **Données** — Séries de mortalité et courbes de taux belges couvrant la période récente (incluant la fenêtre pandémique 2020-2022).
- **Calibration sous P** — Estimation historique des paramètres du modèle bivarié (drift, volatilité, intensité et taille des sauts corrélés).
- **Calibration sous Q** — Ajustement au marché des obligations et des instruments dérivés pour extraire les primes de risque de mortalité et de taux.
- **Analyse de sensibilité** — Impact des primes de risque sur le prix P₀ de la CAT bond.

### Structure du mémoire

| Chapitre | Contenu | Pages |
|---|---|---|
| **1. Cadre théorique** | CAT bonds, hypothèse d'indépendance (traditionnelle et remise en cause), revue sur la dynamique de la mortalité | 3-20 |
| **2. Cadre méthodologique** | Fondements des processus stochastiques, spécification du modèle bivarié affine à diffusion avec sauts, tarification | 21-30 |
| **3. Étude empirique** | Analyse descriptive des données belges, calibration sous P et Q, analyse de sensibilité du prix P₀ aux primes de risque | 31-43 |
| **Conclusion** | | 44 |
| **Annexes A** | Preuves relatives aux changements de mesure et martingales, dynamique du modèle, graphiques et diagnostics | i-vi |

### Références clés

- Li, J. et al. (2023). *Pricing mortality-linked CAT bonds*.
- Xu et al. — Affine mortality models with jumps.
- Msemburi, W. et al. (2022). *The WHO estimates of excess mortality associated with the COVID-19 pandemic*. **Nature**.
- Duffie, D., Pan, J., & Singleton, K. (2000). *Transform Analysis and Asset Pricing for Affine Jump-Diffusions*. **Econometrica**.

---

## Projets Master 1 et Master 2

### 1. ALM — Asset & Liability Management

📁 [`02-ALM-Asset-Liability-Management/`](./02-ALM-Asset-Liability-Management/)  · *Cours : ALM — Prof. Jérôme Barbarin* · *Équipe : Diendéré Wend K.O., Kamga Bopda D.R., Zitan L.*

**Question de fond.** *« Lorsque les taux bougent, qu'arrive-t-il aux fonds propres d'un assureur-vie ? »*

**Partie I — Modèle déterministe** (Excel/VBA)
- **Bootstrapping de la courbe zéro-coupon** à partir des obligations de marché.
- **Valorisation des provisions techniques** (approche flux + actualisation).
- **Analyse du gap de duration** actif-passif — mise en évidence de l'asymétrie structurelle : *les passifs sont notablement plus longs que les actifs*.
- **Couverture par swap à départ différé** pour aligner les sensibilités.

**Partie II — Modèle stochastique** (Python, notebook)
- **Modèle Hull-White G1++** calibré aux caps/swaptions.
- **Simulations Monte-Carlo** de trajectoires de taux sous mesure risque-neutre.
- **Participation aux bénéfices** modélisée comme option embarquée dans les provisions.
- **Reconstitution de la distribution du P&L** sous mesure historique — calcul de VaR, Expected Shortfall.
- **Deux variantes** : avec option de rachat des assurés / sans rachat (fichiers séparés `ALM_avec_rachat.xlsm` et `ALM_sans_rachat.xlsm`).

### 2. Deep Learning for Insurance and Finance

📁 [`03-Deep-Learning-Insurance-Finance/`](./03-Deep-Learning-Insurance-Finance/) · *Cours LDATS2310 — Prof. Donatien Hainaut* · *Projet individuel*

**Données.** 87 228 contrats d'assurance flotte automobile décrits par 22 variables contractuelles, géographiques et comportementales.

**Objectif.** Prédire la **fréquence de sinistres** *f_i = N_i / ν_i* (avec exposition ν_i), en comparant des approches classiques et profondes.

**Deux axes.**
1. **Fréquence — GLM Poisson vs Deep NN.** Ajustement d'un GLM Poisson (baseline) et de **quatre réseaux de neurones profonds** de différentes architectures. Interprétation via **Partial Dependence Plots (PDP)** et **Individual Conditional Expectation (ICE)** pour rendre les réseaux « boîte-blanche ».
2. **Clustering non-supervisé — AE et VAE.** Compression des contrats dans un **espace latent** via **Auto-Encodeurs** (AE) et **Auto-Encodeurs Variationnels** (VAE), puis clustering k-means sur les représentations latentes.

**Notes techniques.**
- Encodage **one-hot** de toutes les variables (57 modalités totales pour AE/VAE, 44 pour GLM/DNN afin d'éviter la multicolinéarité).
- Traitement de `Valeur_assuree` avec 99,85 % de valeurs manquantes → variable supprimée (imputation statistiquement incohérente).
- TensorFlow 2.20, Google Colab GPU.

### 3. Big Data in Finance

📁 [`04-Big-Data-Finance/`](./04-Big-Data-Finance/) · *Cours LLSMS2138 — Prof. Nathan Lassance (Louvain School of Management)* · *Équipe : Kamga, Agogue De Tetio, Dinock, Thiry*

**Sujet.** Comparaison d'**allocations d'actifs multivariées** dans un contexte Big Data (grand nombre d'actifs, matrice de covariance mal conditionnée).

**Stratégies testées.**
- **Baselines** — Maximum Sharpe Ratio (MSR), Minimum Variance (MinVar), 1/N (Equal-Weight).
- **MinVar régularisé** — Portefeuille MinVar avec pénalité **ℓ₂ (Ridge)**, contrôlée par un hyperparamètre γ.
- **Sélection optimale de γ** — Cross-validation temporelle pour choisir γ hors-échantillon.
- Analyse *in-sample* vs *out-of-sample* et discussion des trois enseignements principaux + best practices pour l'évaluation out-of-sample.

### 4. Statistical Learning Methods for Insurance

📁 [`05-Statistical-Learning-Insurance/`](./05-Statistical-Learning-Insurance/) · *Cours LACTU2310 — Prof. Karim Barigou* · *Projet individuel*

**Contexte.** En 2019, une agence de voyages a proposé à ses ~2 000 clients une **assurance voyage intégrant une couverture Covid-19**. Seuls **36 %** ont souscrit.

**Objectif.** Modèle de **classification binaire** pour prédire la probabilité de souscription future en fonction des caractéristiques sociodémographiques, habitudes de voyage et historique médical — assimilable à un exercice de **claim occurrence modeling**.

**Méthodologie.**
- Pré-processing : recodage de `ChronicDiseases` (binaire), `FamilyMembers` (discret).
- **Régression logistique binomiale** de base (référence : Frees, 2010).
- **Méthodes ensemblistes** — Random Forest, Gradient Boosting, XGBoost.
- Évaluation par AUC-ROC, matrice de confusion, calibration.
- Deux versions du rapport (soutenance 07/2025 puis version révisée 06/2026) + support de présentation.

### 5. Data Mining

📁 [`06-Data-Mining/`](./06-Data-Mining/) · *Cours LDATS2350 — Prof. Robin Van Oirbeek* · *Équipe : Daktou Tchagam Martial, Kamga Bopda D.R., Dinock Dinock Y.B.*

**Objectif.** Prédire la survenue d'un accident automobile (`claimNumbMD`) à partir des caractéristiques d'un contrat d'assurance.

**Données.** 24 774 observations, 11 variables décrivant les assurés, véhicules, environnement — aucune valeur manquante.

**Méthodologie.**
- **Analyse exploratoire** : prétraitement, statistiques descriptives, **détection des valeurs aberrantes**, analyse d'asymétrie/aplatissement, inférence statistique sur la relation avec la cible.
- **Modélisation** : régression, comparaison de plusieurs modèles prédictifs, identification des facteurs les plus influents.

### 6. Financial Valuation of Actuarial Liabilities

📁 [`07-Financial-Valuation-Actuarial-Liabilities/`](./07-Financial-Valuation-Actuarial-Liabilities/) · *Cours LACTU2170 — Prof. Donatien Hainaut* · *Équipe : Kamga Bopda, Dinock Dinock*

Ce projet en **deux parties** met en pratique les fondamentaux de la valorisation actuarielle sous incertitude financière et démographique.

**Partie I — Best Estimate et sensibilité**
- **Estimation de la courbe zéro-coupon** à partir des obligations souveraines (intérêts courus, Dirty Price, rendements/yields).
- **Lissage par le modèle de Svensson** (6 paramètres).
- **Bootstrapping des taux spots**.
- **Calcul du Best Estimate** (flux actualisés et probabilisés en vie et décès).
- **Sensibilité** — calcul du yield, de la **duration modifiée**, de la **convexité**.
- **Résultat** : BE négatif (favorable à l'assureur — marge bénéficiaire), avec discussion des limites liées à l'hypothèse de μ instantanément constant.

**Partie II — Pricing d'un produit variable annuity**
- Produit combinant **assurance-vie** (taux de mortalité) et **finance** (fonds risqué + retrait garanti KT).
- Décomposition de la prime V₀ : partie déterministe *γF₀ Σ ₖ p_x (1−γ)ᵏ* + partie **option-like** *E^Q[(S_T − K_T/A)₊]* .
- Trois méthodes de pricing comparées : **arbre binomial**, **Monte-Carlo**, et **analyse d'actifs corrélés**.
- Étude de **convergence** des trois méthodes.

### 7. Réassurance et échange de risques

📁 [`08-Reassurance/`](./08-Reassurance/) · *Cours Réassurance — Prof. Philippe De Longueville* · *Équipe (Groupe 6) : Diendéré Wend, Bopda Davy Romaric*

**Objectif.** Tarifer plusieurs traités de réassurance (couches XL) sur un portefeuille de sinistres réels.

**Méthodologie.**
1. **Préparation des données** : indexation des primes et des sinistres à une date de référence (indice économique), calcul de l'**Incurred Loss** et de l'**Indexed Incurred Loss**.
2. **Burning Cost** — avec et sans indexation.
3. **Modèle Poisson-Pareto**
   - Extrapolation de la fréquence λ_P dans la couche.
   - Espérance de paiement par sinistre E(Y_P) dans la couche.
   - Application numérique à deux couches (moyenne et haute).
   - **Estimation des paramètres** (MLE) et **validation graphique** (QQ-plots, mean excess plot).
   - Calcul de la **prime pure**.
4. Comparaison des approches, discussion du choix de la couche et interprétation.

### 8. Actuarial Finance : Advanced Processes and Life Insurance Engineering

📁 [`09-Actuarial-Finance-Levy/`](./09-Actuarial-Finance-Levy/) · *Cours LACTU2240 — Prof. Donatien Hainaut* · *Équipe : Daktou Tchagam M., Kamga Bopda D.R.*

**Partie I — Processus de Lévy sur le S&P 500**
Données : log-rendements journaliers du S&P 500 sur **07/08/2020 – 07/08/2025** (source Investing.com).

Trois processus ajustés :
1. **Mouvement Brownien avec dérive (BMD)** — méthode des moments.
2. **Diffusion avec sauts négatifs Gamma** — calibration **Peak Over Threshold (POT)**.
3. **Processus Normal Inverse Gaussien (NIG)** — méthode des moments.

Évaluation de la capacité de chaque modèle à reproduire l'**asymétrie et le kurtosis empirique** des log-rendements. Simulations et calibration sous **mesure risque-neutre**.

**Partie II — Tarification d'un GMIB**
- Pricing d'un **Guaranteed Minimum Income Benefit** (rente garantie sur produit variable).
- Étude des **propriétés de V₀(c_min)** en fonction du taux de retrait garanti.
- Méthode de résolution numérique et analyse de résultats.

### 9. Quantitative Risk Management (QRM)

📁 [`10-QRM-Quantitative-Risk-Management/`](./10-QRM-Quantitative-Risk-Management/) · *Projet en R* · *Équipe : Kamga Bopda D.R., Mafeulo Tavinia*

Analyse quantitative des risques sur un portefeuille d'actions (dont Caterpillar `CAT`) via modèles **GARCH** :

- Traitement de la série temporelle (`xts`, `TTR`), tests de normalité (`nortest`, `tseries`).
- Statistiques d'ordre supérieur (asymétrie, kurtosis) via `moments`.
- **Modèles GARCH univariés** (`rugarch`, `fGarch`) : GARCH(1,1), GJR-GARCH, EGARCH.
- Tests de spécification (**ARCH-LM**, autocorrélation des résidus) via `FinTS`, `lmtest`.
- Estimation de mesures de risque (Value-at-Risk, Expected Shortfall) sur horizon glissant.

> *Note : le rapport final PDF associé n'était pas disponible au moment de la mise en ligne du dépôt ; le code R est fourni tel quel avec les commentaires méthodologiques.*

---

## Reproductibilité

### Environnement Python

Les notebooks ont été développés majoritairement sur **Google Colab** (Python 3.10-3.12). Pour reproduire localement :

```bash
# Créer un environnement virtuel
python3 -m venv .venv
source .venv/bin/activate   # ou .venv\Scripts\activate sous Windows

# Dépendances principales (à adapter selon le projet)
pip install numpy pandas scipy scikit-learn matplotlib seaborn statsmodels
pip install tensorflow==2.20.0 keras
pip install pandas_datareader yfinance
pip install jupyter notebook
```

### Environnement R

```r
install.packages(c(
  "xts", "TTR", "moments", "nortest", "tseries",
  "rugarch", "fGarch", "lmtest", "FinTS",
  "tidyverse", "tidymodels"
))
```

### Excel / VBA

Les fichiers `.xlsm` (macros) sont ouvrables avec **Microsoft Excel 2016 ou ultérieur**. Activer les macros à l'ouverture pour reproduire les simulations ALM déterministes.

## Contact

**KAMGA BOPDA Davy Romaric**
Étudiant en Master en Sciences Actuarielles — UCLouvain (ISBA)
📧 kamgabopda@gmail.com
🔗 [GitHub — @KAMGAdavyromaric](https://github.com/KAMGAdavyromaric)

---

<sub>© 2024-2026 — KAMGA BOPDA Davy Romaric · Ces travaux sont mis à disposition à des fins pédagogiques et de portfolio. Toute réutilisation académique doit citer l'auteur et l'UCLouvain. Les données de certains projets restent la propriété de leurs détenteurs (UCLouvain, partenaires industriels).</sub>
