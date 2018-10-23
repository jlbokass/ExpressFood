
CREATE TABLE Velo (
                id_Velo INT AUTO_INCREMENT NOT NULL,
                velo_Controle BOOLEAN NOT NULL,
                dat_Revision DATE NOT NULL,
                statut_Velo VARCHAR(100) NOT NULL,
                PRIMARY KEY (id_Velo)
);


CREATE TABLE Cuisinier (
                id_Cuisinier INT AUTO_INCREMENT NOT NULL,
                nom_Cuisinier VARCHAR(100) NOT NULL,
                prenom_Cuisinier VARCHAR(100) NOT NULL,
                telephone_Cuisinier INT NOT NULL,
                PRIMARY KEY (id_Cuisinier)
);


CREATE TABLE Repas (
                id_Repas INT AUTO_INCREMENT NOT NULL,
                id_Cuisinier INT NOT NULL,
                nom_Repas VARCHAR(100) NOT NULL,
                descriptif_Repas VARCHAR(100) NOT NULL,
                date_Cuisine DATE NOT NULL,
                quantite_Cuisine INT NOT NULL,
                prixHT DECIMAL(100,2) NOT NULL,
                taux_TVA DECIMAL(100,2) NOT NULL,
                photo_Repas VARCHAR(100) NOT NULL,
                PRIMARY KEY (id_Repas, id_Cuisinier)
);


CREATE TABLE Categorie (
                id_Categorie INT AUTO_INCREMENT NOT NULL,
                nom_Categorie VARCHAR(100) NOT NULL,
                id_Repas INT NOT NULL,
                id_Cuisinier INT NOT NULL,
                PRIMARY KEY (id_Categorie)
);


CREATE TABLE Client (
                id_Client INT AUTO_INCREMENT NOT NULL,
                numCB INT,
                nomClient VARCHAR(100) NOT NULL,
                prenom_Client VARCHAR(100) NOT NULL,
                date_Naissance_client DATE,
                telephone_Client INT,
                email_Client VARCHAR(100) NOT NULL,
                login_Client VARCHAR(100) NOT NULL,
                pass_Client VARCHAR(100) NOT NULL,
                date_Inscription DATE NOT NULL,
                PRIMARY KEY (id_Client)
);


CREATE TABLE Adresse (
                id_Adresse INT AUTO_INCREMENT NOT NULL,
                id_Client INT NOT NULL,
                numero_Adresse INT NOT NULL,
                nom_Rue VARCHAR(100) NOT NULL,
                nom_Ville VARCHAR(100) NOT NULL,
                immeuble VARCHAR(100),
                digicode INT,
                numero_Porte INT,
                coordonneesGPS DOUBLE PRECISIONS NOT NULL,
                PRIMARY KEY (id_Adresse, id_Client)
);


CREATE TABLE Commande (
                id_Commande INT AUTO_INCREMENT NOT NULL,
                id_Client INT NOT NULL,
                date_Commande DATE NOT NULL,
                prix_HT DECIMAL(100,2) NOT NULL,
                date_Modification DATE,
                statu_Commande VARCHAR(100) NOT NULL,
                debut_Commande DATE NOT NULL,
                Fin_Commande DATE NOT NULL,
                id_Adresse INT NOT NULL,
                PRIMARY KEY (id_Commande, id_Client)
);


CREATE TABLE Ligne_Commande (
                id_Commande INT NOT NULL,
                id_Repas INT NOT NULL,
                quantite_Repas INT NOT NULL,
                PRIMARY KEY (id_Commande, id_Repas)
);


CREATE TABLE Livreur (
                id_Livreur INT AUTO_INCREMENT NOT NULL,
                id_Velo INT NOT NULL,
                nom_Livreur VARCHAR(100) NOT NULL,
                Prenom_Livreur VARCHAR(100) NOT NULL,
                telephone_Livreur INT NOT NULL,
                statut_Livreur VARCHAR(100) NOT NULL,
                position_GPS_Livreur DOUBLE PRECISIONS NOT NULL,
                PRIMARY KEY (id_Livreur, id_Velo)
);


CREATE UNIQUE INDEX livreur_idx
 ON Livreur
 ( id_Velo, nom_Livreur, Prenom_Livreur, statut_Livreur );

CREATE TABLE Livraison_Confirmee (
                id_Livreur INT NOT NULL,
                id_Commande INT NOT NULL,
                id_Client INT NOT NULL,
                PRIMARY KEY (id_Livreur, id_Commande, id_Client)
);


CREATE TABLE Stock_Livreur (
                id_Repas INT NOT NULL,
                id_Livreur INT NOT NULL,
                quantite_transportee INT NOT NULL,
                PRIMARY KEY (id_Repas, id_Livreur)
);


ALTER TABLE Livreur ADD CONSTRAINT velo_livreur_fk
FOREIGN KEY (id_Velo)
REFERENCES Velo (id_Velo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Repas ADD CONSTRAINT cuisinier_repas_fk
FOREIGN KEY (id_Cuisinier)
REFERENCES Cuisinier (id_Cuisinier)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Ligne_Commande ADD CONSTRAINT repas_ligne_commande_fk
FOREIGN KEY (id_Repas)
REFERENCES Repas (id_Repas)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Stock_Livreur ADD CONSTRAINT repas_stock_livreur_fk
FOREIGN KEY (id_Repas)
REFERENCES Repas (id_Repas)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Categorie ADD CONSTRAINT repas_categorie_fk
FOREIGN KEY (id_Repas, id_Cuisinier)
REFERENCES Repas (id_Repas, id_Cuisinier)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Commande ADD CONSTRAINT client_commande_fk
FOREIGN KEY (id_Client)
REFERENCES Client (id_Client)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Adresse ADD CONSTRAINT client_adresse_fk
FOREIGN KEY (id_Client)
REFERENCES Client (id_Client)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Commande ADD CONSTRAINT adresse_commande_fk
FOREIGN KEY (id_Adresse, id_Client)
REFERENCES Adresse (id_Adresse, id_Client)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Ligne_Commande ADD CONSTRAINT commande_ligne_commande_fk
FOREIGN KEY (id_Commande)
REFERENCES Commande (id_Commande)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Livraison_Confirmee ADD CONSTRAINT commande_livraison_confirmee_fk
FOREIGN KEY (id_Commande, id_Client)
REFERENCES Commande (id_Commande, id_Client)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Stock_Livreur ADD CONSTRAINT livreur_stock_livreur_fk
FOREIGN KEY (id_Livreur)
REFERENCES Livreur (id_Livreur)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Livraison_Confirmee ADD CONSTRAINT livreur_livraison_confirmee_fk
FOREIGN KEY (id_Livreur)
REFERENCES Livreur (id_Livreur)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
