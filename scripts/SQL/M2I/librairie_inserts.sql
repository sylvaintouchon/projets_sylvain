USE librairie;

SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO auteurs (id_auteur, nom_auteur, photo, site) VALUES(1, 'Proust', 'proust.jpg', 'pagesperso-orange.fr/marcelproust/sommaire_marcel_proust.htm');
INSERT INTO auteurs (id_auteur, nom_auteur, photo, site) VALUES(2, 'Kundera', 'kundera.jpg', 'lethee.free.fr/kundera.html');
INSERT INTO auteurs (id_auteur, nom_auteur, photo, site) VALUES(3, 'Kennedy', 'douglas_kennedy.jpg', 'www.douglas-kennedy.com');
INSERT INTO auteurs (id_auteur, nom_auteur, photo, site) VALUES(4, 'Zola', 'zola.jpg', 'emilezola.free.fr/');
INSERT INTO auteurs (id_auteur, nom_auteur, photo, site) VALUES(5, 'Flaubert', 'flaubert.jpg', 'flaubert.univ-rouen.fr/');
INSERT INTO auteurs (id_auteur, nom_auteur, photo, site) VALUES(6, 'Beigbeder', 'beigbeder.jpg', 'www.beigbeder.net');

INSERT INTO cdes (id_cde, date_cde, id_client, etat, total) VALUES
(1, '2006-12-06 01:13:05', 1, 'Enregistree', 8),
(2, '2006-11-16 18:13:07', 2, 'Enregistree', 10),
(3, '2006-11-16 18:11:58', 1, 'Enregistree', 4),
(4, '2013-04-24 07:52:58', 1, 'Enregistree', 18),
(5, '2013-04-24 07:54:07', 1, 'Enregistree', 13),
(6, '2013-04-24 07:55:22', 1, 'Enregistree', 11.5),
(11, '2013-04-26 08:36:17', 11, 'Enregistree', 13);

INSERT INTO clients (id_client, nom, prenom, adresse, cp, telephone, e_mail, mdp, date_naissance, lectures, connu_par, news_letter, qualite) VALUES
(1, 'Tintin', 'Le reporter', 'rue Chevreul', '75011', '01-01-01-01-01', 'tintin@free.fr', 'tintin', '1930-12-28', 'Romans,BD', 'Presse', 1, 'FO'),
(2, 'Fassiola', 'Annabelle', 'rue de Montreuil', '75011', '02-02-02-02-02', 'fassiola@free.fr', 'annabelle', '1984-05-10', 'BD', 'Internet', 0, 'FO'),
(3, 'Roux', 'MJ', 'rue de Montreuil', '75011', '03-03-03-03-03', 'roux@free.fr', 'mj', '1948-08-28', 'Romans,Biographie', 'Internet', 0, 'FO'),
(4, 'Buguet', 'Pascal', 'rue Roubo', '75011', '04-04-04-04-04', 'p.b@free.fr', 'pascal', '1955-10-03', 'Romans', 'Internet', 1, 'BO'),
(5, 'Buguet', 'Sophie', 'rue du fg st Antoine', '75011', '05-05-05-05-05', 'sophie.buguet@bidulle.fr', 'sophie', '1954-09-30', 'Essais', 'Internet', 0, 'FO'),
(8, 'Tintin', 'Albert', 'rue de Montreuil', '13000', '01-02-03-04-05', 'tintin@hotmail.fr', 'tintin', '1930-12-01', 'Romans,Essais', 'Internet', 1, 'FO'),
(11, 'Milou', 'Le chien', 'rue Roubo', '75011', '01-01-01-01-01', 'milou@free.fr', 'milou', '1970-01-31', 'Romans,BD', 'Presse', 1, 'FO');

INSERT INTO editeurs (id_editeur, nom_editeur, site) VALUES(1, 'Gallimard', 'www.gallimard.fr');
INSERT INTO editeurs (id_editeur, nom_editeur, site) VALUES(2, 'Laffont', 'www.laffont.fr');
INSERT INTO editeurs (id_editeur, nom_editeur, site) VALUES(3, 'Grasset', 'www.edition-grasset.fr');
INSERT INTO editeurs (id_editeur, nom_editeur, site) VALUES(5, 'Maspero', 'www.maspero.fr');
INSERT INTO editeurs (id_editeur, nom_editeur, site) VALUES(16, 'LGF', 'livresdepoche.com');

INSERT INTO ligcdes (id_cde, id_livre, prix_commande, qte, montant) VALUES(1, 1, 5.5, 1, 2);
INSERT INTO ligcdes (id_cde, id_livre, prix_commande, qte, montant) VALUES(1, 2, 3.5, 1, 6);
INSERT INTO ligcdes (id_cde, id_livre, prix_commande, qte, montant) VALUES(2, 1, 5.5, 1, 2);
INSERT INTO ligcdes (id_cde, id_livre, prix_commande, qte, montant) VALUES(2, 2, 3.5, 1, 6);
INSERT INTO ligcdes (id_cde, id_livre, prix_commande, qte, montant) VALUES(2, 3, 3.5, 1, 2);
INSERT INTO ligcdes (id_cde, id_livre, prix_commande, qte, montant) VALUES(3, 1, 5.5, 1, 2);
INSERT INTO ligcdes (id_cde, id_livre, prix_commande, qte, montant) VALUES(3, 2, 3.5, 1, 2);
INSERT INTO ligcdes (id_cde, id_livre, prix_commande, qte, montant) VALUES(4, 6, 3.5, 1, 0);
INSERT INTO ligcdes (id_cde, id_livre, prix_commande, qte, montant) VALUES(4, 7, 3.5, 1, 0);
INSERT INTO ligcdes (id_cde, id_livre, prix_commande, qte, montant) VALUES(4, 8, 4.5, 1, 0);
INSERT INTO ligcdes (id_cde, id_livre, prix_commande, qte, montant) VALUES(5, 7, 3.5, 12, 0);
INSERT INTO ligcdes (id_cde, id_livre, prix_commande, qte, montant) VALUES(5, 8, 4.5, 11, 0);
INSERT INTO ligcdes (id_cde, id_livre, prix_commande, qte, montant) VALUES(6, 6, 3.5, 1, 0);
INSERT INTO ligcdes (id_cde, id_livre, prix_commande, qte, montant) VALUES(6, 8, 4.5, 1, 0);
INSERT INTO ligcdes (id_cde, id_livre, prix_commande, qte, montant) VALUES(11, 7, 3.5, 1, 0);
INSERT INTO ligcdes (id_cde, id_livre, prix_commande, qte, montant) VALUES(11, 8, 4.5, 1, 0);


INSERT INTO livres (id_livre, titre, annee, condense, nb_pages, id_auteur, id_editeur, prix, couverture) VALUES
(1, 'L''insoutenable', '2006', 'La legerete et la pesanteur', 300, 2, 1, 3, 'l_insoutenable.jpg'),
(2, 'A l''ombre ...', '2006', 'Une jeunesse dore', 300, 1, 3, 4, 'a_l_ombre.jpg'),
(3, 'Risibles amours', '2006', 'Une s�rie de r�cits de Kundera', 250, 2, 1, 6, 'risibles_amours.jpg'),
(4, 'Un amour de Swann', '2006', 'L''amour de Swann pour Odette', 275, 1, 3, 5.5, 'un_amour_de_swann.jpg'),
(5, 'L''homme qui voulait vivre sa vie', '2006', 'Un cadre new-yorkais tue l''amant de sa femme et prend sa place', 450, 3, 2, 6.5, 'l_homme_qui_voulait_vivre_sa_vie.jpg'),
(6, 'Cul de sac', '1988', 'Une aventure en Australie', 150, 3, 2, 5, 'cul_de_sac.jpg'),
(7, 'Rien ne va plus', '2004', 'Massacres � Hollywood', 347, 3, 2, 6.5, 'rien_ne_va_plus.jpg'),
(8, '99F', '2004', 'le monde de la pub', 300, 6, 3, 6.5, '99F.jpg'),
(9, 'Journal', '1864', 'Leur journal', 300, 1, 1, 10.5, 'journal_goncourt.jpg');

INSERT INTO villes (cp, nom_ville) VALUES('06000', 'Nice');
INSERT INTO villes (cp, nom_ville) VALUES('13000', 'Marseille');
INSERT INTO villes (cp, nom_ville) VALUES('75002', 'PARIS 2');
INSERT INTO villes (cp, nom_ville) VALUES('75003', 'PARIS 3');
INSERT INTO villes (cp, nom_ville) VALUES('75006', 'Paris 6');
INSERT INTO villes (cp, nom_ville) VALUES('75007', 'Paris 7');
INSERT INTO villes (cp, nom_ville) VALUES('75011', 'Paris 11');
INSERT INTO villes (cp, nom_ville) VALUES('75012', 'Paris 12');
INSERT INTO villes (cp, nom_ville) VALUES('75016', 'PARIS 16');
INSERT INTO villes (cp, nom_ville) VALUES('76000', 'Rouen');
INSERT INTO villes (cp, nom_ville) VALUES('78000', 'Versailles');
INSERT INTO villes (cp, nom_ville) VALUES('78200', 'Trappes');



SET FOREIGN_KEY_CHECKS = 1;