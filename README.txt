MA GARDE-ROBE BÉBÉ — VERSION 3

1. Créez un NOUVEAU dépôt public GitHub (par exemple garde-robe-bebe-v3).
2. Ajoutez les 5 fichiers à la RACINE du dépôt (ne chargez pas le ZIP tel quel) :
   index.html, sw.js, manifest.webmanifest, icon-192.png, icon-512.png.
3. Settings > Pages > Deploy from a branch > main > / (root) > Save.
4. Attendez la publication puis ouvrez l'adresse GitHub Pages dans Safari.
5. Partager > Sur l'écran d'accueil > Ajouter.

Fonctionnement :
- Listes, quantités, objectifs, photos et ordre indépendants pour chaque âge.
- Modifier permet de changer le nom, l'objectif, l'icône et la photo.
- Les flèches ↑ ↓ changent l'ordre pour la taille affichée uniquement.
- Les données sont sauvegardées localement dans cette application, sans synchronisation cloud.
- Export JSON et import JSON pour les sauvegardes ; photos incluses.
- Nouvelle version : les données de l'ancienne version ne sont PAS reprises automatiquement.
- Ne publiez pas vos fichiers JSON de sauvegarde dans le dépôt public.

Version 3.1 : compteur des vêtements manquants (somme des max(objectif - quantité, 0) pour la taille active) ; barre des actions compactée. Données V3 conservées sur la même origine.
