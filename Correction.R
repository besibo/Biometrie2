# Installation du package ggplot2
# Nécessaire 1 fois seulement sur chaque PC
# install.packages("ggplot2")

# Mise en mémoire du package ggplot2
library(ggplot2)

# Mise en mémoire du jeu de données diamonds
data("diamonds")

# Affichage du contenu du tableau diamonds
diamonds
class(diamonds)

# Dimensions du tableau
dim(diamonds)
nrow(diamonds)
ncol(diamonds)

# Diamants les plus chers
## Première méthode
diamants_chers <- diamonds[ diamonds$price >= 15000 , ]
diamants_chers

## Deuxième méthode
diamants_chers <- subset(diamonds, price >= 15000)
diamants_chers

## Troisième méthode
library(dplyr)
diamants_chers <- diamonds %>%
  filter(price >= 15000)

diamonds %>% filter(price >= 15000)
filter(diamonds, price >= 15000)

# Nombre de diamants chers
sum(diamonds$price >= 15000)

# Proportion de diamants chers
mean(diamonds$price >= 15000)
1656/53940
nrow(diamants_chers) / nrow(diamonds)

# Tri du tableau diamants_chers par ordre de prix décroissant
permut <- order(diamants_chers$price, decreasing = TRUE)
diams_tri <- diamants_chers[ permut , ]

# Affichage des 20 diamants les plus chers
diams_tri[1:20,]
head(diams_tri, 20)

# Autre méthode : utilisation du "pipe"
diamonds %>%
  filter(price >= 15000) %>%
  arrange(desc(price)) %>%
  print(n = 20)

# Équivalent à ceci :
print(arrange(filter(diamonds, price >= 15000), desc(price)), n = 20)

# Exercice 3.4
?diamonds

# Aide du package nycflights13
install.packages("nycflights13")
library(nycflights13)
help(package = "nycflight13")
?weather
nrow(weather)




