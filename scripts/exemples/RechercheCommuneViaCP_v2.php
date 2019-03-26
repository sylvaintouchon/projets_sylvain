<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>RechercheCommuneViaCP_v2</title>
    </head>
    <body>
        <form action="" method="get">
            <label>CP ? </label>
            <input name="cp" type="text" value="24200" />
            <input type="submit" />
        </form>
        <br>

        <?php
        $lsMessage = "";
        $lsContenu = "";
        $lsSeparateur = ";";
        $lsFichier = "communes_vide.txt";
        $lsFichier = "communes.txt";
        $lsFichier = "communes_avec_anomalies.txt";
        
        $cp = filter_input(INPUT_GET, "cp");
        if ($cp != null) {
            if (!file_exists($lsFichier)) {
                $lsMessage = "Le fichier $lsFichier n'existe pas !";
            } else {
                // --- Ouverture du fichier et transfert dans un tableau
                $tEnregistrements = file($lsFichier);
                // --- Parcours des n lignes du tableau
                $liCompte = count($tEnregistrements);
//                echo "<hr>$liCompte<hr>";
                if ($liCompte == 0 || $liCompte == 1) {
                    $lsMessage = "Le fichier est vide !!!";
                } else {
                    for ($i = 0; $i < $liCompte; $i++) {
                        // --- "Explosion" de l'enregistrement
                        if (trim($tEnregistrements[$i]) == "") {
                            $lsMessage .= "Enregistrement vide à la ligne $i<br>";
                        } else {
                            $tChamps = explode($lsSeparateur, $tEnregistrements[$i]);
                            if (count($tChamps) == 4) {
// --- Comparaison du 2ème élément à la valeur saisie
                                if ($tChamps[1] == $cp) {
                                    // --- Récupération du nom de la commune
                                    $lsContenu .= $tChamps[0] . "<br>";
                                }
                            } else {
                                $lsMessage = "Enregistrement 'trop' court à la ligne $i<br>";
                            }
                        }
                    }
                }
                // --- Si résulat est vide ...
                if ($lsContenu == "" && $liCompte > 1) {
                    $lsMessage = "CP inexistant";
                }
            }
        } else {
            if (isSet($cp)) {
                $lsMessage = "Veuillez saisir un CP !!!";
            }
        }
        ?>

        <p>
            <?php
            if ($lsContenu != "") {
                echo "<hr>Contenu<hr>" . $lsContenu;
            }
            ?>
        </p>

        <p>

            <?php
            if ($lsMessage != "") {
                echo "<hr>Message<hr>" . $lsMessage;
            }
            ?>
        </p>

    </body>
</html>
