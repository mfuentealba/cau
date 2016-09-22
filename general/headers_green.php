<?
	session_start();
	echo SID;
	include "valida_session.php";
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
<head>
<title><?=$titulo?></title>
<link rel="StyleSheet" type="text/css" href="../general/stylo.css">
</head>
<body link=#002090 vlink=#204090 alink=#204090 topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">
<table align=center border=0 cellspacing=0 cellpadding=6 width=97%><tr><td bgcolor=#90C0BE>
<?php
$perfil = $_SESSION[perfil];
if($perfil == "administrador")
{
include "../reportes/top_administrador.php";
}
else
{
include "../reportes/top_tecnico.php";
}
?>
