# Deep Learning for Insurance and Finance

*Cours LDATS2310 — Prof. Donatien HAINAUT* · *Projet individuel* · *Année 2025-2026*

📄 [Lire le rapport (PDF, 30 pages)](./Rapport_Deep_Learning.pdf) · 💻 [Notebook Jupyter](./code/Deep_Learning_Insurance.ipynb)

---

## Contexte

Application du deep learning à un **portefeuille d'assurance flotte automobile** : 87 228 contrats décrits par 22 variables contractuelles, géographiques et comportementales. L'objectif est de prédire la **fréquence de sinistres** :

```
f_i = N_i / ν_i
```

où *N_i* est le nombre de sinistres et *ν_i* l'exposition au risque du contrat *i*.

## Axe 1 — Prédiction de la fréquence

**Cinq modèles comparés** :

1. **GLM Poisson avec offset log(ν)** — baseline actuarielle classique.
2-5. **Quatre architectures de réseaux de neurones profonds** de complexité croissante (nombre de couches, embeddings, dropout, régularisation).

**Interprétabilité.** Puisque les réseaux profonds sont des boîtes noires, l'interprétation est menée via :

- **Partial Dependence Plots (PDP)** — effet marginal moyen d'une variable.
- **Individual Conditional Expectation (ICE)** — effets individuels pour détecter l'hétérogénéité.

## Axe 2 — Clustering des contrats (AE / VAE)

**Objectif** : découvrir des **segments homogènes de risque** sans supervision.

- **Auto-Encodeurs (AE)** — projection dans un espace latent de faible dimension.
- **Auto-Encodeurs Variationnels (VAE)** — régularisation stochastique de l'espace latent (loss reconstruction + KL divergence).
- **k-means** appliqué sur les représentations latentes.

## Traitements de données

- **Encodage one-hot** de toutes les variables catégorielles.
  - AE/VAE : *n × 57* (toutes modalités conservées).
  - GLM et DNN : *n × 44* (suppression de la modalité de référence, évite multicolinéarité).
- **Valeur_assuree** : 99,85 % de valeurs manquantes → **variable supprimée** (imputation statistiquement incohérente).
- Variables ordinales : `Classe_Age_Situ_Cont`, `Classe_Age_Vehicule`, `Puissance`, etc.

## Stack technique

TensorFlow 2.20, Keras, scikit-learn, pandas, matplotlib. Google Colab (GPU).

## Compétences mobilisées

GLM, réseaux de neurones profonds, embeddings, régularisation (L1, L2, dropout), auto-encodeurs, VAE, interprétation ML (PDP, ICE), tarification non-vie.
