<?php
//test_connexion_sql.php


$user_name = filter_input(INPUT_GET, "user");
$password = filter_input(INPUT_GET, "mdp");
$host_name = filter_input(INPUT_GET, "hote");
$database = filter_input(INPUT_GET, "bdd");

echo $database;


$connect = mysql_connect($host_name, $user_name, $password, $database);
echo $connect;

if (mysql_errno()) {

    die('<p>La connexion au serveur MySQL a échoué: '.mysql_error().'</p>');

} else {

    echo '<p>Connexion au serveur MySQL établie avec succès.</p >';

}

?>