# Statistical Learning Methods for Insurance

*Cours LACTU2310 — Prof. Karim BARIGOU* · *Projet individuel* · *Année 2024-2025*

📄 [Rapport final (PDF - version révisée juin 2026)](./Rapport_Statistical_Learning.pdf) · 📄 [Rapport initial (juillet 2025)](./Rapport_Statistical_Learning_v1_soutenance.pdf) · 🎤 [Présentation soutenance](./Presentation_Soutenance.pdf) · 💻 [Rapport RMarkdown avec code](./code/Rapport_Rmarkdown_avec_code.html)

---

## Titre complet

**Prédiction de souscription d'assurance voyage avec des méthodes ensemblistes.**

## Contexte métier

En 2019, une agence de voyages propose à ses **~2 000 clients** une nouvelle assurance voyage intégrant une **couverture Covid-19**. Seulement **36 %** ont souscrit. L'agence souhaite mieux cibler les futures campagnes en identifiant les profils à forte propension d'achat.

## Problématique

Construction d'un **modèle de classification binaire** *(TravelInsurance ∈ {0,1})* à partir des caractéristiques :

- **Socio-démographiques** — âge, statut, revenu, taille de famille.
- **Habitudes de voyage** — fréquence de voyage à l'étranger.
- **Historique médical** — présence de maladies chroniques (variable binaire `ChronicDiseases`).

## Méthodologie

### Pré-processing

- `ChronicDiseases` : recodée binaire (1 = présence, 0 = absence).
- `FamilyMembers` : variable discrète.
- `TravelInsurance` : cible binaire.
- Standardisation des variables continues.

### Modèles

1. **Régression logistique binomiale** (référence — Frees, 2010).
2. **Arbres CART** — arbres uniques avec élagage.
3. **Random Forest** — bagging + sélection aléatoire d'attributs.
4. **Gradient Boosting** — modélisation séquentielle des résidus.
5. **XGBoost** — variante régularisée du GB.

### Évaluation

- **AUC-ROC** — capacité de séparation.
- **Matrice de confusion** au seuil optimal.
- **Calibration** — reliability plot.
- **Importance des variables** (par permutation).

## Résultat attendu

Identification du **modèle d'arbre optimal** offrant le meilleur compromis entre précision prédictive et généralisation.

## Deux versions du rapport

- `Rapport_Statistical_Learning_v1_soutenance.pdf` — version initiale (soutenance du 24 juillet 2025).
- `Rapport_Statistical_Learning.pdf` — version révisée (29 juin 2026) intégrant les remarques du jury.

## Compétences mobilisées

Classification binaire, arbres et méthodes ensemblistes, régression logistique, cross-validation, tuning d'hyperparamètres, RMarkdown/knitr, packages `tidymodels`, `xgboost`, `ranger`.
