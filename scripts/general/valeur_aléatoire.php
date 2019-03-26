
<?php

/*
Les fonctions CSPRNG
Deux nouvelles fonctions ont été ajoutées pour générer cryptographiquement des entiers et des chaînes de caractères sécurisés de façon multi-plateforme : random_bytes() et random_int().
*/

// test rand: valeur aléatoire
$valeur_aleatoire = rand(1000000000, 2000000000);
echo '<U>nombre aléatoire: </U>' . $valeur_aleatoire;


// test random_bytes Génère des octets pseudo-aléatoire cryptographiquement sécurisé
$c = random_bytes(3);
echo '<br><U>valeur aléatoire random_bytes:</U> ' . $c;


// test random_int Génère des nombres entiers pseudo-aléatoire cryptographiquement sécurisé
$i = random_int(0,9);
echo '<br><U>valeur aléatoire random_int: </U>' . $i;

// tests divers
echo '<p><U>tests divers<br></U>';
echo rand() . "\n";
echo rand(5, 15);

?>

