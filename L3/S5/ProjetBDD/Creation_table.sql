/* Creation des tables */

CREATE TABLE Utilisateur 
(
	Login Varchar(20) PRIMARY KEY NOT NULL,
	Nom Varchar(20) NOT NULL,
	Prenom Varchar(20) NOT NULL,
	email Varchar(20) NOT NULL,
	Password Varchar(20) NOT NULL
);

CREATE TABLE Recette
(
	ID_Recette int PRIMARY KEY NOT NULL, 
	Recette Varchar(20) NOT NULL, 
	Descriptif Varchar(100), 
	Auteur Varchar(20) NOT NULL, 
	Difficulte Varchar(20) NOT NULL,
	Prix int NOT NULL,
	Nombre_personnes int NOT NULL,
	Duree int NOT NULL
);

CREATE TABLE Planning 
( 
	ID_Planning int PRIMARY KEY NOT NULL, 
	Utilisateur Varchar(20) NOT NULL, 
	ID_Recette int NOT NULL, 
	Date_ date NOT NULL, 
	Archive int NOT NULL 
);

CREATE TABLE Ingredient 
( 
	ID_Ingredient int PRIMARY KEY NOT NULL, 
	Ingredient Varchar(20) NOT NULL, 
	Calories int NOT NULL, 
	Lipides int NOT NULL, 
	Glucides int NOT NULL, 
	Protides int NOT NULL, 
	Popularite int NOT NULL, 
	Type_Quantite Varchar(2), 
	Defaut int NOT NULL, 
	Remplacable int NOT NULL
);

CREATE TABLE Liste_Achat 
( 
	ID_Liste_Achat int PRIMARY KEY NOT NULL, 
	Utilisateur Varchar(20) NOT NULL, 
	Date_ date NOT NULL, 
	ID_Ingredient int NOT NULL, 
	Archive int NOT NULL 
);

CREATE TABLE Categorie 
(
	ID_Categorie int PRIMARY KEY NOT NULL, 
	ID_Ingredient int NOT NULL
);

CREATE TABLE Regime 
(
	ID_Regime int PRIMARY KEY NOT NULL, 
	ID_Recette int NOT NULL,
	Regime Varchar(20) NOT NULL
);

CREATE TABLE Media 
(
	ID_Media int PRIMARY KEY NOT NULL, 
	ID_Recette int NOT NULL,
	Type Varchar(20) NOT NULL, 
	Lien Varchar(40) NOT NULL
);

CREATE TABLE Ingredient_Utilisateur 
( 
	Utilisateur Varchar(20) NOT NULL, 
	ID_Ingredient int NOT NULL, 
	Quantite int NOT NULL
);

CREATE TABLE Ingredient_Recette 
(
	ID_Recette int NOT NULL, 
	ID_Ingredient int NOT NULL, 
	Quantite int NOT NULL
);

CREATE TABLE Etapes 
(
	ID_Recette int NOT NULL, 
	Numero_etape int NOT NULL, 
	Description Varchar(100) NOT NULL, 
	Duree int NOT NULL
);

/* Constraints */
ALTER TABLE Recette ADD CHECK (Difficulte IN ('Tres facile', 'Facile', 'Moyen', 'Difficile'));
ALTER TABLE Recette ADD CHECK (Prix BETWEEN 1 AND 5);
ALTER TABLE Ingredient ADD CHECK (Type_Quantite IN ('g','cl','u'));
ALTER TABLE Ingredient ADD CHECK (Defaut IN (0,1));
ALTER TABLE Ingredient ADD CHECK (Remplacable IN (0,1));
ALTER TABLE Etapes ADD CONSTRAINT PK_Etapes PRIMARY KEY (ID_Recette, Numero_etape);
ALTER TABLE Planning MODIFY Date_ DEFAULT Sysdate;
ALTER TABLE Liste_Achat MODIFY Date_ DEFAULT Sysdate;

/* Foreign keys */
ALTER TABLE Recette ADD FOREIGN KEY (Auteur) REFERENCES Utilisateur (Login);
ALTER TABLE Planning ADD FOREIGN KEY (Utilisateur) REFERENCES Utilisateur (Login);
ALTER TABLE Liste_Achat ADD FOREIGN KEY (Utilisateur) REFERENCES Utilisateur (Login);
ALTER TABLE Ingredient_Utilisateur ADD FOREIGN KEY (Utilisateur) REFERENCES Utilisateur (Login);
ALTER TABLE Planning ADD FOREIGN KEY (ID_Recette) REFERENCES Recette (ID_Recette);
ALTER TABLE Etapes ADD FOREIGN KEY (ID_Recette) REFERENCES Recette (ID_Recette);
ALTER TABLE Regime ADD FOREIGN KEY (ID_Recette) REFERENCES Recette (ID_Recette);
ALTER TABLE Media ADD FOREIGN KEY (ID_Recette) REFERENCES Recette (ID_Recette);
ALTER TABLE Ingredient_Recette ADD FOREIGN KEY (ID_Recette) REFERENCES Recette (ID_Recette);
ALTER TABLE Liste_Achat ADD FOREIGN KEY (ID_Ingredient) REFERENCES Ingredient (ID_Ingredient);
ALTER TABLE Ingredient_Utilisateur ADD FOREIGN KEY (ID_Ingredient) REFERENCES Ingredient (ID_Ingredient);
ALTER TABLE Ingredient_Recette ADD FOREIGN KEY (ID_Ingredient) REFERENCES Ingredient (ID_Ingredient);

