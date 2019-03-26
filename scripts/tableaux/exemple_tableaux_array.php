<?php

//tableau ajouté manuellement
$noms[] = 'François'; // Créera $prenoms[0]
$noms[] = 'Michel'; // Créera $prenoms[1]
$noms[] = 'Nicole'; // Créera $prenoms[2]
foreach ($noms as $key => $value) {
    echo '<p>' . $value . '</p>';
}
echo '<hr>';
//
// tableau crée automatiquement
$prenoms = array('sylvain', 'joel', 'christophe');
foreach ($prenoms as $value) {
    echo '<p>' . "prénom: " . $value . '</p>';
}
echo '<hr>';
//
// tableau avec des labels
$tableau = array('nom' => 'TONGTAE', 'prenom' => 'Chuenjai', 'taille' => '152');
foreach ($tableau as $libelle => $detail) {
    echo '<p>' . $libelle . "= " . $detail . '</p>';
}
echo '<hr>';
?>








