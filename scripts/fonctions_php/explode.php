<?php

// Exemple 1
$pizza = "poivrons oignons lardons creme oeuf jambon";
$pieces = explode(" ", $pizza);
$tableau = count($pieces);
for ($i = 0; $i < $tableau; $i++) {
    echo 'votre pizza comprend: ' . $pieces[$i] . '<br />';
}
?>