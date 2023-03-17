# MIAGED CAMARA MAMADOU
Ce projet est une version light de l’application Vinted(https://www.vinted.fr/), développée dans le cadre d’un projet universitaire. L’application permet aux utilisateurs d’acheter et de vendre des vêtements d’occasion. Celle-ci s’appellera « MIAGED ».
## Firebase
Pour Installer les outils de ligne de commande requis et configurer notre application pour utiliser Firebase (https://firebase.google.com/docs/flutter/setup?platform=web&hl=fr)
## Fonctionnalités
MVP atteint avec les criteres d'acceptations plus imagination pour augmenter

Navigation entre différentes pages : la page principale avec les catégories de vêtements, la page de connexion, la page du panier et la page de profil utilisateur.

Affichage des vêtements disponibles par catégorie.

Ajout et suppression des vêtements au panier.

Connexion à un compte utilisateur pour gérer le profil et les commandes.
## Technologies utilisées
Flutter : framework de développement d’applications mobiles.
Firebase : service de développement d’applications mobiles de Google.
## Installation et utilisation
Cloner le projet depuis GitHub.

Ouvrir le projet avec un éditeur de code compatible avec Flutter.

Installer les packages requis en utilisant la commande .'flutter pub get'

Configurer les informations d’identification Firebase en suivant les instructions fournies dans le fichier .'firebase_options.dart'

Lancer l’application en utilisant la commande ou en utilisant un émulateur de périphérique mobile.'flutter run'
## flutter device
j'ai utilisé chrome (web)
## Information de connexion
Pour vous connecter directement, utilisez:

Login: mamadou@gmail.com

Password: mamadou2023
## Modification profil
Au niveau du profil, pour modifier un champ, il suffit de cliquer dans le champ directement ensuite faire la modification et en fin cliquer sur le bouton Valider
## Interfaces de l'application
Voici certaines interfaces de l'application MIAGED
### Page de connexion
La page de connexion est la première page qui s’affiche lorsqu’un utilisateur lance l’application. Cette page permet aux utilisateurs existants de se connecter à leur compte en entrant leur adresse e-mail et leur mot de passe. Si un utilisateur n’a pas encore de compte, il peut s’inscrire en cliquant sur un lien d’inscription. La page de connexion est généralement simple et épurée, avec une mise en page claire pour faciliter l’entrée des informations de connexion. Elle est essentielle pour la sécurité de l’application, car elle permet de vérifier l’identité des utilisateurs et de garantir que seuls les utilisateurs autorisés peuvent accéder à l’application.
![role](miaged/images/connexion.png)
### Page creation compte
La page de création de compte/connexion est une page qui permet aux utilisateurs de créer un nouveau compte
![role](miaged/images/compte.png)
### affichage des vetements
La page des vêtements est une page qui présente une liste de vêtements disponibles à l’achat pour l’utilisateur. Cette liste est divisée en catégories telles que les costumes, les chemises, les doudounes, les jeans et les accessoires. L’utilisateur peut naviguer entre les différentes catégories en utilisant un onglet. En cliquant sur un vêtement, l’utilisateur peut voir plus de détails sur le vêtement, tels que le prix, la taille et la couleur, et ajouter le vêtement à son panier. La page des vêtements utilise Firebase pour stocker et récupérer les informations sur les vêtements disponibles.
![role](miaged/images/vetement.png)
### details de vetement
La page des détails des vêtements affiche des informations détaillées sur un vêtement sélectionné à partir de la liste des vêtements disponibles. Elle affiche une image du vêtement, son nom, sa description, sa taille et son prix. Elle permet également à l’utilisateur d’ajouter le vêtement à son panier. Si l’utilisateur est connecté, il peut également ajouter le vêtement à sa liste de souhaits. La page dispose également d’un bouton de retour pour revenir à la liste des vêtements.
![role](miaged/images/details.png)
### Page profil
Lorsque l'utilisateur cree son compte
La page de profil de l’application affiche les informations de l’utilisateur connecté. Elle permet également à l’utilisateur de modifier son profil
![role](miaged/images/profil.png)
### Page panier
La page Panier est une page qui permet à l’utilisateur de visualiser les articles qu’il a ajoutés à son panier d’achats. Elle affiche les différents articles sous forme de liste et permet à l’utilisateur de supprimer des articles de son panier.Elle affiche également le montant total de la commande
![role](miaged/images/panier.png)
## authentification firebase
Lorsqu'on crée un utilisateur les informations sont sauvegardées
voir par exemple notre utilisateur ci-dessus apparait:
![role](miaged/images/auth.png)
## Firestore Database
Nous avons différentes collections pour la sauvegarde
les Id sont choisis de façon automatique pour les documents des collections
### collection Habits
pour les vetements avec les différentes proprietes
![role](miaged/images/habits.png)
### collection Utilisateurs
cette collection comprend des sous collections Panier et Profil qui se cree automatique a travers les requetes
![role](miaged/images/utilisateurs.png)
