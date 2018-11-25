##################################################
#TP n??01 - Logiciel R - Introduction a R et Rcmdr#
##################################################

#########################
#2 - Premiers pas sous R#
#########################

#affectation 
x = 45
y <- 5

#plusieurs commandes sur la meme ligne
factorial(5) ; choose(32,4)

#affectation + affichage
(s = sum(1:10))

##########################
#3 - La fenetre de script#
##########################

#ctrl + Enter pour executer une ligne de code
(9^2 + (19^2/22))^(1/4)
99^2/(2206*sqrt(2))

#executer un script non ouvert : source("path/file_name.R", echo=T)

#####################################################
#4 - Resume numerique d'une petite serie statistique#
#####################################################

#serie statistique (vecteur)
age = c(26, 25, 23, 19, 22, 21, 26, 27, 22, 18, 31, 32, 38, 27, 24, 25)
age

#modifier les valeurs d'un vecteur
age^2
sqrt(age)
log(age)

#selectionner une valeur d'un vecteur, avec ou sans conditions logiques
age[3]
age[age<20]

#nombre de valeurs
length(age)

#tri
sort(age)

#minimum
min(age)

#maximum 
max(age)

#somme
sum(age)

#moyenne
mean(age)

#mediane
median(age)

#ecart-type
sd(age)

#variance
var(age)

#summary renvoie quelques informations sur la serie, comme le minimum, la mediane, etc...
summary(age)

#estimation (biaisee ?) de la variance
mean(age^2) - mean(age)^2

######################################################
#5 - Representation graphique d'une serie statistique#
######################################################

#produit un graphe indexe de la serie 
  #abscisse = index (= indice+1)
  #ordonne = valeur
plot(age)

#graphe trie 
  #valeurs sous forme de ronds
plot(sort(age))

#graphe trie (
  #valeurs sous forme de barres qui commencent a l'abscisse et s'arrete a l'ordonnee
plot(sort(age), type="h")

#representation axiale 
 #sur un axe, aussi appele nuage de points
stripchart(age)

#tstack evite la superposition des points
stripchart(age, method="stack", pch=20, col="blue")

#histogramme
  #abscisse = intervalle d'ages
  #ordonnee = nombre de valeurs concernees par l'intervalles
hist(age)
hist(age, col="steelblue4", border="white", main="Histogramme de la variable Age", xlab="Age de l'enquete", ylab="effectif")

#histogramme avec decoupage en classes d'amplitudes inegales (?)
hist(age, breaks=c(18,20,24,27,32,38), main="Histogramme de la variable Age", col="steelblue4", border="white", xlab="Age de l'enquete", ylab="densite")

#boite a moustaches (de haut en bas / de droite a gauche)
  #premier trait = min(max,Q3+1.5*(Q3-Q1))
  #top de la boite = Q3 (quartile 3)
  #trait en gras = mediane (Q2)
  #bottom de la boite = Q1
  #dernier trait = max(min, Q1-1.5*(Q3-Q1))

  #espace interquartile = Q3-Q1
boxplot(age)
boxplot(age, col="pink", horizontal=TRUE, notch=TRUE, xlab="Age de l'enquete")

#par(mfrow=c(a,b)) affiche a*b graphes sur a lignes b colonnes

#########################################################
#6 - L'installation de nouveaux packages (ou librairies)#
#########################################################

#installation = install.packages("library_name", dependencies=TRUE) -> permanent
#chargement = library -> non permanent (a faire quand necessaire a chaque session)

#####################################
#7 - Importation d'un jeu de donnees#
#####################################

#Donnees 
  #Importer des donnees
    #depuis un fichier texte, le presse papier ou une URL

#pour effectuer a nouveau une commande depuis Rcommander
  #cliquer sur la commande
  #cliquer sur "Soumettre"

#######################################
#8 - Premiers traitements statistiques#
#######################################

#declarer une variable comme identificateur des individus (lignes)#
###################################################################

#Donnees
  #Jeu de donnees actif
    #noms des cas

#renommer une variable#
#######################

#Donnees
  #Gerer les variables du jeu de donnees actif
    #Renommer une variable

#ajouter une variable#
######################

#Donnes
  #Gerer les variables du jeu de donnees actif
    #Calculer une nouvelle variable

#pmax(a,b) = renvoie le max entre a et b pour CHAQUE ligne

#decouper une variable en classe#
#################################

#Donnees
  #Gerer les variables du jeu de donnees actif
    #Decouper une variable numerique en classe

#valeurs centrees - reduites#
#############################

#Donnees 
  #Gerer les variables du jeu de donnees actif
    #Standardiser des variables

#produire un resume statistique de chacune des variables du jeu de donnees#
###########################################################################

#Statistiques
  #Resumes
    #Jeu de donnees actif

#un resume statistique renseigne sur
  #min
  #Q1
  #mediane
  #moyenne
  #Q3
  #max

#produire les statistiques descriptives#
########################################

#Statistiques
  #Resumes
    #Statistiques descriptives

#les statistiques descriptives sont
  #moyenne
  #ecart-type
  #espace interquartile
  #quartile 0%
  #Q1
  #mediane
  #Q3
  #quartile 100%

#comparaisons graphique de moyennes#
####################################

#Graphes
  #Graphes des moyennes

#reponse (une)
#facteur (un ou deux)

#boites a moustaches en paralleles#
##################################

#Graphes 
  #Boite de dispersion

#variable (une)
#