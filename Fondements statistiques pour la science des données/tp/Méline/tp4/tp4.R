#       X     Y
# 1    1     2
# 2    2     0.5
# 3    2     1
# 4    4     2
# 5    4     3

# 5 individus décrits par leurs coord dans le plan

# Données, nouveau jeu de données, ...

Dataset = data.frame(
  X=c(1, 2, 2, 4, 4), Y=c(2, 0.5, 1, 2, 3)
  )

# RCommanderstats, analysée multivariée, classif, classif hiérarchique
# distance de manhattan : en contournant des blocs
# lien minimum = indice d'aggrégation qui permet de mesurer l'écart entre deux groupes d'indiv, la distance = le chemin le plus court (min)
# single linkage = lien simple = lien minimum

# 2 et 3 à une hauteur de 0.5
# 4 et 5 à une hauteur de 1
# ...

# ce qui compte = la hauteur des paliers
# résumer la classif hiérar
# H clust = prendre le dernier arbre

# séparation en 3 classes (tracer une droite à 3 intersections sur l'arbre)
# classe 1 : centre de gravité confondu avec l'élément (1)

# ajouter classes : même menu, sélectionner le bon nombre de classes

# graphe, nuage de points : (représenter les coord avec vision des classes)



#################################
#importer villes puis données, jeu de données, nom des cas, 

# réduction pas obligatoire
# données, gérer, standardiser mois de l'année
# Z.septembre au lieu de septembre
# CAH : classif hiérarchique avec données centrées réd
# clermont et vichy sont celles qui ont les profils de temp° les plus proches

#Constructiion d'un CAH#
########################

#Directement sur le jeu de données
#A partir des coordonnées factorielles (de l'ACP) -> particulier à FactoMineR

#2 choix principaux : 
  #distance (d) -> ressemblances entre individus (euclidienne)
  #indice d'agrégation (delta) -> ressemblances entre groupes d'individus (Ward)

#dendogramle (=) arbre hiérarchique
#HClust.1$merge (=) (-) agrégation d'un individu / (+) agrégation d'un groupe d'individus
#un numéro correspond à un individu (sa position dans le jeu de données)

#en août, dans la classe 1, la température moyenne est à 1.16 écart-type au dessus de la moyennes des villes

