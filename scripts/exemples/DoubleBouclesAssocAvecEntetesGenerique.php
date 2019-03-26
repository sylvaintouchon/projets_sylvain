<?php
/*
  PaysSelectBoucleColonnesAssoc.php
 */
header("Content-Type: text/html; charset=UTF-8");

$lsMessage = "";
$lsTableHeader = "";
$lsTableData = "";

try {
    // --- Tentative de connexion
    $lcnx = new PDO("mysql:host=localhost;port=3306;dbname=cours;", "root", "");
    // --- Attributs de connexion : erreur --> exception
    $lcnx->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // --- Communication UTF-8 entre BD et script
    $lcnx->exec("SET NAMES 'UTF8'");

    $lrs = $lcnx->query("SELECT * FROM villes");
    $lrs->setFetchMode(PDO::FETCH_ASSOC);

    $liNumRow = 1;
    $lsTableHeader .= "<tr>";
    // On boucle sur les lignes
    foreach ($lrs as $lrec) {
        $lsTableData .= "<tr>";
        // On boucle sur les colonnes
        foreach ($lrec as $cle => $valeur) {
            if ($liNumRow == 1) {
                $lsTableHeader .= "<th>$cle</th>";
            }
            $lsTableData .= "<td>$valeur</td>";
        }
        $lsTableHeader .= "</tr>";
        $lsTableData .= "</tr>";
        $liNumRow++;
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
        <?php
        echo $lsTableHeader;
        ?>
    </thead>
    <tbody>
        <?php
        echo $lsTableData;
        ?>
    </tbody>
</table>

<label>
    <?php
    echo $lsMessage;
    ?>
</label>