<?php
// (ré)initialisation des variables
unset($nom);
unset($prenom);
unset($naissance);
unset($telephone);
unset($selection);
?>

<html>
    <head>
        <title>identification</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="lib/bootstrap/css/sylvain.css">

    </head>
    <body>
        <div class="container-fluid">

            <article class="grey col-xs-12 col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <form method = "post" name="formulaire">
                    Nom
                    <br>
                    <input type="text" name="nom" placeholder="Nom ?" />
                    <br>
                    Prénom
                    <br>
                    <input type="text" name="prenom" placeholder="Prénom ?" />
                    <br>
                    Téléphone (10 chiffres)
                    <br>
                    <input type="tel" name="telephone" />          
                    <br>
                    Date de naissance
                    <br>
                    <input type="date" name="naissance" value="1955-10-03" />
                    <br>
                    <input type="email" name="mail" placeholder="sylvain.touchon@gmail.com" />
                    <br>
                    stage
                    <br>
                    <select name = "selection">
                        <option></option>
                        <option>CDA</option>
                        <option>DW</option>
                        <option>DWM</option>                              
                    </select>
                    <br>
                    <br>
                    <button type="submit" name="button" class="btn btn-success">ENVOYER !</button>

                </form>
            </article>
            <br>


            <?php
// récupération des variables et "sécurisation"
            $nom = htmlentities($snom);
            $nom = filter_input($POST, nom);
            $prenom = htmlentities($prenom);
            $prenom = filter_input($POST, prenom);
            $naissance = htmlentities($naissance);
            $naissance = filter_input($POST, naissance);
            $mail = htmlentities($mail);
            $mail = filter_input($POST, mail);
            $selection = htmlentities($selection);
            $selection = filter_input($POST, selection);

// test si les champs ont été remplis
// if (isset($nom) and isset($prenom) and isset($naissance)) ne fonctionne pas

            if (($nom != "") and ( $prenom != "") and ( $mail != "") and ( $selection != "")) {
                echo "formulaire validé, merci";
            } else {
                echo "<strong><u>toutes les valeurs sont obligatoires sauf le téléphone !!!<br></u></strong><br>";
            }

            echo '<br>nom:' . $nom;
            ?>

        </div>
    </body>
</html>


