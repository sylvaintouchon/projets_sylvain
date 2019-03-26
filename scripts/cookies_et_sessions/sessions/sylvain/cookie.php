<?php

// setcookie (nom, valeur, date de fin)
// pour time: 60*60*24 =60 secondes X 60 minutes X 24 heures

$cookieFin = time()+60*60*24;
setcookie("login", "sylvain", $cookieFin);
echo $_COOKIE["login"];


