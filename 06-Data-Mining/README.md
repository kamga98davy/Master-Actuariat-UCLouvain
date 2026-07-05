# Data Mining — Prédiction de sinistres automobiles

*Cours LDATS2350 — Prof. Robin VAN OIRBEEK* · *Année 2024-2025*
*Équipe : DAKTOU TCHAGAM Martial · KAMGA BOPDA Davy Romaric · DINOCK DINOCK Yvan Bienvenue*

📄 [Lire le rapport (PDF, 12 pages)](./Rapport_Data_Mining.pdf)

---

## Objectif

Prédire la survenue d'un accident automobile (`claimNumbMD`) à partir des caractéristiques d'un contrat d'assurance auto.

## Données

- **24 774 observations** décrivant des assurés, leurs véhicules et leur environnement.
- **11 variables** — aucune valeur manquante.
- La variable `uwYear` (année de souscription) est **éliminée** car redondante avec `nYears` (ancienneté du contrat).

## Méthodologie

### 1. Analyse exploratoire

- **Prétraitement** — typage et nettoyage.
- **Analyse descriptive** — distributions et croisements avec la cible.
- **Détection des valeurs aberrantes** (Tukey, z-score, IQR).
- **Analyse de la symétrie et de l'aplatissement** des variables continues (skewness, kurtosis).
- **Inférence statistique** — tests d'association (χ², Cramér's V, Kruskal-Wallis) avec la cible.

### 2. Modélisation

- **Régression logistique** (baseline).
- Modèles prédictifs supplémentaires (comparés sur métriques de classification).
- **Identification des facteurs les plus influents** pour la prise de décision tarifaire.

## Livrable

Comparatif de plusieurs modèles avec sélection du plus performant, discussion des variables déterminantes.

## Note

Le code source (SAS ou R) n'était pas inclus dans les livrables partagés au moment de la mise en ligne. Le rapport PDF contient les résultats et l'interprétation complète.

## Compétences mobilisées

Data cleaning, EDA statistique, tests d'hypothèses, classification, sélection de variables, interprétation métier en tarification non-vie.
