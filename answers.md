# Reponse aux questions
## Page 2 exercice 1
###### Il manque l'id dans les parametres de la liste, vu que swift met à jour automatiquement il faut qu'il puisse detecter chaque item.
## Page 2 exercice 2
##### Vous avez ajouté un buton "Ajouter", une fonction addLoot qui servira plus tard à ajouter un item et un label pourchacun des elements de la liste
##### Le foreach sert à parcourir la liste et à separer les elements pour les lire individuellement. Il est séparé du bouton car le bouton est affiché une seule fois.
## Page 2 exercice 3
##### Le code ne fonctionne pas car loot n'est pas modifié à l'actualisation.
##### Cela fonctionne avec @State car il sert a enregistrer l'etat de la variable loot avant l'actualisation de la vue, grâce à cela lorsque la vue se recharge elle peut recuperer l'etat de la variable et l'utiliser pour l'initialiser au lieu de reprendre l'etat déclaré de base, cela aide a prendre en compte les modifs.
