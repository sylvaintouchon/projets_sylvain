<?php
$submit1 = filter_input(INPUT_POST, "submit1");
$submit2 = filter_input(INPUT_POST, "submit2");
$valeur1 = filter_input(INPUT_POST, "valeur1");
$valeur2 = filter_input(INPUT_POST, "valeur2");

echo $submit1 . '<br>' . $submit2, '<br>' . $valeur1 . '<br>' . $valeur2
?>

<br>
<a href="formulaire_2_submit.php">retour au formulaire</a>
