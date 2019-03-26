<?php

// on écrit session_start tout en haut de la page comme ici sans rien d'autre devant

session_start();
$_SESSION["login"] = "sylvain ";

?>

<a href="page_principale.php">aller sur la page principale</a>