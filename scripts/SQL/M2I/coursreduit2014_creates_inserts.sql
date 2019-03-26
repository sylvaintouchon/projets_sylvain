SET FOREIGN_KEY_CHECKS=0;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

CREATE DATABASE IF NOT EXISTS coursreduit2014 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE coursreduit2014;

DROP TABLE IF EXISTS clients;
CREATE TABLE IF NOT EXISTS clients (
  id_client int(10) unsigned NOT NULL AUTO_INCREMENT,
  nom_client varchar(50) NOT NULL,
  prenom_client varchar(50) NOT NULL,
  adresse_client varchar(100) DEFAULT NULL,
  date_naissance_client date DEFAULT NULL,
  id_ville int(10) unsigned NOT NULL,
  PRIMARY KEY (id_client),
  KEY idx_ville (id_ville),
  KEY idx_clients_nom_prenom (nom_client,prenom_client)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO clients (id_client, nom_client, prenom_client, adresse_client, date_naissance_client, id_ville) VALUES
(1, 'Buguet', 'Pascal', NULL, '1955-10-03', 1),
(4, 'Buguet', 'MJ', NULL, '1948-08-22', 1),
(5, 'Fassiola', 'Annabelle', NULL, '1985-05-10', 2),
(6, 'Roux', 'Françoise', NULL, '1950-10-10', 3),
(7, 'Tintin', 'Albert', NULL, NULL, 2),
(8, 'Sordi', 'Alberto', NULL, NULL, 10),
(9, 'Muti', 'Ornella', NULL, NULL, 11),
(10, 'Milou', 'Le chien', NULL, NULL, 2);

DROP TABLE IF EXISTS commandes;
CREATE TABLE IF NOT EXISTS commandes (
  id_commande int(10) unsigned NOT NULL AUTO_INCREMENT,
  date_commande datetime NOT NULL,
  id_client int(10) unsigned NOT NULL,
  PRIMARY KEY (id_commande),
  KEY FK_commandes_clients (id_client)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO commandes (id_commande, date_commande, id_client) VALUES
(1, '2005-10-03 00:00:00', 1),
(3, '2005-11-01 00:00:00', 2),
(4, '2000-11-01 00:00:00', 1),
(6, '2008-12-13 00:00:00', 1),
(8, '2008-12-13 00:00:00', 5),
(9, '2008-12-13 00:00:00', 4);


DROP TABLE IF EXISTS lignesdecommandes;
CREATE TABLE IF NOT EXISTS lignesdecommandes (
  id_commande int(10) unsigned NOT NULL,
  id_produit int(10) unsigned NOT NULL,
  quantite_commandee int(5) NOT NULL,
  PRIMARY KEY (id_commande,id_produit),
  KEY FK_lignesdecommandes_id_produit (id_produit),
  KEY FK_lignesdecommandes_id_commande (id_commande)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO lignesdecommandes (id_commande, id_produit, quantite_commandee) VALUES
(1, 1, 2),
(1, 5, 3),
(3, 1, 6),
(3, 2, 2),
(3, 3, 1),
(4, 1, 5),
(6, 1, 1),
(6, 2, 1),
(6, 3, 1),
(6, 4, 1),
(8, 1, 10),
(9, 1, 10);

INSERT INTO commandes (date_commande, id_client) VALUES (NOW(), 1);
INSERT INTO lignesdecommandes (id_commande, id_produit, quantite_commandee) VALUES(LAST_INSERT_ID(), 1, 10);

INSERT INTO commandes (date_commande, id_client) VALUES(NOW(), 2);
INSERT INTO lignesdecommandes (id_commande, id_produit, quantite_commandee) VALUES(LAST_INSERT_ID(), 1, 1);
INSERT INTO lignesdecommandes (id_commande, id_produit, quantite_commandee) VALUES(LAST_INSERT_ID(), 2, 1);

INSERT INTO commandes (date_commande, id_client) VALUES(NOW(), 3);
INSERT INTO lignesdecommandes (id_commande, id_produit, quantite_commandee) VALUES(LAST_INSERT_ID(), 1, 10);
INSERT INTO lignesdecommandes (id_commande, id_produit, quantite_commandee) VALUES(LAST_INSERT_ID(), 2, 1);
INSERT INTO lignesdecommandes (id_commande, id_produit, quantite_commandee) VALUES(LAST_INSERT_ID(), 3, 1);

DROP TABLE IF EXISTS pays;
CREATE TABLE IF NOT EXISTS pays (
  id_pays int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Code pays',
  nom_pays varchar(50) NOT NULL COMMENT 'Nom du pays',
  PRIMARY KEY (id_pays),
  UNIQUE KEY idx_nom_pays_unique (nom_pays),
  KEY idx_nom_pays (nom_pays)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO pays (id_pays, nom_pays) VALUES
(1, 'France'),
(2, 'Italie'),
(3, 'Canada'),
(4, 'Hongrie'),
(5, 'Egypte'),
(6, 'Royaume Uni'),
(7, 'US');

DROP TABLE IF EXISTS produits;
CREATE TABLE IF NOT EXISTS produits (
  id_produit int(10) unsigned NOT NULL AUTO_INCREMENT,
  designation_produit varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  prix_produit float(7,2) NOT NULL,
  photo_produit varchar(50) DEFAULT NULL,
  id_categorie int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (id_produit),
  UNIQUE KEY idx_designation (designation_produit)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO produits (id_produit, designation_produit, prix_produit, photo_produit, id_categorie) VALUES
(1, 'Evian', 2.18, 'evian.jpg', 1),
(2, 'Badoit', 1.91, 'badoit.jpg', 1),
(3, 'Graves', 13.17, 'graves.jpg', 3),
(4, 'Ruinard', 108.90, 'ruinard.jpg', 3),
(5, 'Dom Perignon', 163.35, 'dom.jpg', 3),
(7, 'Picpoul', 4.95, 'picpoul.jpg', 3),
(9, 'Coca', 1.73, 'coca.jpg', 2),
(10, 'Coca Light', 1.68, 'coca_light.jpg', 2),
(11, 'Coca Zero', 1.98, 'coca_zero.jpg', 2);

DROP TABLE IF EXISTS villes;
CREATE TABLE IF NOT EXISTS villes (
  id_ville int(10) unsigned NOT NULL AUTO_INCREMENT,
  cp varchar(5) NOT NULL,
  nom_ville varchar(50) NOT NULL,
  site_ville varchar(50) DEFAULT NULL,
  photo_ville varchar(50) DEFAULT NULL,
  id_pays int(10) unsigned NOT NULL,
  PRIMARY KEY (id_ville),
  KEY idx_villes_nom_ville (nom_ville),
  KEY idx_villes_id_pays (id_pays)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO villes (id_ville, cp, nom_ville, site_ville, photo_ville, id_pays) VALUES
(1, '75011', 'Paris 11', 'www.paris.fr', 'paris.jpg', 1),
(2, '75012', 'Paris 12', 'www.paris.fr', 'paris.jpg', 1),
(3, '69000', 'Lyon', 'www.lyon.fr', 'lyon.jpg', 1),
(4, '59000', 'Lille', 'www.lille.fr', 'lille.jpg', 1),
(5, '78000', 'Versailles', NULL, NULL, 1),
(6, '92100', 'Neuilly', NULL, NULL, 1),
(7, '92300', 'Nanterre', NULL, NULL, 1),
(8, '94100', 'Vincennes', NULL, NULL, 1),
(9, '94200', 'Saint-Mande', NULL, NULL, 1),
(10, '99391', 'ROME', NULL, NULL, 2),
(11, '99392', 'MILAN', NULL, NULL, 2);


DROP TABLE IF EXISTS coursreduit2014.categories;

CREATE TABLE coursreduit2014.categories (
  id_categorie int(10) unsigned  NOT NULL AUTO_INCREMENT,
  libelle_categorie VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_categorie),
  UNIQUE INDEX idx_libelle_categorie_unique(libelle_categorie)
)
ENGINE = InnoDB;


INSERT INTO coursreduit2014.categories (id_categorie, libelle_categorie) 
VALUES(1, 'Eaux');
INSERT INTO coursreduit2014.categories (id_categorie, libelle_categorie) 
VALUES(2, 'Sodas');
INSERT INTO coursreduit2014.categories (id_categorie, libelle_categorie) 
VALUES(3, 'Vins');
INSERT INTO coursreduit2014.categories (id_categorie, libelle_categorie) 
VALUES(4, 'Champagnes');
INSERT INTO coursreduit2014.categories (id_categorie, libelle_categorie) 
VALUES(5, 'Biscuits');


DROP TABLE IF EXISTS coursreduit2014.utilisateurs;

CREATE TABLE  coursreduit2014.utilisateurs (
  id_utilisateur int(10) unsigned NOT NULL AUTO_INCREMENT,
  pseudo varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  mdp varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (id_utilisateur),
  UNIQUE KEY idx_pseudo_unique (pseudo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO utilisateurs (id_utilisateur, pseudo, mdp) VALUES(1, 'p', 'b');
INSERT INTO utilisateurs (id_utilisateur, pseudo, mdp) VALUES(2, 'a', 'f');



ALTER TABLE clients
  ADD CONSTRAINT FK_clients_villes FOREIGN KEY (id_ville) REFERENCES villes (id_ville);

ALTER TABLE commandes
  ADD CONSTRAINT FK_commandes_clients FOREIGN KEY (id_client) REFERENCES clients (id_client);

ALTER TABLE lignesdecommandes
  ADD CONSTRAINT FK_lignesdecommandes_commandes FOREIGN KEY (id_commande) REFERENCES commandes (id_commande);
ALTER TABLE lignesdecommandes
  ADD CONSTRAINT FK_lignesdecommandes_produits FOREIGN KEY (id_produit) REFERENCES produits (id_produit);

ALTER TABLE villes
  ADD CONSTRAINT FK_villes_pays FOREIGN KEY (id_pays) REFERENCES pays (id_pays);
  
ALTER TABLE coursreduit2014.villes 
   ADD UNIQUE INDEX idx_villes_cp_nom_unique(cp, nom_ville);  
   
ALTER TABLE produits
  ADD CONSTRAINT FK_produits_categories FOREIGN KEY (id_categorie) REFERENCES categories (id_categorie);

SET FOREIGN_KEY_CHECKS=1;
