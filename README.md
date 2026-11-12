# MON BOL

Bibliothèque culinaire personnelle consacrée aux soupes, avec un premier univers dédié aux ramen.

## Déploiement Cloudflare Pages
- Framework preset : None
- Build command : laisser vide
- Build output directory : `.`
- Root directory : laisser vide
- Ajouter une base D1 et créer un binding nommé `DB`
- Exécuter `schema.sql` dans cette base

L'application fonctionne aussi en stockage local si D1 n'est pas configuré. La fonction `/api/state` synchronise le contenu via D1.

## Bibliothèque Alpha
Le socle éditorial comprend des recettes régionales, des bouillons clairs et émulsionnés, des dashi, des tares, des huiles, des garnitures, des ingrédients et des techniques transversales.

Les fiches de référence sont ajoutées de manière additive au chargement : les recettes et préparations personnelles déjà créées ou modifiées ne sont pas écrasées. Les listes d'ingrédients et de techniques sont dédupliquées par nom. Les formules sont des bases pédagogiques à tester et ajuster, pas des standards universels.

## Identité visuelle
- `assets/mon-bol-mark.svg` : symbole de marque
- `favicon.svg` : favicon
- `assets/*.svg` : illustrations de catégories (bouillons, tares, huiles, nouilles, garnitures)
- Les photographies de ramen sont servies depuis Pexels ; le pied de page renvoie vers la bibliothèque.

## Sécurité alimentaire
Les bouillons, viandes, œufs et huiles aromatisées maison sont des préparations périssables. Refroidir rapidement, répartir les volumes importants en contenants peu profonds, réfrigérer sans délai, respecter la chaîne du froid et congeler les portions qui ne seront pas utilisées rapidement. Les huiles contenant ail ou aromates frais ne doivent pas être stockées à température ambiante. Les durées de conservation doivent être établies selon le procédé, l'hygiène et les recommandations sanitaires applicables.

Repère local : [SPF Santé publique — Cinq clefs pour des aliments plus sûrs](https://www.health.belgium.be/fr/themes/alimentation/securite-alimentaire/danger-microbiologiques-hygiene/cinq-clefs-aliments-plus-surs).

## Structure
- `index.html` : application et bibliothèque
- `schema.sql` : schéma D1
- `functions/api/state.js` : synchronisation de l'état de l'application
