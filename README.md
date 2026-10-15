# SWAM Web — démarrage rapide

## Fichiers
- `index.html` : catalogue, panier et création de commande
- `connexion.html` : connexion / inscription client
- `commandes.html` : historique et suivi par code
- `profil.html` : profil, adresses, favoris et statistiques
- `paiement.html` : vérification du statut de paiement
- `livreur.html` : espace livreur
- `admin.html` : tableau de bord administrateur, produits, paiements et livreurs

Chaque page embarque son CSS et son JavaScript. Aucun framework ni installation npm n'est nécessaire.

## Lancer dans VS Code
1. Décompresse le dossier `swam-web`.
2. Ouvre le dossier dans VS Code.
3. Installe l'extension **Live Server** si elle n'est pas déjà installée.
4. Clique droit sur `index.html` puis **Open with Live Server**.

## API
L'URL utilisée dans les pages est : `https://swamapp-production.up.railway.app`.
Si ton service Railway utilise une autre URL, remplace la constante `API` au début du script dans chaque fichier HTML.

## Points importants
- Les routes et les champs envoyés sont adaptés au backend Flask fourni dans la conversation. Le bon fonctionnement réel dépend de l'état du service Railway, de la base PostgreSQL et des variables d'environnement.
- Pour commander, l'API exige une session valide, au moins un article, une adresse et une méthode de paiement.
- Pour le paiement Genius Pay, le backend doit avoir `GENIUS_PAY_API_KEY`, `GENIUS_PAY_API_SECRET` et la configuration de webhook correcte. L'URL de paiement n'est ouverte que si l'API renvoie `checkout_url`.
- Le compte doit déjà avoir le rôle `admin` ou `livreur` pour ouvrir les espaces correspondants. L'inscription publique crée uniquement des comptes clients.
- Le lien de retour Genius Pay configuré dans le backend est actuellement orienté vers un schéma d'application mobile (`votre-app-scheme://...`). Pour le site web, configure `GENIUS_PAY_REDIRECT_URL` vers une page HTTPS web dédiée et adapte la route de redirection.
- Le backend fourni retourne le code de réinitialisation dans `debug_code` : ne garde pas cette fonctionnalité en production. Il contient aussi des identifiants admin par défaut dans le code; change-les immédiatement et utilise des variables d'environnement / une création admin contrôlée.
- Les fonctions d'édition des produits sont simples et utilisent des fenêtres `prompt`; elles sont fonctionnelles pour tester, mais pourront être remplacées par un formulaire plus confortable.
- La page d'accueil ne propose pas encore d'ajout aux favoris; la liste et la suppression des favoris sont déjà présentes dans `profil.html`.
