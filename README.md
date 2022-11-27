# OpenSourceJetBrains

Fiche techinique  OpenSourceJetBrains

* Nom du projet    : OpenSourceJetBrains
* Type de document : Documentation technique
* Date             : 26/11/2022
* Version          : 1.0
* Auteur           : Trimeche Hassen - Developpeur Senior IOS
* IDE              : Xcode 14.0.1
* Swift Version.   : swift-driver version: 1.62.8 Apple
Swift version 5.7 (swiftlang-5.7.0.127.4 clang-1400.0.29.50) * Gestion HTTP webServices : Alamofire
* Outil de gestion de dependances : le Swift pack Manager
* Architecture                    :  MVVM + Concurnecy + Coordinator +
* Gestion des taches Concurnecy : Async await fait partie des nouveaux changements de Concurrency qui sont arrivés dans Swift 5.5 pendant la WWDC 2021
Concurrency dans Swift signifie permettre à plusieurs morceaux de code de s'exécuter en même temps. Il s'agit d'une description très simplifiée, mais elle devrait déjà vous donner une idée de l'importance de la Concurrency dans Swift pour les performances de vos applications. Avec les nouvelles méthodes asynchrones et les instructions await, nous pouvons définir des méthodes effectuant un travail de manière asynchrone.
async :
-signifie asynchrone et peut être considéré comme un attribut de
méthode indiquant clairement qu'une méthode effectue un travail asynchrone.
-Les rappels d'achèvement étaient courants dans Swift pour revenir d'une tâche asynchrone, souvent combinés avec un paramètre de type Result.
await : attend un callback de son pote async
* interface graphique : Storyboard
* la structure de projet :
- Constants : contient les fichiers constants de l'application
- Bussiness : contient les modeles (couche data)
- Services : contient les services HTTP webServices et les requestes 
- Presentations : les interfaces Graphiques :chaque page a son Model ,
ViewModel ,ViewController et leurs customs Views

- Extensions : contient les Extensions des classes génerics. 
- Applications  :  contient l'objet racine de l' application et les classs de navigation (AppCoordinator)
- OpenSourceJetBrainsProjectTests : contient test Unitaire classes
