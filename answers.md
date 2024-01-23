# Page 2
## exercice 1
###### Il manque l'id dans les parametres de la liste, vu que swift met à jour automatiquement il faut qu'il puisse detecter chaque item.
## exercice 2
##### Vous avez ajouté un buton "Ajouter", une fonction addLoot qui servira plus tard à ajouter un item et un label pourchacun des elements de la liste
##### Le foreach sert à parcourir la liste et à separer les elements pour les lire individuellement. Il est séparé du bouton car le bouton est affiché une seule fois.
## exercice 3
##### Le code ne fonctionne pas car loot n'est pas modifié à l'actualisation.
##### Cela fonctionne avec @State car il sert a enregistrer l'etat de la variable loot avant l'actualisation de la vue, grâce à cela lorsque la vue se recharge elle peut recuperer l'etat de la variable et l'utiliser pour l'initialiser au lieu de reprendre l'etat déclaré de base, cela aide a prendre en compte les modifs.

# Page 4
## exercice 1
##### Cela ne marche pas car la mise à jour ne recupere pas les changements detats de l'objet 
##### ForEach<Array<String>, String, Text>: the ID Magie de feu occurs multiple times within the collection, this will give undefined results! ça ecrit ça parce que l'objet ajouté plusieurs fois à le meme id

## exercice 2
##### Cela fonctionne de nouveau car maintenat le code declenche automatiquement des mises à jour de l’interface utilisateur lorque les propriétés de l'objet changent
##### @StateObject est utilisé pour les nouveaux objets observables que la vue possède alors que @ObservedObject est utilisé pour les objets observables que la vue n'a pas créé mais simplement reçu. State n'est pas adapté aux objets
