<?php
header("Content-Type: text/html;charset=UTF-8");

echo "<br>Code département :  ", substr("75011", 0, 2);
echo "<br>Code Commune :  ", substr("75011", 2);
echo "<br>Le premier o de bonsoir : ", strpos('Bonjour','o');
echo "<br>Le dernier o de bonsoir : ", strrpos('Bonjour','o');
echo "<br>Majuscules : ", strtoupper('Bonjour');
echo "<br>Minuscules : ", strtolower('Bonjour');
echo "<br>Nom propre : ", ucFirst('bonjour');
echo "<br>Noms propres : ", ucWords('bonjour tout le monde');
echo "<br>Trim : *", trim('  bonjour   '), "*";
echo "<br>Longueur de bonjour : ", strlen('bonjour');
echo "<br>Nombre de o dans bonjour : ", substr_count('bonjour','o');

echo "<br>Extrait à partir de la première occurrence : ", strchr('il était une fois une marchande de foie dans la ville de ...','foi');
echo "<br>Extrait à partir de la dernière occurrence : ", strrchr('il était une fois une marchande de foie dans la ville de ...','foi');

echo "<br>chr(65)  : ", chr(65);
echo "<br>ord('A') : ", ord('A');
?>

