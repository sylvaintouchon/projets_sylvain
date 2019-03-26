<?php

/*
 * filter_input_test_recup.php
 */

$nom = filter_input(INPUT_GET, "nom");
if ($nom == null) {
    echo "Veux-tu bien saisir espèce d'abruti !!!";
} else {
    echo $nom, ", t'es pas un abruti !!!";
}
?>
