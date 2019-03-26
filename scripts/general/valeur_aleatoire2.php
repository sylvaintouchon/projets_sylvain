<?php

$nom = ('ABCDEFGHIJKLMNOPQRSTUVWXYZ');
$nom = (str_shuffle(substr($nom, 0, rand(4, 10))));
echo $nom, "<br>";

$prenom = ('abcdefghijklmnopqrstuvwxyz');
$prenom = (str_shuffle(substr($prenom, 0, rand(4, 10))));
echo $prenom . "<br>";

$mdp = ('0123456789');
$mdp = (str_shuffle(substr($mdp, 0, rand(4, 6))));
echo $mdp;

?>
