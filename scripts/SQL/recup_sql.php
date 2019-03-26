<?php
$recupId="SELECT id FROM infos_compte WHERE `infos_compte`.`pseudo` ='$pseudo' AND `infos_compte`.`mdp` ='$mdp'";			
$result =mysql_query($recupId,$idcomm); // $idcomm s'occupe de me connecter à ma base
$row=mysql_fetch_assoc($result);
$id = $row['id'];
?>