# c = vecteur
age = c(26, 25, 23, 19, 22, 21, 26, 27, 22, 18, 31, 32, 38, 27, 24, 25)
age

# transforme toutes les valeurs du vecteur
age^2
sqrt(age)
log(age)


# choose(32, 4) = 4 éléments parmi 32
# C 4(indice en haut) 32 (indice en bas) = (32, 4)

# le tableau commence à la valeur 1
age[3]

# valeurs 10, 11, 12
age[10:12]
age[c(2, 4, 6)]

# exclut les valeurs 1 à 5
age[-(1:5)]

jeune = age[age<20]
jeune

# nombre de valeurs
length(age)
# ordonner les valeurs
sort(age)
# obtenir le min/max/sum
min(age); max(age); sum(age);
# moyenne
mean(age)
# mediane : partage la série en deux morceaux égaux = Quartile 2
median(age)
# écart type : standard deviation (de la moyenne) = racine carrée de s²
sd(age)
# variance S² = tous les écarts au carré à la moyenne, puis leur moyenne (dispersion autour de la moyenne)
var(age) # 1/(n(1)) remplace 1/n dans la formule de S²

summary(age)
quantile(age) # quartiles : partage en portions égales de 25%
# valeur en dessous de laquelle il y a x %

# formule de la variance E(x²)-E(x)² = VAR(X)
mean(age^2) - mean(age)^2 # celui pour les ACP ?

#########################################
#########################################

# graphe "indexé" (selon leur index, ordre d'apparition)
plot(age)
plot(sort(age))
plot(sort(age), type="h") #modifie tracé

stripchart(age) #nuage de points (représentation axiale)

# ?
# stack permet d'éviter la superposition des points
stripchart(age, method="stack", pch=20, col="blue")
?stripchart # HELP

# histogramme
hist(age)
hist(age, col="steelblue4", border="white", main="Histogramme de la variable Age", xlab="Age de l’enquet́e", ylab = "effectif")

colors()

# découpage en classes d'amplitude égale
hist(age, breaks=c(18,20,24,27,32,38), main="Histogramme de la variable Age", col="steelblue4", border="white", xlab="Age de l’enquete", ylab = "densit́e")
hist(age, breaks=c(18,32,38), main="Histogramme de la variable Age", col="steelblue4", border="white", xlab="Age de l’enquete", ylab = "densit́e")

# boîte à moustache
boxplot(age)
boxplot(age, col="pink", horizontal=TRUE, notch=TRUE, xlab="Age de l’enquete")
# calcul des quartiles
# entre q1 et q3 : boîte centrale
# moustaches : min et max ; ici l'extrémité ne va pas jusqu'au max, parce que trop loin
# = valeur "extrême", "remarquable", atypique...
# seuil : on part du bord de la boîte, on rajoute 1* et demi la longueur de la boîte, (Q3 + 1,5(Q3-Q1)) = limite supérieure
# on peut comparer deux boîtes à moustaches

# 9 graphiques selon 3 lignes et 3 colonnes
par(mfrow=c(3,3))
# donc réexécuter les graphiques permet de les avoir sur la même page

par(mfrow=c(1,1))

# install.packages("FactoMineR", dependencies=TRUE)
Dataset

# attention aux accents
# Dataset <- read.table("clipboard", header=TRUE, sep="\t", na.strings="NA", dec=",", strip.white=TRUE)

# pmax(juillet, aout) # par ligne donc par ville

# découper une variable en classe : changement de nature de variable (quantitative -> qualitative)
# VAR
# Quanti (numeric) | Quali (factor)

# 5 villes dans chacun des intervalles = découpage en 9 lat/long

# standardisé : moyenne nulle (centré réduit)

# stats descriptives : choisir coeff de variation, sur tous les mois de l'année OU toutes les var
# pour voir le mois où les températures sont les plus proches : écart type. Ici avril.

# coeff de variation = mesure de dispertion "standardisée", normalisé = écart type / moyenne (indépendante de l'unité de mesure)

# graphe des moyennes
# trois catégories de latitude (= du sud au nord)
# + de dispersion pour les villes du nord ; centre = + homogène... ECARTS TYPES + TENDANCES CENTRALES

# graphe : boîte de dispersion - boîtes à moustaches. Peu adaptées mais permet de voir valeurs extrêmes

# voir dispersion latitude ?

# en bandes : toutes les villes restent visibles (valeurs individuelles restent représentées)


