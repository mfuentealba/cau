<?php
$dbhost="localhost";
$dbuser="cau3";
$dbpass="cau";
$db="cau2";
$conexion = mysql_connect($dbhost, $dbuser, $dbpass);
mysql_select_db($db, $conexion);
date_default_timezone_set('America/Santiago');
?>
