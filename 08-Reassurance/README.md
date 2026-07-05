# Réassurance et échange de risques

*Cours Réassurance — Prof. Philippe DE LONGUEVILLE* · *MSc Sciences Actuarielles (LSBA), UCLouvain* · *Année 2025-2026*
*Groupe 6 : DIENDERE Wend · BOPDA Davy Romaric*

📄 [Lire le rapport (PDF, 22 pages)](./Rapport_Reassurance.pdf) · 📊 [Analyse Excel principale](./data/Projet_reassurance_final.xlsx) · 📊 [Fichier d'analyse complémentaire](./data/Fichier_analyse_reassurance.xlsx)

---

## Objectif

Tarifer plusieurs **traités de réassurance non-proportionnels** (couches Excess of Loss) sur un portefeuille de sinistres réels en comparant les approches **Burning Cost** et **Poisson-Pareto**.

## 1. Préparation des données

### 1.1 Indexation des primes et sinistres
- **Premium Indexation** — actualisation des primes à une date de référence via un indice économique.
- **Claims Indexation** — même traitement sur les sinistres.

### 1.2 Incurred Loss et Indexed Incurred Loss
- Calcul de l'*Incurred Loss* (Paid + Reserve).
- Version indexée pour homogénéiser dans le temps.

## 2. Prime pure par Burning Cost

- **Sans indexation** — Σ sinistres_c / Σ primes.
- **Avec indexation** — comparaison des deux et interprétation de l'écart lié à l'inflation.

## 3. Modèle Poisson-Pareto

### 3.1 Structure

- **Fréquence** : *N ~ Poisson(λ)*.
- **Sévérité** : *Y ~ Pareto(α, θ)* pour la queue de distribution des sinistres.

### 3.2 Extrapolation dans la couche

Pour une couche XL *(u, u+L)* :

- **Fréquence dans la couche** : *λ_P = λ · P(Y > u)*.
- **Espérance de paiement par sinistre dans la couche** *E(Y_P)* — intégration tronquée de la Pareto.

### 3.3 Application numérique aux deux couches

Application à deux couches (par exemple *€500k xs €500k* et *€2M xs €1M*) avec :
- **Estimation des paramètres** (MLE ou moments).
- **Validation graphique** — QQ-plot, mean excess plot, log-log plot.
- **Calcul de la prime pure** dans chaque couche.

## 4. Interprétation

Comparaison Burning Cost vs Poisson-Pareto, choix de la méthode selon la volatilité et l'ancienneté des données, discussion du chargement de sécurité et de la marge de solvabilité.

## Compétences mobilisées

Statistiques d'ordre extrême, Pareto généralisée, estimation MLE, Burning Cost, XL traités, VaR/ES, indexation temporelle des sinistres.
