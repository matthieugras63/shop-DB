
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
