<?
	if(!isset($_SESSION[usuario]) || !strlen($_SESSION[usuario]))
	{
		include "error.php";
		die();
	}
?>
