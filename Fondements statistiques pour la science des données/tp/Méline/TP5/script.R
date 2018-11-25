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


####################################################
# Temperatures mensuelles dans 15 villes de France #
####################################################

# 1. importer temperature (factomineR, rcmdr, plugins, importer .txt)
# 2. CAH sur données centrées réduites 

# Construction d'un CAH
# Soit :
# - partie A) Directement sur le jeu de données
# - partie B) A partir des coordonnées factorielles (de l'ACP) => particulier à FactoMineR

# var représentatives des indiv : données, jeu de données actives, nom des cas

# Centrer réduire les données : données, gérer var, standardiser les var
# ici choisir les mois de l'année
# les données centrées réduites ne sont pas bornées (au delà de 2 (à 2 écarts type de la moyenne), données remarquables car seules 5% dépassent -1,96 ou 1,96)
# écart-type = 1 signifie, à 1 écart-type de la moyenne
# pas obligatoire de centrer-réduire (mêmes unités de mesure) mais on choisit de mettre les variables en équilibre


# Réalisation de la classification
# analyse multivariée, classif, classif hiérarchique

# 2 choix principaux : 1 [distance] d et 1 [indice d'aggrégation] delta
# distance : ressemblance entre individus
# indice d'aggrég : ressemblance entre groupes d'individus (chemin le + court entre 2 indiv, centre de gravité...) - dépend de la distance

# distance euclidienne : ressemblance entre 2 indiv
# indice d'aggrégation de Ward : après aggrégation, regarde si l'inertie augmente bcp

# choisir les données centrées réduites : Z....

# dendogramme = arbre hiérarchique (binaire)

# construction : regarde les plus proches, 1er construit dans la hiérarchie (clermont et vichy)
# HClust.1 dans rcmdr
# HClust.1$merge dans rcmdr
# autant d'étapes que d'individus - 1

# [,1] [,2]
# [1,]   -3  -15 # étape 1
# [4,]   -11  1 # étape 4

# 1ère étape : aggréger 3 et 15 ("-" désigne un individu, lorsqu'il n'y en a pas, il s'agit d'un groupe)
# 4e étape : aggrège -11 avec l'étape 1 (paris + aggrégation clermont-vichy)
# données, éditer permet de lire les id des individus

# HClust.1$height dans rcmdr
# ordonnée : hauteur d'aggrégation (ex: vichy - clermont = 0.52)

# construire une partition
# CAH permet d'obtenir des partitions imbriquées les une dans les autres
# faire une partition forme 1 classe de plus en subdivisant une précédente en 2

# stats, analyse multi, classif, ajouter les classes au jeu de données
# = construire une col de partition/classes dans le tableau de données
# soit créer une variable de partition

# stats, analyse, résumer
# couper en 3 classes : tracer une droite à 3 intersections
# décrit chacune des classes : cluster centroids : centre de gravité/barycentre
# fait la moyenne des valeurs pour chaque mois (janvier, fev...)
# ex : indice 1, Z.aout = 1.1597154 signifie : moyenne des villes de la classe 1 mais à partir des 
# données centrées réduites ; ces villes sont en moyenne 1,16 écarts-type au dessus de la moyenne
# en août, dans la classe 1, la t° moyenne est 1,16 écart-type au dessus de la moyenne des villes
# classe 3 : négatif, t° moyenn e en dessous

# analyse multiv, liens simples, euclidienne :
# lien minimum = lien simple = peu satisfaisant pour de nombreuses applications

#############################################
# analyse conseillée, celle de factomineR : #
#############################################

# B)

# factominer, acp
# tableau de données : villes (indiv) à mois (quantitatives) => ACP
# choisir janvier à déc, nb de dimensions : Inf
# réaliser une classif après l'ACP
# interactif
# nombre de classes entre 2 et 10, sortie graphique & écrire les résultats pour les classes

# ici l'ACP va produire 12 axes (min(12, 15))
# tableau variables/axes
# qui donne les coordonnées factorielles, soit les positions des individus sur les axes
# => CAH à partir de ce tableau
# intérêt de travailler sur les positions des indivs sur les axes : 
# permet de déterminer les axes intéressants et d'ignorer les autres

# A) et B) : on retrouve exactement la même classification
# res.hcp$callt$quot
# valeur du critère optimisé :
# [2] [3] [4] ...
# 0.34 0.62 0.73
# donc 2, avec delta = 0.34 est la coupure optimale
# où delta = intertie INTRA (k classes) / inertie INTRA (k-1 classes)


# interpolation de la partition en 4 classes :
# - composition des classes
# parangons : res$hcp$desc.ind
# dans $para
# - parangons des classes : élts représentatifs de chaque classe (indiv + proches des centres de gravité)
# - variables (mois de l'année) caractéristiques des classes : "Description of each cluster by quantitative variables"
# classe 1 | mean in category (moy classe) | overall mean (moy. pop°) | p_value
# mars      | 5.8                          | 8.23                     | 0.016
# dans classe 1, en mars, la t° est plus petite que dans la pop°, de façon significative (car inf à 5%)
# R prend déjà celles inf à 5%

# signe de la valeur test positive : var + grandes que la moyenne
# V-TEST > 0 : la moyenne de la classe est au dessus de la moyenne de la pop°
# < 0 : moyenne classe < moy pop°
