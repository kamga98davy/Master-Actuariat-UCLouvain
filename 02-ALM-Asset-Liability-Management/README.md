# Asset & Liability Management (ALM) — Assurance-vie

*Cours ALM — Prof. Jérôme BARBARIN* · *MSc Actuarial Science (LSBA), UCLouvain* · *Année 2025-2026*
*Équipe : DIENDERE Wend Kouni Oliseh · KAMGA BOPDA Davy Romaric · ZITAN Layla*

📄 [Lire le rapport (PDF)](./Rapport_ALM.pdf) · 💻 [Notebook Python (Partie II)](./code/ALM_Partie_II.ipynb) · 📊 [Excel avec rachat](./data/ALM_avec_rachat.xlsm) · 📊 [Excel sans rachat](./data/ALM_sans_rachat.xlsm)

---

## Question de fond

> *Lorsque les taux d'intérêt bougent, qu'arrive-t-il aux fonds propres d'un assureur-vie ?*

Le projet examine la gestion actif-passif d'une compagnie d'assurance-vie sous **deux angles complémentaires** : déterministe (analyse comptable et sensibilité) puis stochastique (Monte-Carlo sous Hull-White).

## Partie I — Modèle déterministe (Excel/VBA)

- **Bootstrapping de la courbe zéro-coupon** à partir des OLO belges de marché.
- **Valorisation des provisions techniques** — flux futurs pondérés par les probabilités de survie et actualisés aux taux spots.
- **Analyse du gap de duration** — mise en évidence de l'asymétrie structurelle du bilan : les **passifs sont notablement plus longs que les actifs** (durations 15 ans+ contre 6-8 ans).
- **Couverture par swap à départ différé** — dimensionnement pour aligner la duration modifiée du portefeuille d'actifs à celle des passifs.

Deux fichiers : `ALM_avec_rachat.xlsm` (avec option de rachat des assurés) et `ALM_sans_rachat.xlsm` (référence).

## Partie II — Modèle stochastique (Python)

- **Modèle Hull-White G1++** — dynamique en un facteur avec composante déterministe pour caler la courbe initiale exactement.
- **Simulations Monte-Carlo** sous mesure risque-neutre Q pour valoriser les provisions incluant l'option de **participation aux bénéfices**.
- **Participation aux bénéfices** modélisée comme option imbriquée non-linéaire dans les provisions.
- **Distribution du P&L sous P** — reconstitution par changement de mesure pour calculer :
  - **Value-at-Risk (VaR)** à 99,5 % (choc SCR-Vie).
  - **Expected Shortfall**.
  - **Solvabilité à horizon 1 an**.

## Compétences mobilisées

Duration, convexité, swaps de taux, calibration Hull-White G1++, Monte-Carlo, participation aux bénéfices, options embarquées, Solvency II (SCR taux).
