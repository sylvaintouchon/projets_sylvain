﻿-- BD cours
USE cours;

SET FOREIGN_KEY_CHECKS = 0;

-- Contenu de la table cdes

-- Buguet : 1 , Tintin : 5, Sordi : 6, Muti : 7

INSERT INTO cdes (id_cde, date_cde, id_client) VALUES
(100, CURDATE() - INTERVAL 1 year, 1),
(101, CURDATE() - INTERVAL 1 year, 5),
(102, CURDATE() - INTERVAL 1 year, 6),
(103, CURDATE() - INTERVAL 1 year, 7),
(104, CURDATE() - INTERVAL 1 year, 1),
(105, CURDATE(), 1),
(106, CURDATE(), 1),
(107, CURDATE(), 5),
(108, CURDATE(), 5),
(109, CURDATE(), 6),
(110, CURDATE(), 7);


-- Badoit : 2, Grave : 3, Ruinart : 4

-- Contenu de la table ligcdes

INSERT INTO ligcdes (id_cde, id_produit, qte) VALUES
(100, 2, 10),
(100, 3, 3),
(100, 4, 1),
(101, 2, 10),
(101, 3, 3),
(102, 4, 1),
(102, 2, 10),
(102, 3, 3),
(103, 2, 10),
(104, 2, 10),
(105, 3, 3),
(106, 2, 10),
(107, 2, 10),
(108, 3, 3),
(109, 4, 1),
(110, 2, 10),
(110, 3, 3),
(110, 4, 1);

SET FOREIGN_KEY_CHECKS = 1;
