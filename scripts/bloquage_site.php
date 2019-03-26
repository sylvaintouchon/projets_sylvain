<html>


    <body>

        <form method="get" action = "">entrer votre nom<input type="text" name="nom" value="" />
            <input type="submit" name="submit"/>
        </form>


    </body>

</html>


<?php
$nom = filter_input(INPUT_GET, nom);
if (isset($nom)) {
    echo "bonjour " . $nom . "<br>";
    echo "bonjour " . HTMLENTITIES($nom);
}
?>



