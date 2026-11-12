# MON BOL

Bibliothèque culinaire personnelle consacrée aux soupes, avec un premier univers dédié aux ramen.

## ALPHA

Application statique Cloudflare Pages (sans étape de build) avec sauvegarde locale immédiate et synchronisation D1 facultative via Pages Functions.

### Déploiement Cloudflare Pages
- Framework preset : None
- Build command : laisser vide
- Build output directory : `.`
- Root directory : `/`
- Ajouter une base D1 et créer un binding nommé `DB`
- Exécuter `schema.sql` dans cette base

La fonction `/api/state` utilise la table `app_state`. Sans binding D1, l'application reste utilisable en stockage local sur le navigateur.

## Structure
- `index.html` : application
- `schema.sql` : schéma D1 et données de départ
- `functions/api/state.js` : synchronisation de l'état de l'application
