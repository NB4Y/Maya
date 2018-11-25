#   opinion OGM        profil socio-démog
# Q1-----------Q16 | Q1-------------------Q5
#
#  données quali        données quali
#
#
# ------------------------------------------

# Question : "exercez-vous un métier en rapport" => personne informée
# Ici, les données sont qualitatives

# En ACM : repérer les modalités rares...
# = "tris à plat", regarder par question comment les gens ont répondu grâce à un Tableau de Fréquences par Variable (question)

# Données d'enquêtes : pas d'infos sur la personne, anonymisée, les individus sont automatiquement numérotés
# = pas de nom pour les individus (1 -> 135)

# résumé du jeu de données :
# Accessible via "statistiques", "résumé", "jeu de données actifs" dans Rcmdr
# Accessible via "statistiques", "résumé", "distribution de fréquences" pr var qualitatives dans Rcmdr
# Accessible via "statistiques", "résumé", "statistiques descriptives" pr var quantitatives dans Rcmdr
summary(Dataset)

# Repérer les modalités "rares" qui perturbent les résultats de l'ACM
# => en ACM, elles ont tendance à modifier l'analyse de façon radicale, si choisi par moins de 2% des individus

# Position.Culture
3/135 # 2,2%

# Position.Alimentation.Humaine
1/135 # 0.7%

# Ces modalités sont trop peu exprimées pour les conserver dans la suite.
# On les regroupe donc avec une modalité "voisine", de sens similaire.

# Dans Rcmd : "Données", "gérer les variables", "recoder des variables"
# Ex: sélectionner Position.Culture, Alimentation Humaine, donner un nouveau nom de variable pour ne pas écraser valeur de départ (rec.)
# Directives : "Tres Favorable" = "Favorable" (Une modalité devient une autre)
# Modalité /!\ n'est pas égale à variable

summary(Dataset)
# on a 2 colonnes supplémentaires à la fin

#   opinion OGM        profil socio-démog      variables recodées
# Q1-----------Q16 | Q1-------------------Q5 | ------------------
#                                                       |
#  données quali        données quali                   |
#                                                       |
#                                                       |
# --------------------------------------------------------------
#     ACTIVES

# choix des variables actives
# travail sur le profil des personnes, ce qu'elles ont répondu, l'ensemble...
# ici on prend les variables de l'enquête, avec nos variables recodées
# cela signifie qu'on a pour objectif de comparer les enquêtés par rapport à leur ressentis vis à vis des OGM
# si on prenait le profil socio-démog, on voudrait comparer individus en fonction de leurs caract. démog.
# = choix de ce qui permet de calculer les distances entre individus
# en ACM, la distance entre deux individus = d'autant plus proches l'un de l'autre que leurs réponses sont similaires (nb de choix en commun)
# "défaut" => pour degré de satisfaction (4 et 5 ont le même éloignement que 0 et 5)
# si on voulait tenir compte de ces écarts, on utiliserait du quantitatif, soit une ACP

# Faire l'ACM
# Rcmdr : charger plugin après sauvegarde des données
# var illustratives = les autres
# sorties : tout cocher

# CTRL+R pour exec
# X11()
# plot.MCA(res, axes=c(1, 2), new.plot=TRUE, col.ind="black", 
#         col.ind.sup="blue", col.var="darkred", col.quali.sup="darkgreen", 
#         label=c("ind", "ind.sup", "quali.sup", "var"))


# Retoucher les graphes pour exporter les résultats dans une page web
# Avec FactoShiny
# 1) library(Factoshiny)
# 2) MCAshiny(res)

library(Factoshiny)
MCAshiny(res)

# Individus : parabole, V => Effet Guttman
# Valeurs propres : en ACM les inerties sont souvent sur un très grand nb d'axes
# Nb d'axes en ACM : nombre total de modalités - nombre de variables (K-J)
# 100 questions à 5 modalités : K = 500, J = 100 soit 400 dimensions
# chez nous 22 dimensions
# dimensions remarquables : 2 dimensions (voir graphique)(la suite de la décroissance se fait au ralenti)
# nb d'axes à partir de l'inertie moyenne : 

# I moyenne = i totale / nb d'axes
# sum(res$eig[,1])/22
mean(res$eig[,1]) # 0.0625
# ici ce critère nous fait prendre les axes 1 à 7, ce qui est "trop"

# I totale en ACM = (K/J)-1   /  K-J (nb d'axes)
# 1/J = 1/16

# QUESTION 7 ON LA VIRE

# ACM : MODA + IND
# VAR = VAR

# le graphe des variables : permet de distinguer les plus liées aux axes
# 3 variables/questions à l'origine de la construction des axes 1 et 2 (cause les plus grands "désaccords") = position
# les autres n'y participent que très peu

# modalités dans les mêmes environs que ces 3 variables, en haut à gauche : Modalités Pas fav du tout, en haut à gauche on trouvera le profil inverse (fav aux OGM), 
# et au milieu des avis moins tranchés (forme = V -> guttman)
# axe 1 : ++ favorable à -- favorable (l'orientation de l'axe n'a pas d'importance)
# axe 2 : opinion tranchée VS, + bas, peut-être moins bien renseignés, avis pas très marqué, nuancés

# modalités illustratives très liées aux dimensions ? sont très au milieu de l'ACM (origine des axes) => modalité = barycentre
# ex : [26:40] près de l'origine, signifie que les réponses sont réparties un peu partout sur le plan
# donc pas très lié aux axes
# modalité proche de l'origine = pas en liaison avec une dimension
# les verts sont très liés

# sur le graphe des variables, quasiment à l'origine = pas lié
# parti politique est l'illustrative la plus liée, mais modestement

# dessiner des ellipses de confiance autour des modalités
# la commande (hors de factoshiny)
plotellipses(res,keepvar=c("rec.Position.Culture", "Parti.Politique", "Sexe", "Grds.Parents"))


