########################################################################
#TP n°03 - Analyse factorielle des correspondances simples et multiples#
########################################################################

####################################
#1 - Elections presidentielles 2012#
####################################


#diagrammes en batons#
######################

par(mar = c(6,10,4,2))

#Bas-Rhin
barplot(as.matrix(president12[68,2:11]),names.arg=colnames(president12)[2:11],col="purple3",border="white",main="Bas-Rhin",horiz=T,las=1,xlab="nombre de voix", cex.lab=1.2)

#Paris
barplot(as.matrix(president12[76,2:11]),names.arg=colnames(president12)[2:11],col="purple3",border="white",main="Paris",horiz=T,las=1,xlab="nombre de voix", cex.lab=1.2)

#Seine Saint-Denis
barplot(as.matrix(president12[94,2:11]),names.arg=colnames(president12)[2:11],col="purple3",border="white",main="Seine Saint-Denis",horiz=T,las=1,xlab="nombre de voix", cex.lab=1.2)

#Vaucluse
barplot(as.matrix(president12[85,2:11]),names.arg=colnames(president12)[2:11],col="purple3",border="white",main=rownames(president12)[84],horiz=T,las=1,xlab="nombre de voix", cex.lab=1.2)

#variables qualitatives
  #variables que l'on ne peut pas effectuer des opérations (nom de candidat, couleur, etc...)

#profil-ligne#
##############

par(mar = c(6,10,4,2))
barplot(as.matrix(president12[68,2:11])/sum(president12[68,2:11]),names.arg=colnames(president12)[2:11],col="purple3",border="white",main="Bas-Rhin",horiz=T,las=1,xlab="pourcentage", cex.lab=1.2)

#test du chi2#
##############

#objectif : est ce que les votes obtenus par les candidats dependent des departements ?

#test (=) hypothèse H0 : hypothèse d'indépendance entre V1 (candidat) et V2 (departement)
#     (=) hypothèse H1 : non indépendance entre V1 et V2

resu.chi2 = chisq.test(president12[1:96,2:11])
summary(resu.chi2)

#observed = votes observés
#expected = votes attendus (en cas d'indépendance)

#p.value (=) niveau de risque que l'on encoure en rejetant H0
#si cette valeur est trop faible, on rejette l'hypothese (=) lien de dépendance entre V1 et V2
#instaurer un seuil (alpha) de risque de 5% -> on ne rejette pas l'hypothese si p.value >= 5%

resu.chi2$p.value

#nij = effectifs observes v. tij = effectifs theorique/attendus si independance
#tij = (ni * nj) / n
#en cas d'independances, les profils colonnes et lignes sont les mêmes
#chaque candidat a le meme pourcentage de votes dans l'ensemble des departements

resu.chi2$expected
resu.chi2$expected[1,]/sum(resu.chi2$expected[1,])

#avec une AFC, on cherche a savoir dans quelle mesure les profils des departements sont differents entre eux
#examine la variabilite des profils (a quel point on est loin de l'egalite des profils)

#FactorMineR
  #AFC
#supplémentaire (=) illustrative

#inertie totale en AFC (=) notion de dispersion, d'heterogeneite
#somme des masses (mi) * distance²(element (i), centre de gravite)
#inertie totale = D² (=) mesure globale d'ecarts a l'independance (entre observes et theoriques)
#D² (=) mesure globale d'ecart (pour chaque case, on fait la comparaison -> ((nij - tij) / tij), D² etant la somme de toutes ces comparaisons)

resu.chi2$statistic
sum(president12[1:96,2:11])
resu.chi2$statistic/sum(president12[1:96,2:11])

#inertie totale = somme des valeurs propres -> res$eig (0 -> homogeneite totale (=) independance)

res$eig
sum(res$eig[,1])

#nombre d'axes en AFC ? min(I,J) - 1 (I = nombre de lignes ; J = nombre de colonnes)
#critere de l'inertie moyenne (=) critere de Kaiser

sum(res$eig[,1])/9

#on regarde quelles valeurs propres depasse cette moyenne (=) axes potentiellement interessants

#consulter les resultats de l'AFC avec Factoryshiny (CAshiny(res) ; PCAshiny(res) pour ACP)
library(Factoshiny)
CAshiny(res)

#lignes actives = dep
#lignes supplementaires = totalDep
#element invisible : show graph options, on fait disparaitre les colonnes
#pourquoi le total des departements n'est pas au centre ? -> les DOMTOM ne sont pas inclus
#profil des lignes = somme / n (idem pour les colonnes)

#on cherche a reperer les elements qui sont les plus contributifs d'une dimension factorielle

names(res)
sort(res$row$contrib[,1])

#contribution = masse * coordonnees² (suffit de juger l'eloignement sur ACP, ne marche pas avec les AFC parce que les poids peuvent etre different)
#autour d'un element (candidat), on voit les departements proches (vote important) et les departements eloignes (vote peu important)

sort(res$col$contrib[,1])
sort(res$col$contrib[,2])

#plus un profil est proche du centre de gravite, plus le profil est "moyen" (atyique si eloignement) -> fortes attirances / rejets

##################################################################################################################################