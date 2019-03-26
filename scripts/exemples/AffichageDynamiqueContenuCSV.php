<?php
/*

 */
$lsContenu = "";
$lsMessage = "";
$nomDuFichier = filter_input(INPUT_GET, "nomDuFichier");

if ($nomDuFichier == null) {
    if (isSet($nomDuFichier)) {
        $lsMessage = "Veuillez saisir !!!";
    }
} else {
    if (file_exists($nomDuFichier)) {
        //$lsContenu = nl2br(file_get_contents($nomDuFichier));
        $tLignes = file($nomDuFichier);
        $tEntetes = explode(";", $tLignes[0]);
    } else {
        $lsMessage = "Le fichier $nomDuFichier n'existe pas !!!";
    }
}
?>

<form action="" method="get">
    Nom du fichier ?
    <input type="text" name="nomDuFichier" value="personnages.txt" />
    <input type="submit" />
</form>

<table>
    <thead>
        <tr>
            <?php
            if (isSet($tEntetes)) {
                $lsEntetes = "";
                for ($i = 0; $i < count($tEntetes); $i++) {
                    $lsEntetes .= "<th>$tEntetes[$i]</th>";
                }
                echo $lsEntetes;
            }
            ?> 
        </tr>
    </thead>

    <tbody>
        <?php
        if (isSet($tLignes)) {
            for ($i = 1; $i < count($tLignes); $i++) {
                echo "<tr>";
                $tChamps = explode(";", $tLignes[$i]);
                for ($j = 0; $j < count($tChamps); $j++) {
                    echo "<td>$tChamps[$j]</td>";
                }
                echo "</tr>";
            }
        }
        ?> 
    </tbody>
</table>

<p>
    <?php
    echo $lsMessage;
    ?>
</p>




