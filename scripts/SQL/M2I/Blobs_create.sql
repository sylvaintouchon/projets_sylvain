--
-- Table structure for table `blobs`
--

DROP TABLE IF EXISTS `blobs`;

CREATE TABLE `blobs` (
  `id_blob` int(11) NOT NULL AUTO_INCREMENT,
  `nom_blob` varchar(100) NOT NULL,
  `blob_type` varchar(100) NOT NULL,
  `blob_data` longblob NOT NULL,
  PRIMARY KEY (`id_blob`),
  UNIQUE KEY `nom_blob` (`nom_blob`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

