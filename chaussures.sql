CREATE DATABASE magasin;

USE magasin;

CREATE TABLE chaussure
(
  id int(11)  NOT NULL AUTO_INCREMENT,
  modele varchar(255),
  marque varchar(255),
  couleur varchar(255),
  prix int(11),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE client
(
  id int(11)  NOT NULL AUTO_INCREMENT,
  prenom varchar(255),
  nom varchar(255),
  adresseMail varchar(255),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE adresse
(
  id int(11) NOT NULL AUTO_INCREMENT,
  numRue int(11) NOT NULL,
  nomRue varchar(255) NOT NULL,
  codePostal int(5) NOT NULL,
  ville varchar(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE commande
(
  numCommande int(11) NOT NULL AUTO_INCREMENT,
  dateCommande date NOT NULL,
  coutTotal int(11),
  id_client int(11),
  id_adresse int(11),
  PRIMARY KEY (numCommande),
  CONSTRAINT fk_client_commande FOREIGN KEY (id_client) REFERENCES client(id),
  CONSTRAINT fk_adresse_commande FOREIGN KEY (id_adresse) REFERENCES adresse(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE panier
(
  quantiteChaussure int(11),
  pointure varchar(255),
  id_commande int(11),
  id_chaussure int(11),
  CONSTRAINT fk_commande_panier FOREIGN KEY (id_commande) REFERENCES commande(numCommande),
  CONSTRAINT fk_chaussure_panier FOREIGN KEY (id_chaussure) REFERENCES chaussure(id),
  PRIMARY KEY (id_commande,id_chaussure)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/* Insertion des valeurs */

INSERT INTO client (prenom, nom, adresseMail)
VALUES
("Gérard", "Fortier","GerardFortier@dayrep.com"),
("Gaston","Blondlot","GastonBlondlot@teleworm.us"),
("Thierry","Benoit","ThierryBenoit@armyspy.com"),
("Mason","Lamoureux","MasonLamoureux@jourrapide.com"),
("Emile","Lamy","EmileLamy@armyspy.com"),
("Beaufort","Baron","BeaufortBaron@armyspy.com"),
("Eric","Couturier","EricCouturier@dayrep.com"),
("Scoville","Francoeur","ScovilleFrancoeur@jourrapide.com"),
("Aubrey","Chartier","AubreyChartier@dayrep.com"),
("Chapin","Berger","ChapinBerger@armyspy.com"),
("Didiane","Duval","DidianeDuval@dayrep.com"),
("Dasmiane","Ledux","DasmianeLedux@gmail.com"),
("Anouk","Chaloux","AnoukChaloux@dayrep.com"),
("Laurene","Mercure","LaureneMercure@armyspy.com"),
("Aimée","Robitaille","AimeeRobitaille@orange.fr")
;

INSERT INTO chaussure (modele, marque, couleur, prix)
VALUES
("Basket","Nike","Rouge","45"),
("Basket","Adidas","Jaune","39"),
("Richelieu","Puma","Vert","29"),
("Richelieu","Nike","Bleu","39"),
("Mocassin","Puma","Rouge","49"),
("Mocassin","Adidas","Rouge","29"),
("Bateau","Nike","Vert","39"),
("Bateau","Puma","Vert","29"),
("Santiags","Levis","Rouge","24"),
("Santiags","Puma","Jaune","149"),
("Bottines","Nike","Orange","79"),
("Bottines","Puma","Orange","49"),
("Talons","Nike","Noir","89"),
("Talons","Adidas","Noir","79"),
("Escarpins","Levis","Blanc","44"),
("Escarpins","Nike","Blanc","35"),
("Espadrilles","Puma","Rouge","76"),
("Espadrilles","Adidas","Vert","27"),
("Ballerines","Esprit","Bleu","92"),
("Ballerines","Nike","Bleu","22")
;

INSERT INTO adresse (numRue, nomRue, codePostal, ville)
VALUES
("3","rue Bonneterie","97100","Basse-Terre"),
("53","Rue Bonnet","67100","Strasbourg"),
("34","rue Nationale","92210","Saint-cloud"),
("13","Rue du Limas","25200","Montbéliard"),
("2","rue des dunes","38400","Saint-martin-d'heres"),
("23","quai saint-nicolas","37100","Tours"),
("34","Place Charles de Gaulle","59493","Villeneuve-d'ascq"),
("55","place du jeu de paume","18100","Vierzon"),
("2","rue du Général Ailleret","97139","Les abymes"),
("45","place Stanislas","44000","Nantes")
;

INSERT INTO commande (dateCommande, coutTotal,id_client, id_adresse )
VALUES
("2019-02-22","174","1","1"),
("2019-03-24","39","5","4"),
("2019-05-26","184","11","1"),
("2019-02-23","434","2","5"),
("2019-05-22","213","2","8"),
("2019-06-12","321","2","2"),
("2019-07-02","39","15","9"),
("2019-02-03","89","3","10"),
("2019-01-13","124","4","4"),
("2019-06-21","384","4","1"),
("2019-04-20","931","5","3"),
("2019-07-25","182","7","2"),
("2019-02-21","100","9","6"),
("2019-05-16","99","9","2"),
("2019-09-19","284","2","5"),
("2019-06-10","132","8","1"),
("2019-04-04","119","10","8"),
("2019-08-05","110","12","1"),
("2019-02-02","211","11","2"),
("2019-01-01","69","14","3"),
("2019-01-05","79","1","7")
;

INSERT INTO panier (quantiteChaussure,pointure,id_commande,id_chaussure)
VALUES
("2","40","1","1"),
("4","41","2","2"),
("3","40","3","5"),
("2","42","4","11"),
("2","47","5","2"),
("1","41","6","6"),
("1","39","7","9"),
("2","39","8","12"),
("3","40","9","12"),
("2","41","10","11"),
("1","41","11","16"),
("2","42","12","5"),
("1","40","13","9"),
("1","43","14","2"),
("3","44","15","9"),
("2","43","16","4"),
("1","45","17","8"),
("2","46","18","11"),
("1","44","19","10"),
("2","42","20","1")
;

/* Liste des requêtes */
/* Récupérer la liste des clients */

SELECT * FROM client;

/* Nombre de commandes par clients */

SELECT nom,prenom,count(*)
FROM client
INNER JOIN commande ON client.id = commande.id_client
GROUP BY nom,prenom;

/* Nombre total de commandes */

SELECT COUNT(*)
FROM commande;

/* Nombre de chaussures vendues par modèle */

SELECT modele,SUM(quantiteChaussure)
FROM chaussure
INNER JOIN panier ON chaussure.id = panier.id_chaussure
GROUP BY modele;

/* Nombre de chaussures vendues par marque */

SELECT marque,SUM(quantiteChaussure)
FROM chaussure
INNER JOIN panier ON chaussure.id = panier.id_chaussure
GROUP BY marque;

/* Nombre total de chaussures vendues */

SELECT SUM(quantiteChaussure)
FROM panier;

/* Total d'argent dépensé */

SELECT nom,prenom,SUM(coutTotal)
FROM client
INNER JOIN commande ON client.id = commande.id_client
GROUP BY nom,prenom;

/* Nombre de commandes dépassant les 100 euros */

 SELECT COUNT(*)
 FROM commande
 WHERE coutTotal > 100;
