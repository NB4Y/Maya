INSERT INTO Utilisateur
VALUES ('test_login', 'test_nom', 'test_prenom' 'test_email', 'test_pwd');

INSERT INTO Recette
VALUES (1, 'test_recette', 'test_descriptif', 'test_login', 'Moyen', 2, 2, 15);

INSERT INTO Planning (ID_Planning, Utilisateur, ID_Recette, Archive)
VALUES (2, 'test_login', 1, 0);

INSERT INTO Ingredient
VALUES (5, 'test_Ingredient', 100, 50, 200, 25, 2, 'u', 0, 1);
INSERT INTO Ingredient
VALUES (52, 'test_Ingredient2', 100, 50, 200, 25, 2, 'u', 0, 1);

INSERT INTO Liste_Achat (ID_Liste_Achat, Utilisateur, ID_Ingredient, Archive)
VALUES (4, 'test_login', 5, 0);

INSERT INTO Categorie
VALUES (10, 5);

INSERT INTO Regime
VALUES (20, 1, 'test_Regime');

INSERT INTO Media
VALUES (30, 1, 'image', 'test_image.png');

INSERT INTO Ingredient_Utilisateur
VALUES ('test_login', 52, 50);

INSERT INTO Ingredient_Recette
VALUES (1, 5, 50);

INSERT INTO Etapes
VALUES (1, 1, 'Description', 10);
INSERT INTO Etapes
VALUES (1, 2, 'Description2', 5);
