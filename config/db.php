<?php

try {
    //Ici je me connecte à la base de données
 
 
$password = "votre_mot_de_passe"; // Mot de passe de l'utilisateur MySQL
    $mysqlClient = new PDO('mysql:host=localhost;dbname=forum1;charset=utf8', 'root', $password);
    echo "Connexion à la base de données reussie <br>";
} catch (Exception $e){
    //Ici je récupere et affiche l'erreur
    die('ERREUR : ' . $e->getMessage());
}