# Master en Sciences Actuarielles — UCLouvain

**KAMGA BOPDA Davy Romaric** · Institut de Statistique, Biostatistique et Sciences Actuarielles (ISBA) · Promotion 2024-2026

Ce dépôt rassemble dix projets menés pendant le Master en Sciences Actuarielles (ACTU2M) de l'UCLouvain, du mémoire sur la titrisation du risque de mortalité à la tarification de traités de réassurance. Chaque dossier contient le rapport, le code et un README propre.

L'objectif de ce portfolio n'est pas de montrer que j'ai suivi des cours. C'est de montrer que chacun de ces travaux répond à une question qu'une compagnie d'assurance, un réassureur ou une direction des risques se pose réellement. Chaque projet est donc présenté avec la problématique métier qu'il permet de traiter.

---

## Sommaire

- [Ce que chaque projet permet de résoudre](#ce-que-chaque-projet-permet-de-résoudre)
- [Compétences techniques](#compétences-techniques)
- [Structure du dépôt](#structure-du-dépôt)
- [Mémoire de Master : obligations catastrophes liées à la mortalité](#mémoire-de-master--obligations-catastrophes-liées-à-la-mortalité)
- [Projets de Master 1 et Master 2](#projets-de-master-1-et-master-2)
- [Reproductibilité](#reproductibilité)
- [Contact](#contact)

---

## Ce que chaque projet permet de résoudre

| Projet | Problématique d'entreprise traitée | Fonction concernée |
|---|---|---|
| [Mémoire : CAT bonds mortalité](#mémoire-de-master--obligations-catastrophes-liées-à-la-mortalité) | Transférer un risque de mortalité extrême aux marchés financiers et savoir de combien le prix bouge si l'on cesse de supposer mortalité et taux indépendants | Réassurance vie, ILS, ORSA |
| [ALM](#1-alm-gestion-actif-passif-dun-assureur-vie) | Quantifier la perte de fonds propres d'un assureur vie quand les taux bougent, et construire la couverture | ALM, risque marché, Solvabilité II |
| [Deep Learning](#2-deep-learning-appliqué-à-lassurance-et-à-la-finance) | Savoir si un réseau de neurones justifie sa perte de lisibilité face à un GLM sur la tarification auto | Tarification non-vie, data science |
| [Big Data en finance](#3-big-data-in-finance-allocation-dactifs-en-grande-dimension) | Construire un portefeuille stable quand la matrice de covariance est mal conditionnée | Gestion d'actifs, allocation stratégique |
| [Statistical Learning](#4-statistical-learning-propension-à-souscrire-une-assurance-voyage) | Prédire quels clients souscriront une garantie, pour cibler une campagne | Marketing produit, souscription |
| [Data Mining](#5-data-mining-prédiction-de-la-survenance-dun-sinistre-auto) | Identifier les variables qui prédisent réellement la survenance d'un sinistre auto | Tarification, sélection des risques |
| [Valorisation financière des passifs](#6-financial-valuation-of-actuarial-liabilities) | Calculer un Best Estimate conforme au pilier 1 et chiffrer une option embarquée | Provisionnement, développement produit |
| [Réassurance](#7-réassurance-et-échange-de-risques) | Tarifer une couche XL et juger si la prime demandée par le réassureur est raisonnable | Réassurance, souscription non-vie |
| [Finance actuarielle et processus de Lévy](#8-actuarial-finance-processus-de-lévy-et-ingénierie-de-lassurance-vie) | Remplacer l'hypothèse gaussienne par un modèle qui reproduit les queues épaisses observées | Capital économique, pricing de garanties |
| [Quantitative Risk Management](#9-quantitative-risk-management) | Backtester une VaR et modéliser la dépendance extrême entre actifs | Risk management, modèle interne |

---

## Compétences techniques

**Probabilités et processus stochastiques.** Calcul d'Itô, semi-martingales, changement de mesure (Girsanov, mesures martingales équivalentes), diffusions affines avec sauts, processus de Lévy (NIG, jump-diffusion), modèles de taux (Hull-White G1++, Vasicek, Svensson), modèles de mortalité (Lee-Carter, Age-Period-Cohort, sauts corrélés).

**Statistique et économétrie.** Maximum de vraisemblance, méthode des moments, inférence et tests de spécification, GARCH univarié et multivarié (BEKK), théorie des valeurs extrêmes (Peak Over Threshold), copules et dépendance de queue.

**Machine learning.** GLM Poisson et binomial, régression logistique, CART, Random Forest, Gradient Boosting, XGBoost, réseaux de neurones profonds, auto-encodeurs et auto-encodeurs variationnels, régularisation ℓ1 et ℓ2, validation croisée temporelle, interprétabilité par PDP et ICE.

**Actuariat.** Best Estimate, duration et convexité, gap ALM, provisions techniques et participation aux bénéfices, pricing d'options embarquées (GMIB, variable annuities), réassurance (burning cost, Poisson-Pareto, XL et stop-loss), tarification fréquence-sévérité, VaR et Expected Shortfall.

**Outils.** Python (NumPy, pandas, scikit-learn, TensorFlow et Keras, statsmodels, SciPy), R (rugarch, fGarch, BEKKs, copula, xts, tidyverse), SAS (base et macros), Excel et VBA, LaTeX.

---

## Structure du dépôt

```
Master-Actuariat-UCLouvain/
├── 01-Memoire-CAT-Bonds/                          Mémoire de Master 2 (58 pages)
├── 02-ALM-Asset-Liability-Management/             Gestion actif-passif d'un assureur vie
│   ├── code/                                      Python, partie stochastique
│   └── data/                                      Excel et VBA, partie déterministe
├── 03-Deep-Learning-Insurance-Finance/            GLM et réseaux profonds sur 87k contrats
│   └── code/                                      Jupyter, TensorFlow 2.20
├── 04-Big-Data-Finance/                           Allocation MSR, MinVar et régularisation
│   └── code/                                      Jupyter
├── 05-Statistical-Learning-Insurance/             Classification, souscription assurance voyage
│   └── code/                                      RMarkdown
├── 06-Data-Mining/                                Prédiction de sinistres auto
│   └── code/                                      SAS et R
├── 07-Financial-Valuation-Actuarial-Liabilities/  Best Estimate et pricing d'une VA
│   └── code/                                      Jupyter, trois méthodes de pricing
├── 08-Reassurance/                                Burning cost et modèle Poisson-Pareto
│   └── data/                                      Excel
├── 09-Actuarial-Finance-Levy/                     Processus de Lévy et GMIB
├── 10-QRM-Quantitative-Risk-Management/           GARCH, BEKK et copules
│   └── code/                                      R, deux projets
├── .gitignore
└── README.md
```

---

## Mémoire de Master : obligations catastrophes liées à la mortalité

> **Tarification d'obligations catastrophes liées à la mortalité avec sauts corrélés entre mortalité et taux d'intérêt**
> Promoteur : Karim Barigou · Année académique 2025-2026

[Lire le mémoire (PDF, 58 pages)](./01-Memoire-CAT-Bonds/Memoire_KAMGA_BOPDA_Davy_Romaric.pdf)

### Valeur en entreprise

Un assureur vie qui a vécu 2020 sait ce que coûte un choc de mortalité. La question qui suit est de savoir comment s'en protéger sans immobiliser du capital, et à quel prix.

Ce mémoire outille trois décisions. Pour une cédante : dimensionner un transfert de risque pandémique vers les marchés, en alternative ou en complément d'un traité de réassurance. Pour un investisseur en ILS : valoriser un titre CAT mortalité en portefeuille. Pour une équipe ORSA : construire un scénario pandémique qui ne suppose pas que les taux restent sagement où ils sont pendant que la mortalité explose.

Le résultat central est un avertissement de méthode. Le pricing standard suppose l'indépendance entre risque de mortalité et taux d'intérêt. Cette hypothèse est fausse en crise sanitaire, et elle est fausse dans le sens qui arrange le vendeur : elle sous-estime systématiquement la prime de risque exigible.

### Contexte

Le COVID-19 a produit environ **14,8 millions de décès excédentaires entre janvier 2020 et décembre 2021** (Msemburi et al., 2022, *Nature*). En Belgique, le P-score a culminé à **17,5 %** en 2020, pour près de **29 000 décès excédentaires sur 2020-2022**, concentrés sur les plus de 65 ans.

Les obligations catastrophes liées à la mortalité titrisent ce risque. Le *pandemic bond* de la Banque mondiale, déclenché pendant la pandémie, a mobilisé **133 millions USD**.

### Problématique

Une crise sanitaire majeure déplace simultanément la probabilité de déclenchement de l'obligation et toute la structure des taux, par le jeu des interventions monétaires et de la fuite vers la qualité. Cette corrélation crée un effet d'amplification qu'un pricing sous hypothèse d'indépendance ne voit pas.

> Comment modéliser et tarifer une obligation catastrophe liée à la mortalité en tenant compte de la dépendance dynamique entre chocs de mortalité extrême et variations de taux, et quel impact cette dépendance exerce-t-elle sur la prime de risque exigée par les investisseurs ?

### Approche

Un modèle affine bivarié à sauts corrélés, dans la lignée de Li et al. (2023) et Xu et al., qui modélise conjointement le taux court r_t et l'intensité de mortalité μ_t avec des sauts communs. La tarification se fait sous mesure risque-neutre par méthode semi-analytique et transformée de Fourier.

L'étude empirique porte sur des données belges couvrant la fenêtre pandémique : calibration historique sous P, calibration au marché sous Q pour extraire les primes de risque, puis analyse de sensibilité du prix P₀.

### Structure

| Chapitre | Contenu | Pages |
|---|---|---|
| 1. Cadre théorique | CAT bonds, remise en cause de l'hypothèse d'indépendance, dynamique de la mortalité | 3-20 |
| 2. Cadre méthodologique | Processus stochastiques, modèle bivarié affine à sauts, tarification | 21-30 |
| 3. Étude empirique | Données belges, calibration sous P et Q, sensibilité du prix aux primes de risque | 31-43 |
| Conclusion | | 44 |
| Annexe A | Preuves des changements de mesure, dynamique du modèle, diagnostics | i-vi |

### Références principales

- Li, J. et al. (2023). *Pricing mortality-linked CAT bonds*.
- Xu et al. *Affine mortality models with jumps*.
- Msemburi, W. et al. (2022). *The WHO estimates of excess mortality associated with the COVID-19 pandemic*. Nature.
- Duffie, D., Pan, J. et Singleton, K. (2000). *Transform Analysis and Asset Pricing for Affine Jump-Diffusions*. Econometrica.

---

## Projets de Master 1 et Master 2

### 1. ALM, gestion actif-passif d'un assureur vie

[`02-ALM-Asset-Liability-Management/`](./02-ALM-Asset-Liability-Management/)
*Cours ALM, Prof. Jérôme Barbarin · Équipe : Diendéré Wend K.O., Kamga Bopda D.R., Zitan L.*

**Valeur en entreprise.** Les passifs d'un assureur vie sont structurellement plus longs que ses actifs. Une variation de taux ne touche donc pas les deux côtés du bilan de la même façon, et l'écart se paie en fonds propres. Ce projet mesure ce gap de duration, construit la couverture par swap à départ différé, puis simule la distribution complète du résultat pour en extraire VaR et Expected Shortfall.

C'est le travail courant d'une équipe ALM, et la matière première du module de risque de taux du SCR sous Solvabilité II. La modélisation de la participation aux bénéfices comme option embarquée est le point qui distingue un vrai modèle ALM vie d'un simple appariement de flux.

**Partie I, modèle déterministe (Excel et VBA).** Bootstrapping de la courbe zéro-coupon à partir des obligations de marché, valorisation des provisions techniques par actualisation des flux, analyse du gap de duration actif-passif, couverture par swap à départ différé.

**Partie II, modèle stochastique (Python).** Modèle Hull-White G1++ calibré sur caps et swaptions, simulations Monte-Carlo sous mesure risque-neutre, participation aux bénéfices traitée comme option embarquée, reconstitution de la distribution du P&L sous mesure historique. Deux variantes selon que l'option de rachat des assurés est activée ou non (`ALM_avec_rachat.xlsm` et `ALM_sans_rachat.xlsm`).

### 2. Deep Learning appliqué à l'assurance et à la finance

[`03-Deep-Learning-Insurance-Finance/`](./03-Deep-Learning-Insurance-Finance/)
*Cours LDATS2310, Prof. Donatien Hainaut · Projet individuel*

**Valeur en entreprise.** La vraie question d'une direction technique n'est pas « le réseau de neurones bat-il le GLM ». C'est « le gain de précision justifie-t-il de présenter un modèle opaque à un régulateur et à un comité tarifaire ». Ce projet traite les deux volets : il compare les performances, et il rend les réseaux interprétables par PDP et ICE, ce qui permet de défendre le modèle devant quelqu'un qui ne fait pas de deep learning.

Le second axe, la compression par auto-encodeurs, sert à segmenter un portefeuille sans a priori. C'est utile pour repérer des sous-populations mal tarifées que la grille actuelle mélange.

**Données.** 87 228 contrats de flotte automobile, 22 variables contractuelles, géographiques et comportementales.

**Objectif.** Prédire la fréquence de sinistres f_i = N_i / ν_i, avec ν_i l'exposition.

**Axe 1, fréquence.** GLM Poisson en référence, puis quatre réseaux profonds d'architectures différentes. Interprétation par Partial Dependence Plots et Individual Conditional Expectation.

**Axe 2, clustering non supervisé.** Compression des contrats dans un espace latent par auto-encodeurs et auto-encodeurs variationnels, puis k-means sur les représentations latentes.

**Notes techniques.** Encodage one-hot de toutes les variables : 57 modalités pour les AE et VAE, 44 pour le GLM et les réseaux afin d'éviter la multicolinéarité. La variable `Valeur_assuree` présentait 99,85 % de valeurs manquantes et a été supprimée, toute imputation étant statistiquement indéfendable à ce taux. TensorFlow 2.20 sur GPU Colab.

### 3. Big Data in Finance, allocation d'actifs en grande dimension

[`04-Big-Data-Finance/`](./04-Big-Data-Finance/)
*Cours LLSMS2138, Prof. Nathan Lassance (Louvain School of Management) · Équipe : Kamga, Agogue De Tetio, Dinock, Thiry*

**Valeur en entreprise.** Quand le nombre d'actifs approche la longueur de l'historique, la matrice de covariance estimée devient instable. Les poids optimaux qui en sortent bougent violemment d'une période à l'autre, ce qui se traduit en frais de transaction et en performance out-of-sample décevante. La régularisation Ridge stabilise ces poids, et le choix de l'intensité de pénalisation se fait en validation temporelle et non à l'œil.

Transposable directement à la gestion d'actifs et à l'allocation stratégique d'un assureur. Le projet insiste aussi sur les bonnes pratiques d'évaluation hors échantillon, ce qui est le point où la plupart des backtests se trompent.

**Stratégies comparées.** Maximum Sharpe Ratio, Minimum Variance, équipondération 1/N en référence naïve, puis MinVar régularisé par pénalité ℓ2 avec hyperparamètre γ sélectionné par validation croisée temporelle. Analyse in-sample contre out-of-sample.

### 4. Statistical Learning, propension à souscrire une assurance voyage

[`05-Statistical-Learning-Insurance/`](./05-Statistical-Learning-Insurance/)
*Cours LACTU2310, Prof. Karim Barigou · Projet individuel*

**Valeur en entreprise.** Une agence a proposé en 2019 une assurance voyage avec couverture Covid à environ 2 000 clients. 36 % ont souscrit. Savoir prédire qui souscrira permet de cibler la campagne suivante au lieu de la diffuser à tout le fichier.

La mécanique est identique à celle d'un modèle de résiliation ou de survenance de sinistre : variable binaire, données sociodémographiques et comportementales, arbitrage entre lisibilité et performance. Ce qui est transférable, c'est le pipeline complet, du recodage des variables à l'évaluation par AUC et à la calibration des probabilités prédites.

**Méthodologie.** Recodage de `ChronicDiseases` en binaire et de `FamilyMembers` en discret, régression logistique binomiale de référence (Frees, 2010), puis Random Forest, Gradient Boosting et XGBoost. Évaluation par AUC-ROC, matrice de confusion et courbe de calibration. Deux versions du rapport (soutenance de juillet 2025, révision de juin 2026) et le support de présentation.

### 5. Data Mining, prédiction de la survenance d'un sinistre auto

[`06-Data-Mining/`](./06-Data-Mining/)
*Cours LDATS2350, Prof. Robin Van Oirbeek · Équipe : Daktou Tchagam Martial, Kamga Bopda D.R., Dinock Dinock Y.B.*

**Valeur en entreprise.** Une grille tarifaire auto repose sur un petit nombre de variables réellement discriminantes. Le projet part de 11 variables candidates sur 24 774 contrats et hiérarchise leur pouvoir explicatif sur la survenance d'un accident. Le travail de détection des valeurs aberrantes, souvent négligé, conditionne la qualité de tout ce qui suit : un outlier non traité déforme les coefficients et donc le tarif.

Sortie exploitable en tarification et en sélection des risques.

**Données.** 24 774 observations, 11 variables sur les assurés, les véhicules et l'environnement, aucune valeur manquante. Cible : `claimNumbMD`.

**Méthodologie.** Analyse exploratoire avec prétraitement, statistiques descriptives, détection des valeurs aberrantes, analyse d'asymétrie et d'aplatissement, inférence sur la relation à la cible. Puis modélisation par régression et comparaison de plusieurs modèles prédictifs.

### 6. Financial Valuation of Actuarial Liabilities

[`07-Financial-Valuation-Actuarial-Liabilities/`](./07-Financial-Valuation-Actuarial-Liabilities/)
*Cours LACTU2170, Prof. Donatien Hainaut · Équipe : Kamga Bopda, Dinock Dinock*

**Valeur en entreprise.** La partie I refait, de bout en bout, ce que le pilier 1 de Solvabilité II exige : construire une courbe de taux à partir des prix de marché, actualiser des flux probabilisés, et mesurer la sensibilité du résultat aux taux par duration modifiée et convexité. C'est le socle de tout provisionnement.

La partie II répond à une question de développement produit : combien coûte réellement la garantie qu'on met dans un contrat en unités de compte ? La prime se décompose en une partie déterministe et une partie optionnelle, et c'est cette seconde composante qui explique pourquoi certains produits à garantie ont ruiné leurs émetteurs. Croiser trois méthodes de pricing et vérifier qu'elles convergent est ce qu'un actuaire fait avant de valider un modèle.

**Partie I, Best Estimate et sensibilité.** Estimation de la courbe zéro-coupon à partir des obligations souveraines (intérêts courus, dirty price, rendements), lissage par le modèle de Svensson à six paramètres, bootstrapping des taux spots, calcul du Best Estimate sur flux actualisés et probabilisés en vie et en décès, puis yield, duration modifiée et convexité. Le Best Estimate ressort négatif, donc favorable à l'assureur, avec une discussion des limites liées à l'hypothèse d'une intensité de mortalité instantanément constante.

**Partie II, pricing d'une variable annuity.** Produit combinant mortalité et fonds risqué avec retrait garanti K_T. Décomposition de la prime V₀ entre partie déterministe et partie optionnelle E^Q[(S_T − K_T/A)₊]. Trois méthodes comparées : arbre binomial, Monte-Carlo, analyse d'actifs corrélés, avec étude de convergence.

### 7. Réassurance et échange de risques

[`08-Reassurance/`](./08-Reassurance/)
*Cours Réassurance, Prof. Philippe De Longueville · Groupe 6 : Diendéré Wend, Kamga Bopda Davy Romaric*

**Valeur en entreprise.** Deux métiers utilisent exactement ce travail. Le réassureur, pour fixer le prix d'une couche. La cédante, pour savoir si le prix proposé est défendable avant de signer.

La difficulté est connue : les couches hautes sont rarement touchées, donc l'historique ne suffit pas à estimer la prime. Le burning cost indexé donne un point de départ, le modèle Poisson-Pareto permet d'extrapoler au-delà de ce qui a été observé. Le projet applique les deux à deux couches, avec validation graphique de l'ajustement Pareto par QQ-plot et mean excess plot, ce qui évite d'extrapoler avec un modèle qui ne colle pas.

**Méthodologie.** Indexation des primes et des sinistres à une date de référence, calcul de l'incurred loss et de l'indexed incurred loss. Burning cost avec et sans indexation. Modèle Poisson-Pareto : extrapolation de la fréquence λ_P dans la couche, espérance de paiement par sinistre E(Y_P), estimation des paramètres par maximum de vraisemblance, validation graphique, calcul de la prime pure. Application à une couche moyenne et une couche haute, puis comparaison des approches.

### 8. Actuarial Finance, processus de Lévy et ingénierie de l'assurance vie

[`09-Actuarial-Finance-Levy/`](./09-Actuarial-Finance-Levy/)
*Cours LACTU2240, Prof. Donatien Hainaut · Équipe : Daktou Tchagam M., Kamga Bopda D.R.*

**Valeur en entreprise.** Un modèle gaussien ne reproduit ni l'asymétrie ni les queues épaisses des rendements observés. Utilisé pour calculer un capital économique ou pour tarifer une garantie longue, il donne des chiffres trop bas, et l'erreur est d'autant plus grande que l'on regarde loin dans la queue.

Le projet quantifie l'écart en calibrant trois processus sur cinq ans de S&P 500 et en confrontant leur skewness et leur kurtosis théoriques aux valeurs empiriques. La partie GMIB applique ensuite le résultat à un produit réel : le coût d'une garantie de rente minimale dépend directement du modèle de rendement retenu.

**Partie I, processus de Lévy sur le S&P 500.** Log-rendements journaliers du 7 août 2020 au 7 août 2025 (source Investing.com). Trois processus ajustés : mouvement brownien avec dérive par méthode des moments, diffusion avec sauts négatifs Gamma calibrée par Peak Over Threshold, processus Normal Inverse Gaussien par méthode des moments. Évaluation de la capacité de chacun à reproduire l'asymétrie et le kurtosis empiriques, puis simulation sous mesure risque-neutre.

**Partie II, tarification d'un GMIB.** Pricing d'un Guaranteed Minimum Income Benefit, étude des propriétés de V₀(c_min) en fonction du taux de retrait garanti, résolution numérique et analyse des résultats.

### 9. Quantitative Risk Management

[`10-QRM-Quantitative-Risk-Management/`](./10-QRM-Quantitative-Risk-Management/)
*Cours LACTU2210, Prof. Christian Hafner · Équipe : Kamga Bopda D.R., Mafeulo Tavinia*

**Valeur en entreprise.** Ce projet produit un résultat qu'une direction des risques devrait vouloir connaître : la VaR à 1 % calculée sous hypothèse gaussienne à partir d'un BEKK bivarié est dépassée **1,73 % des jours** au lieu de 1 %. Elle sous-estime le risque, et un backtesting réglementaire la rejetterait.

La cause est identifiée dans la seconde partie. La dépendance entre CAT et le S&P 500 est bien décrite par une t-copule à **ν = 6,17** degrés de liberté, dont le coefficient de dépendance de queue gauche vaut **λ_L = 0,2777**. Une copule gaussienne aurait donné zéro, c'est-à-dire l'affirmation que deux actifs ne s'effondrent jamais ensemble à la limite. C'est l'hypothèse qui a fait tant de dégâts sur les portefeuilles structurés en 2007-2008.

Applications : backtesting de VaR et d'Expected Shortfall, module de risque de marché sous Solvabilité II, choix de la structure de dépendance dans un modèle interne d'agrégation.

**Projet I, volatilité univariée.** GARCH(1,1), GJR-GARCH et EGARCH sur `rugarch` et `fGarch`, tests de normalité de Jarque-Bera et Anderson-Darling, validation par ARCH-LM et Ljung-Box, calcul de VaR et d'Expected Shortfall conditionnelles.

**Projet II, dépendance bivariée.** BEKK(1,1) sur CAT et S&P 500 (5 075 observations depuis 2000), extraction de la corrélation conditionnelle, VaR d'un portefeuille équipondéré et comptage des excédences. Puis standardisation des résidus, passage aux pseudo-observations et ajustement de cinq copules (gaussienne, Student-t, Clayton, Gumbel, Frank) par maximum de vraisemblance et par inversion du tau de Kendall. Estimation empirique de la dépendance de queue à gauche aux seuils de 5 % et 1 %.

Le détail des résultats est dans le [README du projet](./10-QRM-Quantitative-Risk-Management/README.md).

---

## Reproductibilité

### Python

Les notebooks ont été développés sur Google Colab (Python 3.10 à 3.12).

```bash
python3 -m venv .venv
source .venv/bin/activate          # .venv\Scripts\activate sous Windows

pip install numpy pandas scipy scikit-learn matplotlib seaborn statsmodels
pip install tensorflow==2.20.0 keras
pip install pandas_datareader yfinance
pip install jupyter notebook
```

### R

```r
install.packages(c(
  "xts", "TTR", "moments", "nortest", "tseries",
  "rugarch", "fGarch", "lmtest", "FinTS",
  "BEKKs", "rmgarch", "copula", "matrixcalc",
  "tidyverse", "tidymodels", "ggplot2", "gridExtra"
))
```

### Excel et VBA

Les fichiers `.xlsm` s'ouvrent avec Excel 2016 ou une version ultérieure. Il faut activer les macros pour relancer les simulations ALM déterministes.

Une remarque valable pour plusieurs projets : les chemins d'accès aux données sont codés en dur en tête de script et doivent être adaptés. Certains jeux de données ne sont pas redistribués ici, pour des raisons de propriété.

---

## Contact

**KAMGA BOPDA Davy Romaric**
Étudiant en Master en Sciences Actuarielles, UCLouvain (ISBA)

kamgabopda@gmail.com · [github.com/kamga98davy](https://github.com/kamga98davy)

---

<sub>© 2024-2026 KAMGA BOPDA Davy Romaric. Travaux mis à disposition à des fins pédagogiques et de portfolio. Toute réutilisation académique doit citer l'auteur et l'UCLouvain. Les données de certains projets restent la propriété de leurs détenteurs.</sub>
