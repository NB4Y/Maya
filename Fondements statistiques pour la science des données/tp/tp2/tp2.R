#ACP normée <=> sur données centrés-réduites ("scaled")

#4. 1ère axe -> 79.85%
#   2ème axe -> 18.97%

#X11() <=> création d'une fenêtre graphique
#aller dans RCommander, insérer X11() dans Script R (ctrl + r pour ouvrir la nouvelle fenêtre),
#surligner le graphe à soumettre et cliquer sur Soumettre

#names(res)
#barplot(res$eig[ligne, colonne]) -> diagramme en bâton

#5. barplot(res$eig[,1])
#   barplot(res$eig[,3])

# critère de Kaiser -> axes potentiellement intéressants 
# = ceux dont l'intertie > Imoyenne 
# = Itotale / nb d'axes 
# = p / min(n, p)
# = p / p
# = 1

# coordonnée d'une variable sur un axe = corrélation avec l'axe (coord = r(x, axe))
# sort(res$var$cor[,1]) -> tri de la corrélation des variables autour de l'axe 1
# un axe vectoriel est une combinaison linéaire de l'ensemble des variables initiales
# Axe 1 : 0.76 Janv + 0.88 Fév + ...
# sort(res$var$cor[,1], decreasing=TRUE)  | sort(res$var$cor[,1], T)

# contribution à l'inertie d'un axe k = masse x coord2 / lambda k (inertie axe k)
# masse(Xj) = 1 prt. j
# exemple Octobre : 1 x 0.98^2 / 9.58 ~= 10.02%
# rea$var$contrib
^
# qualité de représentation sur le plan (1,2)  (cos2 têta)
# = qualité sur l'axe 1 (cos^2 têta1) + qualité sur l'axe 2 (cos têta2)
# sort(res$ind$cos2[,1] + res$ind$cos2[,2])

# plus grosse contribution d'un individu à l'axe 1 : sort(res$ind$contrib[,1])