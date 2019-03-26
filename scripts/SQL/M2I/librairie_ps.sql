USE librairie;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`auteursDelete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`auteursDelete`(aiIdAuteur INT)
BEGIN
  DELETE FROM auteurs WHERE id_auteur = aiIdAuteur;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`auteursInsert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`auteursInsert`(IN `asNom` VARCHAR(50) CHARSET utf8, IN `asPhoto` VARCHAR(50) CHARSET utf8, IN `asSite` VARCHAR(50) CHARSET utf8)
BEGIN
  INSERT INTO auteurs(nom_auteur, photo, site)
  VALUES (asNom, asPhoto, asSite);
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`auteursSelect`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`auteursSelect`()
BEGIN
  SELECT id_auteur AS 'ID auteur', nom_auteur AS 'Nom de l\'auteur', photo AS 'Photo', site AS 'Site'
  FROM auteurs
 ORDER BY nom_auteur;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`auteursSelectOne`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`auteursSelectOne`(aiIdAuteur INT)
BEGIN
  SELECT * FROM auteurs WHERE id_auteur = aiIdAuteur;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`auteursUpdate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`auteursUpdate`(asNomAuteur VARCHAR(50), asPhotoAuteur VARCHAR(50), asSiteAuteur VARCHAR(50), aiIdAuteur INT)
BEGIN
  UPDATE auteurs
  SET nom_auteur = asNomAuteur, photo = asPhotoAuteur, site = asSiteAuteur
  WHERE id_auteur = aiIdAuteur;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`cdesEtLigcdesSelectAnneeEnCours`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`cdesEtLigcdesSelectAnneeEnCours`()
BEGIN
  SELECT *
  FROM cdes NATURAL JOIN ligcdes
  WHERE YEAR(date_cde) = YEAR(CURDATE());
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`cdesInsert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`cdesInsert`(asDateCommande DATETIME, aiIdClient INT,  afTotalCommande FLOAT)
BEGIN
  INSERT INTO cdes(date_cde, id_client, etat, total) VALUES(asDateCommande, aiIdClient, 'Enregistrée', afTotalCommande);
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`cdesListeID`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`cdesListeID`()
BEGIN
  SELECT id_cde FROM cdes ORDER BY id_cde;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`cdesSelect`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`cdesSelect`()
BEGIN
  SELECT * FROM cdes;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`cdesSelectAnneeEnCours`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`cdesSelectAnneeEnCours`()
BEGIN
  SELECT * FROM cdes WHERE YEAR(date_cde) = YEAR(NOW());
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`cdesSelectOne`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`cdesSelectOne`(aiIdCde INT)
BEGIN
  SELECT cd.id_cde AS "ID cde", DATE_FORMAT(cd.date_cde, '%d/%c/%Y') AS "Date de commande", cl.nom AS Nom
  FROM cdes cd INNER JOIN clients cl
  ON cd.id_client = cl.id_client
  WHERE cd.id_cde = aiIdCde;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`clientsCountByEmail`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`clientsCountByEmail`(asEmail VARCHAR(50) CHARSET utf8, asMDP VARCHAR(50) CHARSET utf8)
BEGIN
  SELECT COUNT(*) FROM clients WHERE e_mail = asEmail AND mdp = asMDP;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`clientsCountByID`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`clientsCountByID`(aiIdClient INT)
BEGIN
  SELECT COUNT(*) FROM clients WHERE id_client = aiIdClient;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`clientsDelete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`clientsDelete`(aiIdClient INT)
BEGIN
  DELETE FROM clients
  WHERE id_client = aiIdClient;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`clientsDeleteByEmail`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`clientsDeleteByEmail`(asEMailClient VARCHAR(50))
BEGIN
  DELETE FROM clients
  WHERE e_mail = asEMailClient;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`clientsIdsNoms`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`clientsIdsNoms`()
BEGIN
  SELECT id_client, nom FROM clients;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`clientsInsert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`clientsInsert`(asNom VARCHAR(50),asPrenom VARCHAR(50),asAdresse VARCHAR(100),asCP VARCHAR(5),asTelephone VARCHAR(50),asEMail VARCHAR(50),asMDP VARCHAR(50),asDateNaissance VARCHAR(50),asLectures VARCHAR(50),asConnuPar VARCHAR(50),aiNewsLetter INT(1),asQualite VARCHAR(50))
BEGIN
INSERT INTO clients(nom, prenom, adresse, cp, telephone, e_mail, mdp, date_naissance, lectures, connu_par, news_letter, qualite)
VALUES(asNom, asPrenom, asAdresse, asCP, asTelephone, asEMail, asMDP, asDateNaissance, asLectures, asConnuPar, aiNewsLetter, asQualite);
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`clientsSelectOneByEmailMdp`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`clientsSelectOneByEmailMdp`(asEmail VARCHAR(50), asMdp VARCHAR(50))
BEGIN
  SELECT *
  FROM clients
  WHERE e_mail=asEmail AND mdp=asMdp;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`editeursDelete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`editeursDelete`(IN `asNomEditeur` VARCHAR(50) CHARSET utf8)
    NO SQL
DELETE FROM editeurs WHERE nom_editeur = asNomEditeur $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`editeursInsert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`editeursInsert`(asNomEditeur VARCHAR(50), asSiteEditeur VARCHAR(50))
BEGIN
  INSERT INTO editeurs(nom_editeur, site)
  VALUES (asNomEditeur, asSiteEditeur);
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`editeursSelect`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`editeursSelect`()
BEGIN
  SELECT *
  FROM editeurs
  ORDER BY nom_editeur ASC;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`editeursSelectOne`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`editeursSelectOne`(aiIdEditeur INT)
BEGIN
  SELECT * FROM editeurs WHERE id_editeur = aiIdEditeur;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`editeursUpdate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`editeursUpdate`(IN `asNom` VARCHAR(50), IN `asSite` VARCHAR(50), IN `aiIdEditeur` INT)
    NO SQL
UPDATE editeurs SET nom_editeur = asNom, site=asSite WHERE id_editeur=aiIdEditeur $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`lastID`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`lastID`()
BEGIN
    SELECT LAST_INSERT_ID();
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`ligcdesInsert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`ligcdesInsert`(aiIdCde int, aiIdLivre int,  afPrixCommande float, aiQte int, aiMontant float)
BEGIN
    INSERT INTO ligcdes(id_cde, id_livre , prix_commande, qte, montant)
    VALUES(aiIdCde, aiIdLivre , afPrixCommande, aiQte, aiMontant);
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`ligcdesSelectAnneeEnCours`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`ligcdesSelectAnneeEnCours`()
BEGIN
  SELECT * FROM ligcdes WHERE id_cde IN (
    SELECT id_cde FROM cdes WHERE YEAR(date_cde) = YEAR(NOW())
  );
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`ligcdesSelectMany`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`ligcdesSelectMany`(aiIdCde INT)
BEGIN
  SELECT li.id_livre AS "ID livre", li.titre AS Titre, lg.prix_commande AS Prix, lg.qte AS "Quantité", lg.qte * lg.prix_commande AS "Montant"
  FROM livres li INNER JOIN ligcdes lg
  ON li.id_livre = lg.id_livre
  WHERE lg.id_cde = aiIdCde;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`livresIdsTitres`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`livresIdsTitres`()
BEGIN
  SELECT id_livre, titre FROM livres ORDER BY titre;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`livresRecherche`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`livresRecherche`(asCritere VARCHAR(50), asRecherche VARCHAR(50))
BEGIN
IF asCritere = 'tous' THEN
  SELECT l.id_livre AS "ID livre", l.titre AS Titre, a.nom_auteur AS "Nom de l'auteur", e.nom_editeur AS "Nom de l'éditeur", l.prix AS Prix
  FROM livres l INNER JOIN auteurs a INNER JOIN editeurs e
  ON l.id_auteur = a.id_auteur AND l.id_editeur = e.id_editeur
  WHERE l.titre LIKE CONCAT('%', asRecherche, '%') OR a.nom_auteur LIKE CONCAT('%', asRecherche, '%') OR e.nom_editeur LIKE CONCAT('%', asRecherche, '%');
END IF;
IF asCritere = 'titre' THEN
  SELECT l.id_livre AS "ID livre", l.titre AS Titre, a.nom_auteur AS "Nom de l'auteur", e.nom_editeur AS "Nom de l'éditeur", l.prix AS Prix
  FROM livres l INNER JOIN auteurs a INNER JOIN editeurs e
  ON l.id_auteur = a.id_auteur AND l.id_editeur = e.id_editeur
   WHERE l.titre LIKE CONCAT('%', asRecherche, '%');
END IF;
IF asCritere = 'auteur' THEN
  SELECT l.id_livre AS "ID livre", l.titre AS Titre, a.nom_auteur AS "Nom de l'auteur", e.nom_editeur AS "Nom de l'éditeur", l.prix AS Prix
  FROM livres l INNER JOIN auteurs a INNER JOIN editeurs e
  ON l.id_auteur = a.id_auteur AND l.id_editeur = e.id_editeur
   WHERE a.nom_auteur LIKE CONCAT('%', asRecherche, '%');
END IF;
IF asCritere = 'editeur' THEN
  SELECT l.id_livre AS "ID livre", l.titre AS Titre, a.nom_auteur AS "Nom de l'auteur", e.nom_editeur AS "Nom de l'éditeur", l.prix AS Prix
  FROM livres l INNER JOIN auteurs a INNER JOIN editeurs e
  ON l.id_auteur = a.id_auteur AND l.id_editeur = e.id_editeur
   WHERE e.nom_editeur LIKE CONCAT('%', asRecherche, '%');
END IF;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`livresSelectComplet`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`livresSelectComplet`()
BEGIN
SELECT l.id_livre AS "ID livre", a.nom_auteur AS "Nom de l'auteur", e.nom_editeur "Nom de l'éditeur", l.titre AS "Titre", l.prix AS "Prix", l.couverture AS "Couverture"
 FROM auteurs a JOIN editeurs e JOIN livres l
 ON a.id_auteur = l.id_auteur
 AND e.id_editeur = l.id_editeur
 ORDER BY a.nom_auteur ;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`livresUnParID`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`livresUnParID`(aiIdLivre INT)
BEGIN
SELECT l.id_livre AS "ID livre", a.nom_auteur AS "Nom de l'auteur", e.nom_editeur "Nom de l'éditeur", l.condense AS "Résumé", l.titre AS "Titre", l.prix AS "Prix", l.annee AS "Année de parution", l.nb_pages AS "Pages", l.couverture AS "Couverture"
 FROM auteurs a JOIN  editeurs e JOIN livres l
 ON a.id_auteur = l.id_auteur
 AND e.id_editeur = l.id_editeur
 WHERE id_livre = aiIdLivre;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`villesDelete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`villesDelete`(asCP VARCHAR(5) CHARSET utf8)
BEGIN
  DELETE FROM villes WHERE cp = asCP;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`villesInsert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`villesInsert`(asCP VARCHAR(5), asNomVille VARCHAR(50))
BEGIN
  INSERT INTO villes(cp, nom_ville) VALUES(asCP, asNomVille);
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`villesSelect`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`villesSelect`()
BEGIN
  SELECT * FROM villes ORDER BY nom_ville;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`villesSelectOne`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`villesSelectOne`(asCp VARCHAR(5) CHARSET utf8)
BEGIN
  SELECT * FROM villes WHERE cp = asCP;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `librairie`.`villesUpdate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE  `librairie`.`villesUpdate`(asCP VARCHAR(5) CHARSET utf8, asNomVille VARCHAR(50))
BEGIN
  UPDATE villes SET nom_ville = asNomVille WHERE cp = asCP;
END $$

DELIMITER ;