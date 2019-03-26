<?php
// echo 'voici le résultat<br>';

$v1 = filter_input(INPUT_GET, "valeur1");
$v2 = filter_input(INPUT_GET, "valeur2");

function add($a, $b): int {
    return $a + $b;
}


echo "la valeur 1 est: ", $v1,"<br>";
echo "la valeur 2 est: ", $v2,"<br>";
echo add($v1, $v2);
echo "<br>c 'est ok ?";
?>