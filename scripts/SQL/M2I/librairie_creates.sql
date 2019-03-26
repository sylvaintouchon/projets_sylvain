DROP DATABASE IF EXISTS librairie;
CREATE DATABASE librairie DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE librairie;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS auteurs;
CREATE TABLE IF NOT EXISTS auteurs (
  id_auteur int(3) NOT NULL AUTO_INCREMENT,
  nom_auteur varchar(50) NOT NULL,
  photo varchar(50) DEFAULT NULL,
  site varchar(100) DEFAULT NULL,
  PRIMARY KEY (id_auteur)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS cdes;
CREATE TABLE IF NOT EXISTS cdes (
  id_cde int(3) NOT NULL AUTO_INCREMENT,
  date_cde datetime NOT NULL,
  id_client int(5) NOT NULL,
  etat varchar(50) NOT NULL,
  total float NOT NULL,
  PRIMARY KEY (id_cde),
  KEY fk_cdes_id_client (id_client)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS clients;
CREATE TABLE IF NOT EXISTS clients (
  id_client int(5) NOT NULL AUTO_INCREMENT,
  nom varchar(50) NOT NULL,
  prenom varchar(50) DEFAULT NULL,
  adresse varchar(100) DEFAULT NULL,
  cp varchar(5) NOT NULL,
  telephone char(14) DEFAULT NULL,
  e_mail varchar(50) NOT NULL,
  mdp varchar(50) NOT NULL,
  date_naissance date DEFAULT NULL,
  lectures set('Romans','Essais','BD','Biographie') DEFAULT NULL,
  connu_par enum('Internet','Presse','Ami','Autre') NOT NULL,
  news_letter int(1) unsigned NOT NULL,
  qualite varchar(10) NOT NULL DEFAULT 'FO',
  PRIMARY KEY (id_client),
  UNIQUE KEY e_mail (e_mail),
  UNIQUE KEY date_naissance (date_naissance),
  KEY fk_clients_cp (cp)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS editeurs;
CREATE TABLE IF NOT EXISTS editeurs (
  id_editeur int(3) NOT NULL AUTO_INCREMENT,
  nom_editeur varchar(50) NOT NULL,
  site varchar(50) NOT NULL,
  PRIMARY KEY (id_editeur),
  UNIQUE KEY nom_editeur (nom_editeur)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ligcdes;
CREATE TABLE IF NOT EXISTS ligcdes (
  id_cde int(3) NOT NULL,
  id_livre int(3) NOT NULL,
  prix_commande float,
  qte int(3) NOT NULL,
  montant float DEFAULT NULL,
  PRIMARY KEY (id_cde,id_livre),
  KEY fk_ligcdes_id_livre (id_livre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS livres;
CREATE TABLE IF NOT EXISTS livres (
  id_livre int(3) NOT NULL AUTO_INCREMENT,
  titre varchar(50) NOT NULL,
  annee varchar(4) NOT NULL,
  condense varchar(255) NOT NULL,
  nb_pages int(5) NOT NULL,
  id_auteur int(3) NOT NULL,
  id_editeur int(3) NOT NULL,
  prix float NOT NULL,
  couverture varchar(50) DEFAULT NULL,
  PRIMARY KEY (id_livre),
  KEY fk_livres_id_auteur (id_auteur),
  KEY fk_livres_id_editeur (id_editeur)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS villes;
CREATE TABLE IF NOT EXISTS villes (
  cp varchar(5) NOT NULL,
  nom_ville varchar(50) NOT NULL,
  PRIMARY KEY (cp)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE cdes
  ADD CONSTRAINT fk_cdes_id_client FOREIGN KEY (id_client) REFERENCES clients (id_client) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE clients
  ADD CONSTRAINT fk_clients_cp FOREIGN KEY (cp) REFERENCES villes (cp) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ligcdes
  ADD CONSTRAINT fk_ligcdes_id_cde FOREIGN KEY (id_cde) REFERENCES cdes (id_cde) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ligcdes  
  ADD CONSTRAINT fk_ligcdes_id_livre FOREIGN KEY (id_livre) REFERENCES livres (id_livre) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE livres
  ADD CONSTRAINT fk_livres_id_auteur FOREIGN KEY (id_auteur) REFERENCES auteurs (id_auteur) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE livres  
  ADD CONSTRAINT fk_livres_id_editeur FOREIGN KEY (id_editeur) REFERENCES editeurs (id_editeur) ON DELETE CASCADE ON UPDATE CASCADE;



SET FOREIGN_KEY_CHECKS = 1;
