--
-- Table structure for table `communes`
--

DROP TABLE IF EXISTS `communes`;

CREATE TABLE `communes` (
  `commune` varchar(50) NOT NULL,
  `code_postal` varchar(5) NOT NULL,
  `departement` varchar(50) NOT NULL,
  `insee` varchar(5) NOT NULL,
  PRIMARY KEY (`insee`),
  KEY `commune` (`commune`,`code_postal`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

