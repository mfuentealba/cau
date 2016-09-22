
<?php

function devuelveFechas($fechaInicio,$fechaTermino){

define('DAY_SEC', 86400); // Número de segundos al día

$fechaInicio = date("Y-m-d", strtotime("$fechaInicio -1 day"));
$init = $fechaInicio; // Fecha de inicio
$end = $fechaTermino; // Fecha final
$day = 1; // Día seleccionado 0 (para el Domingo) a 6 (para el Sábado)
$days = array(); // Vector donde almacenar los días
$current = strtotime($init); // Fecha numérica (Unix)


do {
	
	$current += DAY_SEC; // Incrementa en días
}
while($current <= strtotime($end) && array_push($days, date('d-m-Y', $current)));

// Evalua y añade la fecha al vector


// esto es lo nuevo me agrega el si el dia de inicio es igual al seleccionado al final del verctor days


//echo"<br>";
return $days; // Imprime el vector
}
?> 