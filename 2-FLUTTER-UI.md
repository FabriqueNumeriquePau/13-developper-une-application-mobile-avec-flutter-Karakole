# FluttingFlyEvents
Nous allons développer une petite application des trois ou quatre pages connectée aux services de Firebase pour les données et les notifications. Il nous faudra mettre en place un échaffaudage graphique, créer des pages et les mettre en page, créer un petit singleton pour faire un service pour les données (je continue de préférer le MVVM au MVC) et connecter tout ça avec FireFire.

## UI et WidgWidgWidget
Dans Flutter, tout est réputé être un Widget. Un widget est une sorte de petit composant comprenant une dimension spécifique d'un traitement, un peu comme des balises HTML étendues par du CSS. Ils servent à créer une vue ou à appliquer une mise en page ou un style et sont en nombre incalculable. Enfin,calculable mais important. [Une liste non exhaustive mais passionnante est disponible ici](https://medium.com/@mirko.rapisarda/flutter-a-meaningful-list-of-widgets-that-you-probably-dont-know-fd2589080343).

## Les contraintes de présentation
Flutter adresse des mobiles de toutes tailles composés de systèmes d'exploitations différents. Pour être intérprété rapidement et s'adapter à ces conditions il a mis en place des contraintes dans la manipulation des éléments d'interface. Grosso modo, il faut considérer que les widgets ont été morcelés autant que possible, chacun pour une fonction précise. Les widgets enfants s'inscrivent des les contraintes du widget parent. [Cette page est intéressante à considérer sur le sujet](https://docs.flutter.dev/development/ui/layout/constraints).
Notez dans les différents exemples la présence de propriétés telles que child et children dédiées à l'accueil de composants enfants.

## Stateless vs Statefull
Un concept important à considérer sur une classe dans Flutter est son extension de widget avec ou sans états.
Un widget stateless est ... sans état, c'est à dire statique. Son contenu ne sera pas modifié. Il est à privilégié dès que possible car peu impactant sur les performances.
Les statefull sont l'inverse. Ils nécessitent de créer un état et de le modifier. On va créer des sortes d'écouteurs sur des états variables pour savoir quand les redessiner.

## Mainivelle
Notre application sera simple en matière de présentation (et ça sera déjà bien). Elle proposera des événements dynamiques et un système de notifications.