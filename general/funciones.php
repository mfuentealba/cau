
<?php

function devuelveFechas($fechaInicio,$fechaTermino){

define('DAY_SEC', 86400); // N�mero de segundos al d�a

$fechaInicio = date("Y-m-d", strtotime("$fechaInicio -1 day"));
$init = $fechaInicio; // Fecha de inicio
$end = $fechaTermino; // Fecha final
$day = 1; // D�a seleccionado 0 (para el Domingo) a 6 (para el S�bado)
$days = array(); // Vector donde almacenar los d�as
$current = strtotime($init); // Fecha num�rica (Unix)


do {
	
	$current += DAY_SEC; // Incrementa en d�as
}
while($current <= strtotime($end) && array_push($days, date('d-m-Y', $current)));

// Evalua y a�ade la fecha al vector


// esto es lo nuevo me agrega el si el dia de inicio es igual al seleccionado al final del verctor days


//echo"<br>";
return $days; // Imprime el vector
}
?> 