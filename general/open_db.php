<?php
$dbhost="localhost";
$dbuser="cau2";
$dbpass="cau";
$db="cau";
$conexion = mysql_connect($dbhost, $dbuser, $dbpass);
mysql_select_db($db, $conexion);
date_default_timezone_set('America/Santiago');
?>
