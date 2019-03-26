<?php
$host_name = 'db656542157.db.1and1.com';
$database = 'db656542157';
$user_name = 'dbo656542157';
// mettrre le véritable mot de passe
$password = 'password';

$connect = mysql_connect($host_name, $user_name, $password, $database);
if (mysql_errno()) {
    die('<p>La connexion au serveur MySQL a échoué: '.mysql_error().'</p>');
} else {
    echo '<p>Connexion au serveur MySQL établie avec succès.</p >';
}
?>