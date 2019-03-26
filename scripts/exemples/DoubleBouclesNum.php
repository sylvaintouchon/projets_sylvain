<?php

/*
PaysSelectBoucleColonnesAssoc.php
 */
header("Content-Type: text/html; charset=UTF-8");

$lsMessage = "";
$lsTableHTML = "";

try {
    // --- Tentative de connexion
    $lcnx = new PDO("mysql:host=localhost;port=3306;dbname=cours;", "root", "");
    // --- Attributs de connexion : erreur --> exception
    $lcnx->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // --- Communication UTF-8 entre BD et script
    $lcnx->exec("SET NAMES 'UTF8'");

    $lrs = $lcnx->query("SELECT * FROM villes");
    $lrs->setFetchMode(PDO::FETCH_NUM);

    // On boucle sur les lignes
    foreach ($lrs as $lrec) {
        $lsTableHTML .= "<tr>";
        // On boucle sur les colonnes
        foreach ($lrec as $cle => $valeur) {
            $lsTableHTML .= "<td>$valeur</td>";
        }
        $lsTableHTML .= "</tr>";
    }

    $lrs->closeCursor();
} /// try
// --- Recuperation d'une exception
catch (PDOException $e) {
    $lsMessage = "Echec de l'exécution : " . $e->getMessage();
} /// catch
// --- Deconnexion
$lcnx = null;

?>


<table border="1">
    <thead>
    </thead>
    <tbody>
        <?php
        echo $lsTableHTML;
        ?>
    </tbody>
</table>

<label>
    <?php
    echo $lsMessage;
    ?>
</label>