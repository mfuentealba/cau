<?php

require_once("SucursalesService.php");
require_once("MantenedorService.php");
require_once("UsuariosService.php");

$objSuc = new $_REQUEST['servicio']();
$resp = 0;


if($_REQUEST['data'] != ""){
	$resp = $objSuc->$_REQUEST['accion'](json_decode($_REQUEST['data']));	
	
} else {
	$resp = $objSuc->$_REQUEST['accion']();		
	//print_r($resp);
}


$count = count($resp);

if($count > 1){
	for($i = 0; $i <$count; $i++){		
		print_r($resp[$i]);
		$resp[$i] = json_encode($resp[$i]);
	}
	
}

$result = new stdclass();
$result->result = $resp;
//$result->id = 0;

echo json_encode($result);//$resp);
//echo $result;//$resp);

/*
$prueba = new stdclass();
$prueba->resp = json_encode($resp);
$prueba->valor2 = $_REQUEST;
$prueba->ref = json_decode($_REQUEST['data']);
echo json_encode($prueba);*/