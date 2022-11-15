# FluttingEvents
Flutter est accompagné de son langage de programmation. C'est certainement une bonne idée lorsqu'on souhaite transpiler ou compiler son code comme on le souhaite. C'est Dart.

## Dart
Un [énième langage objet](https://dart.dev/samples) tiré des classiques Java et ...script. On y retrouve ce qui a donné des preuves de praticité :
- [async > await](https://dart.dev/guides/language/language-tour#asynchrony-support) et yield
- implements pour les interfaces
- abstract pour des classes non instantiables
- static
...

### Variables et types
Comme dans Javascript, toutes les variables sont des objets et chaque objet est une instance d'une classe. Les variables sont fortement typées mais leur annotation peut être optionnelle laissant l'interpréteur déterminer le type. Les variables peuvent ainsi être mutables.
La plupart des variables traditionnelles sont présentes : string, object, array, boolean.   
Quelques types types :
- Object : un type générique comme any en Typescript par exemple
- int : un entier
- double : une décimale
- num : nombre générique, entier ou décimal
- bool : un booléen
- String : une chaîne de caractères (peuvent être déclarées nativement sur plusieurs lignes).
- List : un tableau de valeurs ordonnées
Exemples de déclarations de variables avec List :
> var vosnoms = const [];
> var vosnoms = <String>[];
> List<String> vosnoms = [];
les listes acceptent des conditions : var vosnom = <String>['Machin', 'Truc', if(alesnerfs) 'muche'] mais aussi des boucles ou des littéraux (spread operators) (... et ...?) 
- Sets : une collection désordonnée de valeurs uniques
> var vosprenoms = <String>{'John', 'Johana', 'Johnatan', 'Johanatan'};
> Set<String> vosprenoms = {}
- Maps : 'clés > valeur' qui regroupent les possibilités classiques des autres langages
- void : type vide (ne renvoie rien)

Pour les déclarations quelques options et considérations peuvent être utiles
- si vous déclarez une variable avec un type, il n'est pas nécessaire de d'ajouter var
- ? pour rendre une variable optionnelle y compris sur les spread operators ...?maListe
- late : (late String coucou) comme ! en Typescript, late indique que la variable existe à coup sûr mais qu'elle arrivera un peu plus tard. Utile lorsque vous appelez des données.
- final : c'est une variable dont on sait qu'elle ne changera pas jusqu'à la compilation. Elle se rapproche des constantes en Javascript
- const : comme final mais va plus loin, vous le verrez en écrivant le code, vous recevrez des alertes. Une liste, par exemple, définie avec const aura tous ses membres considérés comme constantes. Par ailleurs, seules les valeurs compilables (genre 1+1 mais pas DateTime.now())
- public, protected ne font pas partie du langage
- this n'est pas utilisé non plus. Si vous l'utilisez, vous aurez un message étrange
- Une variable commençant par '_' dans une librairie (packages importés ou script) est néanmoins privée pour cette librairie, ce script. Notez que pour Flutter, une application est considérée comme une librairie. 

### Considération sur la POO
#### Constructeurs
Les constructeurs sont des méthodes qui portent le même nom que la classe. Une particularité dans Dart est de pouvoir créer plusieurs constructeurs dans une classe et de l'instancier en choisissant le constructeur que l'on veut, amusant et fort utile.

#### Mixin
Réutiliser du code dans des classes en l'implémentant ([with, on](https://dart.dev/guides/language/language-tour#adding-features-to-a-class-mixins)). Le concept est vraiment de reprendre un bout de code et de l'injecter dans une classe, propriétés ou méthodes.

### Imports
Les imports se font un peu comme partout, exemples :
- import 'package:monapp/services/monservice.dart'
- import '../../services/monservice.dart'

Ici aussi, nous pouvons considérer quelques points :
AS :
- import 'package:monapp/services/monservice.dart' as RabouleLesInfos
Permet d'attribuer un alias au package pour éviter les conflits de namespaces.

Show :
- import 'package:monapp/services/monservice.dart' show RabouleJusteUnTruc
Permet de ne récupérer qu'une classe dans un package, celle qui est nommée, ici, RabouleJusteUnTruc

Hide :
- import 'package:monapp/services/monservice.dart' hide RabouleJusteUnTruc
C'est l'inverse, on va tout prendre sauf ce qui est caché.

- defferred : permet d'attendre le déclencheur loadlLibrary() pour importer une librairie. Ca permet de décaler le chargement dans le temps et de ne charger une librairie que si elle doit servir. Exemple un peu technique :
```
(import 'package:greetings/hello.dart' deferred as hello;)
Future<void> greet() async {
  await hello.loadLibrary(); // Importer la librairie lorsqu'on en a besoin. Le code est bloqué en attendant le chargement.
  hello.printGreeting();
}
```

### Des spécificités un peu conceptuelles
Avec les fonctions asynchrones deux classes peuvent être intéressantes :
- [Future<T>](https://api.dart.dev/stable/2.18.2/dart-async/Future-class.html) : une sorte d'écouteur ;
- [Stream<T>](https://api.dart.dev/stable/2.18.2/dart-async/Stream-class.html) : une succession d'événements reçus. La classe étend les async* et yield* avec les étoiles.

### Goodies, des petites choses intéressantes
- assert(condition, message?);
Une méthode qui permet de renvoyer des informations pendant le développement mais qui n'est pas traitée en production. Idéal pour débugguer.
- try...on...catch
'on' permet d'avoir une couche supplémentaire d'interprétation de l'erreur pour choisir une stratégie :
> try {
>   breedMoreLlamas();
> } on OutOfLlamasException {
>   // A specific exception
>   buyMoreLlamas();
> } on Exception catch (e) {
>   // Anything else that is an exception
>   print('Unknown exception: $e');
> } catch (e) {
>   // No specified type, handles all
>   print('Something really unknown: $e');
> }

Un tour d'horizon rapide sur quelques spécificités. Les outils de développement sont bien faits, ils accompagnent la découverte.
Prenons place dans un petit projet.