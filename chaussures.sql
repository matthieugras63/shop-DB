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

