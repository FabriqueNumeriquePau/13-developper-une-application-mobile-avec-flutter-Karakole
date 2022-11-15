# Premier pas avec Flutter
> Compétences illustrées : Développer une application mobile

## Quésaquo ?
Flutter est une technologie Google pour les développeurs. Elle promet de pouvoir créer des outils numériques sans se soucier (trop) du support de diffusion : ordinateurs de bureau, mobiles, Web. Nous l'utiliserons pour le développement d'applications mobiles.
Contrairement aux applications basées sur les moteurs Javascript, Flutter compile son code en code natif intégrant notamment ses propres composants graphiques.

## Pourquoi Flutter ?
Des pour et des contres comme pour toutes les technologies. Voici quelques éléments tirés de [cette étude assez bien foutue](https://www.letecode.com/flutter-vs-react-native-qui-est-le-meilleur-pour-le-developpement-mobile-en-2022) :

### Pour
- Une technologie pour les unir toutes (même si les performances sont variables) : mobiles (Androïd, IOS), bureau, Web ;
- les meilleures performances sur mobile (outre les applications natives). Flutter n'utilise pas d'interpréteur, il compile directement le code, ça le rend plus à beaucoup plus rapide ;
- moins dépendant des mises à jour des systèmes d'exploitation ; il produit ses propres librairies et compile le code ;
- Des bibliothèques tout en un, c'est un peu la philosophie de Google, qui nécessite moins d'ajout de bibliothèques externes bousées et sont réputées plus stables ;
- maintenu et utilisé par Google pour leurs propres développements.

### Contre
- Encore une nouvelle techno ;
- une techno maison qui enferme les développeurs ;
- un marché de l'emploi moins vif (la technologie ne semble pas se suffit à elle même en termes d'employabilité) ;
- c'est du natif nulle part, le code est certes compilé dans le langage natif mais il induit l'intégration de composants UI maison (avantage, inconvénient) ;
- il y a moins de librairies que pour d'autres technos et ça peut être un problème dans la mesure où le code est compilé.

## S'installer
Dans le cadre de cette découverte, nous allons travailler avec Visual Studio Code. Androïd Studio est recommandé et certains de ses composants sont nécessaires.
Il vous faudra un téléphone connecté ou un émulateur avec une image prête.
[Installez l'extension Flutter sur VSCode](https://docs.flutter.dev/get-started/editor). Tout le paquet sera installé, Dart y compris. L'ensemble est bien foutu et comprend tout ce dont nous avons besoin.

## Cli
Indispensable, il s'installe avec les outils Flutter.
On retrouvera quelques fonctions utiles :
- flutter create monapp pour créer une app
- flutter doctor pour analyser les problèmes
- flutter analyze pour vérifier que tout va bien dans un projet
- flutter test pour... bin... 
- flutter run

Lancez tout de suite flutter doctor pour vérifier que votre système est correctement configuré. Les problèmes seront identifiés pour vous.

## Les dépendances
Des dépendances, comme NPM par exemple, sont à disposition pour les développeurs sur le site [pub.dev](https://pub.dev/). Elles sont ajoutées à un projet et gérées avec la commande 'flutter pub' :
- 'flutter pub -h' pour obtenir la liste des commandes
- 'flutter pub add' monTruc ajoute la package au fichier pubspec.yaml (l'équivalent de package.json en node)
- 'flutter pub get' installe les packages d'une application (comme npm install)

Normalement, à ce stade, vous devriez être en capacité à créer un premier projet :
- flutter create demoApp
Un dossier portant le nom de votre application va être créé avec les fichiers utiles pour créer votre application.