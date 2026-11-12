# MON BOL

Bibliothèque culinaire personnelle consacrée aux soupes, avec un premier univers dédié aux ramen.

## ALPHA

Application statique Cloudflare Pages (sans étape de build) avec sauvegarde locale immédiate et synchronisation D1 facultative via Pages Functions.

### Déploiement Cloudflare Pages
- Framework preset : None
- Build command : laisser vide
- Build output directory : `. ` (point seul : `.`)
- Root directory : laisser vide
- Ajouter une base D1 et créer un binding nommé `DB`
- Exécuter `schema.sql` dans cette base

La fonction `/api/state` utilise la table `app_state`. Sans binding D1, l'application reste utilisable en stockage local sur le navigateur.

## Contenu de la bibliothèque

La base initiale comprend :
- Bouillons clairs et émulsionnés, dashi et extractions marines
- Tares shoyu, shio, miso et sésame
- Huiles aromatiques et graisses de finition
- Garnitures : œufs, porc braisé, bambou et condiments
- Recettes régionales et styles de service
- Ingrédients japonais et techniques de cuisine

Les nouvelles fiches de référence sont ajoutées de manière additive au chargement : les fiches personnelles déjà créées ou modifiées ne sont pas écrasées. Les nouvelles recettes et préparations sont des bases pédagogiques à tester et ajuster, pas des formules universelles.

## Sécurité alimentaire

Les bouillons, viandes, œufs et huiles aromatisées maison sont des préparations périssables. Refroidir rapidement, répartir les volumes importants en contenants peu profonds, réfrigérer sans délai, respecter la chaîne du froid et congeler les portions qui ne seront pas utilisées rapidement. Les huiles contenant ail ou aromates frais ne doivent pas être stockées à température ambiante. Les durées de conservation doivent être établies selon le procédé, l'hygiène et les recommandations sanitaires applicables.

Repère local : [SPF Santé publique — Cinq clefs pour des aliments plus sûrs](https://www.health.belgium.be/fr/themes/alimentation/securite-alimentaire/danger-microbiologiques-hygiene/cinq-clefs-aliments-plus-surs).

## Structure
- `index.html` : application et bibliothèque de départ
- `schema.sql` : schéma D1
- `functions/api/state.js` : synchronisation de l'état de l'application

## Principes éditoriaux
- Distinguer les styles régionaux des variantes personnelles.
- Documenter les quantités, rendements, temps et paramètres variables.
- Ne pas présenter un dosage de départ comme une norme universelle.
- Tester les recettes en cuisine et consigner les ajustements avant de les considérer comme validées.
