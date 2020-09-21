# 🧙 Henri Potier

## 🚀 Stack

* Clean architecture
* MVVM for the presentation layer
* RxSwift
* Dependency Injection with Swinject
* Moya for the Network layer
* Unit Tests with XCTest, Cuckoo (Mocks), RxTest, RxBlocking

## 💬 Specifications

### Énoncé

> Il était une fois, une collection de cinq livres racontant les histoires d’un formidable héro nommé Henri Potier.
Tous les enfants du monde trouvaient les histoires de cet adolescent fantastiques.
L’éditeur de cette collection, dans un immense élan de générosité (mais aussi pour booster ses ventes :wink:),
décida de mettre en place des offres commerciales aussi aléatoires que l’issue des sorts de Ron Weasley.

L’éditeur vous demande de développer une application mobile Android ou iOS comprenant deux interfaces :

1. La première permet d’afficher les livres que l’on souhaite acheter ;
1. La seconde récapitule le panier sur lequel sera appliqué __la meilleure offre commerciale__.

Sachez que l’éditeur attachera une attention toute particulière à __la qualité des développements__.
&nbsp;

### Ressources

La liste des livres Henri Potier est accessible à l’adresse `http://henri-potier.xebia.fr/books` en `GET`.

Les offres commerciales associées sont disponibles en `GET` à l’adresse suivante : `http://henri-potier.xebia.fr/books/{ISBN1, ISBN2, ...}/commercialOffers`

### Exemple

Pour deux livres (respectivement à 35€ et 30€), la requête ressemblera à : `http://henri-potier.xebia.fr/books/c8fabf68-8374-48fe-a7ea-a00ccd07afff,a460afed-e5e7-4e39-a39d-c885c05db861/commercialOffers`

Le service renverra les offres applicables à ce panier en `JSON` :
```json
{
  "offers": [
    { "type": "percentage", "value": 5 },
    { "type": "minus", "value": 15 },
    { "type": "slice", "sliceValue": 100, "value": 12 }
  ]
}
```

Dans cet exemple, la promotion la plus intéressante pour le client est la promotion de type `minus`, le prix du panier attendu est donc de `65€ - 15€`, soit `50€`.

#### Explications

* La première offre identifiée par un type `percentage` est une réduction s’appliquant sur
le prix de l’ensemble des livres.
Le montant de la réduction est dans `value` ;

* La deuxième offre identifiée par un type `minus` est une déduction directement applicable
en caisse d’un montant de `value` ;

* La troisième offre identifiée par un type `slice` est un remboursement par tranche d’achat.
Dans cet exemple, on rembourse 12€ par tranche de 100€ d’achat.

*Au-delà de « l’exercice imposé », toute idée originale supplémentaire sera appréciée.*

## ⌨️ Install

Run `pod install` to install dependencies

## 💡 Ideas

- [ ] Add the ability to select a quantity for each book
- [ ] Add a book's details screen (to display synopsis etc.)
- [ ] Add an other implementation of `CartRepository` which persists the `Cart` (with `UserDefaults` for instance) and manage `Cart`restoration when relaunching the app
