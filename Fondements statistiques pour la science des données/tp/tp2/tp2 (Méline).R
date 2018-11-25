# importer un jeu de données (presse papier etc) =/= charger un jeu de données (RData)
# facto mine r : charger dans R et dans RCommander

# ACP
# ACP normée <=> sur données centrées-réduites ("scaled")

# Quelle est l’inertie brute assocíee au premier axe factoriel ? Au second axe ? Quelle est l’inertie totale ?
# 1er : 79.85%, 2e : 18.97%, inertie totale : 
sum(79.85, 18.97) # = 98.82

#X11() = création d'une nouvelle fenêtre graphique
X11()
# pour afficher les résultats intermédiaire dans RCommander :
# sélectionner Plot puis soumettre (après avoir ouvert X11)

# res <- PCA(...)
summary(res)
names(res) # noms contenus : eigenvalues = valeurs propres (avec leur inertie),
# var pour variable, ind pour individus
res$eig

# coord d'un individu sur les axes
# res$ind$coord #ou cos2 ou contrib

# inerties = valeurs propres d'une matrice
# comp1, comp2 = dimension, axes, composantes...
# construction de 12 axes factoriels = la plus petite des deux dimensions du tableau (ici p = 12 et n = 15)
# nb d'axes = min(n,p) = 12

# 1ère colonne = inertie brute ou valeur propre, ici 9,58 puis de 2,28, etc
# voir graphe des individus
# inertie = dispersion, façon dont ils se dispersent le long de l'axe
# lambda 1 = inertie axe 1 = variance des coordonnées des individus sur l'axe 1,
# là où les indiv sont le plus dispersés
# dimension 1 : de froid vers chaud
# inertie totale = p = 12 pour une ACP normée

# 2e colonne : inertie en pourcentage
# = inertie brute / 12

# 3e colonne: inertie cumulée du plan (Axe1, Axe2)

# réponses :
# inertie brute 1er : 9,58, 2e = 2,28, totale = 12 :
sum(res$eig[,1]) #toutes lignes, première col

barplot(res$eig[,1])
barplot(res$eig[,3])

# critère de KAISER
# axes potentiellement intéressants = ceux dont l'inertie est sup à l'inertie moyenne
# inertie moyenne très simple à calculer en ACP normée
# = inertie totale sur nb d'axes
# = P/min(n, p) = P/P = 1
# donc inertie sup à 1 = axe potentiellement intéressants

# regarder les variables les plus liées à chaque axe
# axe 1 sur ACP : les + liés quand quantitatives = corrélées
# la coordonnée d'une variable sur 1 axe = sa corrélation avec l'axe (coord = r(x, axe))
# regarder les positions les plus extrêmes le long de l'axe, en valeurs absolues = les + corrélées

res$var$coord
sort(res$var$cor[,1]) #tri corrélation des var avec l'axe 1
# variable la plus liée à l'axe 1 = octobre

sort(res$var$cor[,2]) #tri corrélation des var avec l'axe 2
# ajout du sens de tri, par défaut croissant : ajout de l'argument "decreasing*TRUE" ou "T"
# ici janvier

# l'axe factoriel est construit comme une combinaison de l'ens des variables initiales
# combinaison linéaire

# chaque axe est une autre combinaison, où chaque variable intervient avec des poids différents
# Chaque axe factoriel est associé à une combinaison linéaire des variables initiales X1...XP
# = somme pondérée où les poids sont la corrélation

# axe 1 : 0,76 Janv + 0,88 Fév + ...
# axe 2 : 0,64 Janv + 0,46 Fév + ...

# calcul d'une contribution : de la variable la plus corrélée à 1 = octobre
# contribution à l'inertie de l'axe
# ex : a apporté la part la plus importante à l'inertie de l'axe

# contribution à l'inertie d'un axe k
# masse * coord² / inertie axe k (lamda indice k)

# coord d'octobre sur l'axe : 0.98
res$var$coord

# variable masse = 1 (quelque soit la variable)

# calcul : 1*0,98² / 9,58 = 

0.98^2 / 9.58
res$var$contrib #à peu près 10%

# qualité de représentation la plus/la moins élevée sur (1, 2)
# qualité de représentation = cos² de l'angle
# = qualité sur axe 1 + qualité sur axe 2
# = cos² têta1 + cos² têta 2
res$ind$cos2
sort(res$ind$cos2[,1] + res$ind$cos2[,2])
# toutes les villes sont très bien représentées, la moins bien étant Paris et la meilleure Brest
# cos² regarde à quel point un point est loin du plan de projection


# individu le plus contrib à la formation de l'axe 1
# à partir de la représentation des individus : contrib = coord*masse
res$ind$contrib
# Marseille, Nic, Lille Strasbourg = les + grandes
sort(res$ind$contrib[,2])
# brest = le + contribué à l'axe 2 (le + d'amplitude thermique, permet d'illustrer l'axe)

# distance dans nuage de départ (espace de 12 dimensions) par rapport au barycentre (G)
sort(res$ind$dist)

# on passe qu 12 et 13

# ajouter variables quantitatives supplémentaires et qualitatives

# variables supplémentaire = illustratives. Permettent d'enrichir l'interprétation des axes. 
# ne participe pas à la construction des axes
# projetées à posteriori sur les axes factoriels

# variable actives : permet de donner ressemblance entre deux individus

# ici on voit que la latitude est bien corrélée à l'axe 1,
# tout comme la moyenne des températures le long des mois de l'année
# l'amplitude thermique est très corrélée à l'axe 2
# ce sont donc des critères très représentatifs (Vartiables illustratives, quantitatives)

# si qualitatif, définit des sous pop d'individus identifiées sur le graphe des individus.
# centre de gravité des villes correspondant à ces sous populations