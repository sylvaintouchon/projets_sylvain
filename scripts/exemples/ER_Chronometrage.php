<?php

/*

 */

$cp = "a7501";
$nbBoucles = 10000000;

$debut = time();

//sleep(3);

for ($i = 0; $i < $nbBoucles; $i++) {
    preg_match("@^[0-9]{5}$@", $cp); // Affiche 1 ou 0
}
$fin = time();
$duree = $fin - $debut;

$string = "Durée : ";
$string .= $duree;
echo $string;

echo "<hr>";

$string = "";
$debut = time();
//sleep(3);
for ($i = 0; $i < $nbBoucles; $i++) {
    //preg_match("@^[0-9]{5}$@", "75011"); // Affiche 1 ou 0

    if (strlen($cp) == 5) {
        $lbOK = TRUE;
        $j = 0;
        while ($j < strlen($cp) && $lbOK === TRUE) {
            if ($cp[$j] < "0" || $cp[$j] > "9") {
//            if (!($cp[$j] >= "0" && $cp[$j] <= "9")) {
                $lbOK = FALSE;
            }
            $j++;
        }
    }
}
$fin = time();
$duree = $fin - $debut;

$string = "Durée : ";
$string .= $duree;
echo $string;