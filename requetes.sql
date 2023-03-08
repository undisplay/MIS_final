DROP TABLE IF EXISTS Clients ;
CREATE TABLE Clients (ID_client_Clients BIGINT AUTO_INCREMENT NOT NULL,
Nom_client_Clients VARCHAR(255),
Telephone_client_Clients VARCHAR(13),
Adresse_client_Clients TEXT,
utilisateurs_id_utilisateur_utilisateurs **NOT FOUND**,
PRIMARY KEY (ID_client_Clients)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Compagnies_assurances ;
CREATE TABLE Compagnies_assurances (ID_compagnie_Compagnies_assurances BIGINT AUTO_INCREMENT NOT NULL,
Nom_compagnie_Compagnies_assurances VARCHAR,
Adresse_compagnie_Compagnies_assurances TEXT,
Telephone_compagnie_Compagnies_assurances BIGINT,
PRIMARY KEY (ID_compagnie_Compagnies_assurances)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Contrats ;
CREATE TABLE Contrats (ID_contrat_Contrats BIGINT AUTO_INCREMENT NOT NULL,
Type_contrat_Contrats VARCHAR,
Date_souscription_Contrats DATE,
ID_compagnie_Compagnies_assurances **NOT FOUND**,
ID_client_Clients **NOT FOUND**,
PRIMARY KEY (ID_contrat_Contrats)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Sinistres ;
CREATE TABLE Sinistres (ID_sinistre_Sinistres BIGINT AUTO_INCREMENT NOT NULL,
Date_sinistre_Sinistres DATETIME,
Montant_facture_Sinistres DOUBLE,
Montant_indemnite_Sinistres DOUBLE,
Type_prejudice_Sinistres VARCHAR,
ID_contrat_Contrats **NOT FOUND**,
PRIMARY KEY (ID_sinistre_Sinistres)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Utilisateurs ;
CREATE TABLE Utilisateurs (ID_utilisateur_Utilisateurs BIGINT AUTO_INCREMENT NOT NULL,
Username_Utilisateurs VARCHAR,
Password_Utilisateurs VARCHAR,
clients_id_client_clients **NOT FOUND**,
PRIMARY KEY (ID_utilisateur_Utilisateurs)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Groupes ;
CREATE TABLE Groupes (Nom_groupe_Groupes VARCHAR AUTO_INCREMENT NOT NULL,
PRIMARY KEY (Nom_groupe_Groupes)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Permissions ;
CREATE TABLE Permissions (label_Permissions VARCHAR AUTO_INCREMENT NOT NULL,
PRIMARY KEY (label_Permissions)) ENGINE=InnoDB;

DROP TABLE IF EXISTS appartenir ;
CREATE TABLE appartenir (Nom_groupe_Groupes **NOT FOUND** AUTO_INCREMENT NOT NULL,
ID_utilisateur_Utilisateurs **NOT FOUND** NOT NULL,
PRIMARY KEY (Nom_groupe_Groupes,
 ID_utilisateur_Utilisateurs)) ENGINE=InnoDB;

DROP TABLE IF EXISTS contenir ;
CREATE TABLE contenir (Nom_groupe_Groupes **NOT FOUND** AUTO_INCREMENT NOT NULL,
label_Permissions **NOT FOUND** NOT NULL,
PRIMARY KEY (Nom_groupe_Groupes,
 label_Permissions)) ENGINE=InnoDB;

DROP TABLE IF EXISTS posseder ;
CREATE TABLE posseder (ID_utilisateur_Utilisateurs **NOT FOUND** AUTO_INCREMENT NOT NULL,
label_Permissions **NOT FOUND** NOT NULL,
PRIMARY KEY (ID_utilisateur_Utilisateurs,
 label_Permissions)) ENGINE=InnoDB;

ALTER TABLE Clients ADD CONSTRAINT FK_Clients_utilisateurs_id_utilisateur_utilisateurs FOREIGN KEY (utilisateurs_id_utilisateur_utilisateurs) REFERENCES Utilisateurs (ID_utilisateur_Utilisateurs);

ALTER TABLE Contrats ADD CONSTRAINT FK_Contrats_ID_compagnie_Compagnies_assurances FOREIGN KEY (ID_compagnie_Compagnies_assurances) REFERENCES Compagnies_assurances (ID_compagnie_Compagnies_assurances);
ALTER TABLE Contrats ADD CONSTRAINT FK_Contrats_ID_client_Clients FOREIGN KEY (ID_client_Clients) REFERENCES Clients (ID_client_Clients);
ALTER TABLE Sinistres ADD CONSTRAINT FK_Sinistres_ID_contrat_Contrats FOREIGN KEY (ID_contrat_Contrats) REFERENCES Contrats (ID_contrat_Contrats);
ALTER TABLE Utilisateurs ADD CONSTRAINT FK_Utilisateurs_clients_id_client_clients FOREIGN KEY (clients_id_client_clients) REFERENCES Clients (ID_client_Clients);
ALTER TABLE appartenir ADD CONSTRAINT FK_appartenir_Nom_groupe_Groupes FOREIGN KEY (Nom_groupe_Groupes) REFERENCES Groupes (Nom_groupe_Groupes);
ALTER TABLE appartenir ADD CONSTRAINT FK_appartenir_ID_utilisateur_Utilisateurs FOREIGN KEY (ID_utilisateur_Utilisateurs) REFERENCES Utilisateurs (ID_utilisateur_Utilisateurs);
ALTER TABLE contenir ADD CONSTRAINT FK_contenir_Nom_groupe_Groupes FOREIGN KEY (Nom_groupe_Groupes) REFERENCES Groupes (Nom_groupe_Groupes);
ALTER TABLE contenir ADD CONSTRAINT FK_contenir_label_Permissions FOREIGN KEY (label_Permissions) REFERENCES Permissions (label_Permissions);
ALTER TABLE posseder ADD CONSTRAINT FK_posseder_ID_utilisateur_Utilisateurs FOREIGN KEY (ID_utilisateur_Utilisateurs) REFERENCES Utilisateurs (ID_utilisateur_Utilisateurs);
ALTER TABLE posseder ADD CONSTRAINT FK_posseder_label_Permissions FOREIGN KEY (label_Permissions) REFERENCES Permissions (label_Permissions);
