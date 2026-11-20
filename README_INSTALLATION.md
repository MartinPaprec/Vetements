# Ma garde-robe bébé — version Supabase

## Installation

1. Avant toute modification, ouvre ton ancienne application **sur l'appareil qui contient tes données** et utilise « Exporter une sauvegarde ». Conserve le fichier JSON ailleurs.
2. Dans Supabase, ouvre ton projet, puis **SQL Editor** > **New query**. Colle et exécute `setup_supabase.sql`.
3. Dans Supabase > Authentication > Providers, vérifie que **Email** est activé. Les liens de connexion envoyés par e-mail nécessitent une configuration e-mail fonctionnelle ; le service intégré a des limitations d'envoi.
4. Dans Supabase > Authentication > URL Configuration : définis **Site URL** à l'URL de ton site GitHub Pages (par ex. `https://UTILISATEUR.github.io/DEPOT/`) et ajoute cette URL aux **Redirect URLs**. Attention à la barre finale et au chemin du dépôt. Le code envoie le lien vers l'URL de la page courante.
5. Dans Supabase > Project Settings > API / API Keys, copie **Project URL** et la clé publique `anon` (legacy) ou une clé `sb_publishable_...`. N'utilise **jamais** `service_role` ni `sb_secret_...`.
6. Dans `index.html`, remplace `REMPLACER_PAR_URL_SUPABASE` et `REMPLACER_PAR_CLE_PUBLIQUE` par ces deux valeurs (conserve les apostrophes).
7. Dépose à la racine du dépôt GitHub les cinq fichiers `index.html`, `sw.js`, `manifest.webmanifest`, `icon-192.png`, `icon-512.png`. Le fichier SQL et ce README ne sont pas nécessaires au site.
8. Attends la publication GitHub Pages, puis recharge l'application. Sur iPhone, ferme et rouvre l'application installée si l'ancienne version reste affichée.
9. Sur **l'appareil contenant tes données**, vérifie l'inventaire local, connecte-toi par e-mail, puis clique **« Envoyer ma copie locale vers Supabase »**. Cela remplace la sauvegarde en ligne : ne le fais qu'une fois pour l'import initial.
10. Sur un second appareil, ouvre le site et connecte-toi avec **la même adresse e-mail**. L'inventaire en ligne doit apparaître automatiquement.

## Fonctionnement et limites

- Les vêtements, objectifs, compteurs, icônes, ordre et petites photos sont conservés dans **une ligne JSONB par utilisateur** dans Supabase.
- La copie locale reste dans `localStorage` ; les modifications sont envoyées en ligne après une courte temporisation. Un message indique si la synchronisation a échoué.
- **Hors connexion** : les modifications locales restent disponibles, mais il n'y a **pas de résolution automatique des conflits entre appareils**. Si deux appareils modifient l'inventaire en parallèle, la dernière sauvegarde peut écraser l'autre. En cas de doute, exporte un JSON avant toute récupération manuelle.
- Cette version est conçue pour **un utilisateur sur plusieurs appareils**, pas pour plusieurs comptes sur un même navigateur ni pour un partage familial simultané.
- Les photos restent encodées dans le JSON, comme dans l'ancienne version. Pour de grandes photothèques, il faudra migrer vers Supabase Storage.
- Le mode hors connexion de la page nécessite un premier chargement connecté. Le CDN Supabase peut aussi nécessiter une connexion lors du premier lancement.
- La sauvegarde automatique Supabase ne remplace pas une stratégie de sauvegarde : conserve régulièrement des exports JSON.
- N'ajoute jamais tes exports JSON privés dans un dépôt GitHub public.
