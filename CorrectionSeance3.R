# Mise en mémoire des packages utiles
library(dplyr)
library(nycflights13)
library(skimr)
library(ggplot2)

# Mise en mémoire de diamonds et
# affichage de son fichier d'aide
data(diamonds)
?diamonds

# Aide du package nycflights13
help(package = "nycflights13")

# Nombre de lignes de weather
nrow(weather)
weather


# Création de alaska_flights
alaska_flights <- flights %>%
  filter(carrier == "AS")

alaska_flights

ggplot(data = alaska_flights, aes(x = dep_delay, y = arr_delay)) +
  geom_point()









# -------------------------------------------------





# Affichage du tableau flights dans un onglet de RStudio
View(flights)


# Exercices 3.3.1

## chacune des lignes du tableau corrspond aux données d'un vol (réponse B)
## Nombre de vols ayant décollé de JFK le 12 février 2013 : 282. On le détermine en ajustant les sliders, les filtres, etc.


# Exercices 3.3.2

## `tailnum` (numéro d'identification de l'avion), `origin` (aéroport de départ de l'avion), et `carrier` (compagnie aérienne) sont des variables catégorielles. Les valeurs sont des chaînes de caractères et non des chiffres.


# Exercices 3.4

## Consultez l’aide du jeu de données diamonds du package ggplot2.
library(ggplot2)
?diamonds

## Quel est le code de la couleur la plus prisée ? D
## Quel est le code de la moins bonne clarté ? I1
## À quoi correspond la variable z ? La profondeur des diamands en millimètres
## En quoi la variable depth est-elle différente de la variable z ? Il s'agit d'un ratio entre z et la moyenne des 2 autres dimensions du diamands

## Consultez l’aide du package nycflights13 en tapant help(package="nycflights13").
help(package="nycflights13")

## Consultez l’aide des 5 jeux de données de ce package.
?airlines
?airports
?flights
?planes
?weather

## À quoi correspond la variable visib ? Visibilité en miles
## Dans quel tableau se trouve-t’elle ? Weather
## Combien de lignes possède ce tableau ? 26115
nrow(weather)


# Exercices 4.3

## alaska_flights contient les mêmes variables que flights, mais beaucoup moins de lignes : seulement 714.
alaska_flights <- flights %>%
  filter(carrier == "AS")
alaska_flights


# Exercices 4.3.3

## Donnez une raison pratique expliquant pourquoi les variables `dep_delay` et `arr_delay` ont une relation positive
# Le retard au départ se répercute forcément sur le retard à l'arrivée. Sauf s'il est possible pour un avion de rattraper son retard en vol, ce qui semble peu probable.

## Quelles variables (pas nécessairement dans le tableau alaska_flights) pourraient avoir une corrélation négative (relation négative) avec dep_delay ? Pourquoi ? Rappelez-vous que nous étudions ici des variables numériques.
## On peut supposer que la température et le rayonnement solaire sont corrélés négativement à `dep_delay`. Quand les conditions météos se dégradent (moins de soleil, température plus faible) les retards augmentent car les avions et les pistes doivent être (re)mis en état plus souvent. Cela demande plus de maintenance.

## Selon vous, pourquoi tant de points sont-il regroupés près de (0, 0) ? La majorité des vols décollent et aterrisent à l'heure ou avec peu d'avance ou de retard
## À quoi le point (0,0) correspond-il pour les vols d’Alaska Airlines ? Cela correspond à la situation idéale de décollage et d'aterrissage à l'heure.
## Citez les éléments de ce graphique/de ces données qui vous sautent le plus aux yeux ? La relation est linéaire et positive. La majorité des vols est à peu près à l'heure, mais il y a une forte variabilité avec des vols accumulant plus de 3h de retard.
## Créez un nouveau nuage de points en utilisant d’autres variables du jeu de données alaska_flights
ggplot(data = alaska_flights, mapping = aes(x = month, y = arr_delay)) +
  geom_point()


# Exercices 4.3.6

set.seed(4532) # Afin que tout le monde récupère les mêmes lignes
diams <- diamonds %>%
  sample_n(5000)

ggplot(diams, aes(x = carat, y = price, color = clarity)) +
  geom_point(shape = 4, alpha = 0.6)

# Les bandes verticales sont le résultats d'approximations humaines. On a tendance à arrondir au carat "rond" immédiatement supérieur (2 au lieu de 1.98, 1.7 au lieu de 1.69, etc).

# Exercices 4.4.2

small_weather <- weather %>%
  filter(origin == "EWR",
         month == 1,
         day <= 15)

small_weather

## Expliquez pourquoi la variable `time_hour` identifie de manière unique le moment ou chaque mesure a été réalisée alors que ce n’est pas le cas de la variable `hour`.
## `hour` est une variable entière qui prend les valeurs 0 à 23 chaque jour de l'année. Indiquer qu'une mesure a été faite à 13h n'est pas suffisant car elle a pu être faite n'importe que jour. La variable `time-hour` contient la date et l'heure de chaque mesure.


