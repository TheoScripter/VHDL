# Projet VHDL - Système Intégré

Ce projet VHDL comprend plusieurs composants pour un système intégré, comprenant un convertisseur BCD vers 7 segments, un filtre numérique, et une interface UART.

## Composant BCD to 7-seg

Le composant BCD to 7-seg est responsable de la conversion d'un nombre en format BCD (Binary Coded Decimal) en un format compatible avec l'affichage 7 segments.

## Composant Filtre Numérique

Le composant Filtre Numérique est un filtre passe-bas du premier ordre en VHDL.

## Composant UART System

Le composant UART System est une interface UART simple avec un émetteur, un récepteur, une logique de contrôle de flux (XON/XOFF), et un contrôleur d'interruption.

## Comment Utiliser

1. Clonez ce dépôt dans votre environnement de développement VHDL.
2. Utilisez les composants individuellement ou intégrez-les dans un seul projet selon vos besoins.
3. Ajoutez les fichiers de testbench pour chaque composant pour simuler le comportement du système.

## Tests

Des exemples de testbench sont fournis pour chaque composant. Vous pouvez les utiliser comme point de départ pour tester le comportement de chaque module.
