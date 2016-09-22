<?
	
	include "funciones.php";
	 
?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
<head>
<title><?=$titulo?></title>
<?php
/*if($_SESSION[tema] == "default")
{*/
echo '<link rel="StyleSheet" type="text/css" href="../general/stylo.css">';
/*}
if($_SESSION[tema] == "0tr0")
{
echo '<link rel="StyleSheet" type="text/css" href="../general/stylo_0tr0.css">';
}
if($_SESSION[tema] == "m4rc3")
{
echo '<link rel="StyleSheet" type="text/css" href="../general/stylo_m4rc3.css">';
}
if($_SESSION[tema] == "rub3n")
{
echo '<link rel="StyleSheet" type="text/css" href="../general/stylo_rub3n.css">';
}
if($_SESSION[tema] == "4zul")
{
echo '<link rel="StyleSheet" type="text/css" href="../general/stylo_4zul.css">';
}*/
?>
</head>

<style type="text/css">@import url(../js/jscalendar/calendar-win2k-1.css);</style>
<script type="text/javascript" src="../js/jscalendar/calendar.js"></script>
<script type="text/javascript" src="../js/jscalendar/lang/calendar-en.js"></script>
<script type="text/javascript" src="../js/jscalendar/calendar-setup.js"></script>
<script type="text/javascript" src="../js/prototype.js"></script>

<body link=#002090 vlink=#204090 alink=#204090 topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">
<table align=center border=0 cellspacing=0 cellpadding=6 width=97%><tr><td bgcolor=#EFEFEF>
<?php

//echo dirname(__FILE__);

//<td bgcolor=#EDD4BA>
$perfil = "";//$_SESSION[perfil];



if($perfil == "administrador")
{
include "../reportes/top_administrador.php";
}
else if ($perfil == "operador")
{
include "../reportes/top_operador.php";
}
else{

include "../reportes/top_usuario.php";

}




?>
