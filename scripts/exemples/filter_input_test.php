<?php
/*
 * filter_input_test.php
 */
$nom = filter_input(INPUT_GET, "nom");
if ($nom != null) {
    $message = $nom;
} else {
    $message = "Nom non saisi ou formulaire absent !!!";
}
?>

<form>
    Nom : 
    <input name="nom" value="Tintin"/>
    <input type="submit" />
</form>

<?php
echo $message;
?>

