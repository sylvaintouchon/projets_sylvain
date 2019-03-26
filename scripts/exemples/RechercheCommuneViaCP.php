<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>RechercheCommuneViaCP</title>
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
        // --- Initialisation de la chaîne résultat
        $lsContenu = "";
        $cp = filter_input(INPUT_GET, "cp");
        if ($cp != null) {
            $lsFichier = "communes.txt";
            if (!file_exists($lsFichier)) {
                $lsMessage = "Le fichier $lsFichier n'existe pas !";
            } else {
                // --- Ouverture du fichier et transfert dans un tableau
                $tEnregistrements = file($lsFichier);
                // --- Parcours des n lignes du tableau
                $liCompte = count($tEnregistrements);
                for ($i = 0; $i < $liCompte; $i++) {
                    // --- "Explosion" de l'enregistrement
                    $tChamps = explode(";", $tEnregistrements[$i]);
                    // --- Comparaison du 2ème élément à la valeur saisie
                    if ($tChamps[1] == $cp) {
                        // --- Récupération du nom de la commune
                        $lsContenu .= $tChamps[0] . "<br/>";
                    }
                }
                // --- Si résulat est vide ...
                if ($lsContenu == "") {
                    $lsMessage = "CP inexistant";
                }
            }
        } else {
            if (isSet($cp)) {
                $lsMessage = "Veuillez saisir un CP !!!";
            }
        }
        echo $lsContenu;
        echo $lsMessage;
        ?>

    </body>
</html>
