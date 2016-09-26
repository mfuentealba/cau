<?php
	include "general/open_db.php";
	//include "general/datediff.php";
	
	
	function fn_calculaDiasNoHabiles($fechaInicial, $fechaFinal){
				
				
		$DifDias = ($fechaFinal - $fechaInicial)/60/60/24;
		//echo $DifDias/60/60/24;
		//exit();
  
	 //Creamos un for desde 0 hasta 3  
		$dias = 0;
		$Segundos = 0;
		for ($i=0; $i < $DifDias; $i++)  
		{  
					  //Acumulamos la cantidad de segundos que tiene un dia en cada vuelta del for  
			$Segundos = $Segundos + 86400;  
			  
					  //Obtenemos el dia de la fecha, aumentando el tiempo en N cantidad de dias, segun la vuelta en la que estemos  
			$caduca = date("D", $fechaInicial + $Segundos);  
			  
							   //Comparamos si estamos en sabado o domingo, si es asi restamos una vuelta al for, para brincarnos el o los dias...  
			if ($caduca == "Sat" || $caduca == "Sun")  
			{  
				$dias++;
			}  											
		}  
		/*echo $dias;
		exit();*/
		return $dias;
	}
	
	$ano=date('Y');
	$mes=date('m');
	$dia=date('d');
	$hora=date('h');
	$min=date('m');
	$seg=date('s');
	
	
	$fecha = date('Ymd');
	$hora = date('Hi');
	
	
	$nombreImagen = "VolcadoDatosPeriodo";
	$rutaArchivo = "../files/graficos/".$nombreImagen.$ano.$mes.$dia.".png";
	
function dia($fecha_recepcion)
{
  $fecha_separada = str_split($fecha_recepcion,4);
  $dia_mes = $fecha_separada[1];
  $fecha_separada = str_split($dia_mes,2);
  $dia = $fecha_separada[1];
  return $dia;
}

function mes($fecha_recepcion)
{
  $fecha_separada = str_split($fecha_recepcion,4);
  $dia_mes = $fecha_separada[1];
  $fecha_separada = str_split($dia_mes,2);
  $mes = $fecha_separada[0];
  
  return $mes;
}

function anio($fecha_recepcion)
{
  $fecha_separada = str_split($fecha_recepcion,4);
  $ano = $fecha_separada[0];
  return $ano;
}



 function hora($hora_recepcion)
	{
		$arr = explode(':', $hora_recepcion);
		if(count($arr) == 1){
			$hora_separada = str_split($hora_recepcion,2);
			$hora = $hora_separada[0];
			$minuto = $hora_separada[1];
			$hora_con_puntos = $hora.":".$minuto;	
		} else {
			return $arr[0];
		}
		
		return $hora;
	}	

	 function minutos($hora_recepcion)
	{
		$arr = explode(':', $hora_recepcion);
		if(count($arr) == 1){
			$hora_separada = str_split($hora_recepcion,2);
			$hora = $hora_separada[0];
			$minuto = $hora_separada[1];
			$hora_con_puntos = $hora.":".$minuto;	
		} else {
			return $arr[1];
		}
		
		return $minuto;
	}


function separa_fecha($fecha_recepcion)
{
  $fecha_separada = str_split($fecha_recepcion,4);
  $ano = $fecha_separada[0];
  $dia_mes = $fecha_separada[1];
  $fecha_separada = str_split($dia_mes,2);
  $mes = $fecha_separada[0];
  $dia = $fecha_separada[1];
  $fecha_con_guiones = $dia."-".$mes."-".$ano;
  return $fecha_con_guiones;
}
function separa_hora($hora_recepcion)
{
  $hora_separada = str_split($hora_recepcion,2);
  $hora = $hora_separada[0];
  $minuto = $hora_separada[1];
  $hora_con_puntos = $hora.":".$minuto;
  return $hora_con_puntos;
}


function calculaDigito($fecha_recepcion)
{
  $fecha_separada = str_split($fecha_recepcion,4);
  $dia_mes = $fecha_separada[1];
  $fecha_separada = str_split($dia_mes,2);
  $mes = $fecha_separada[0];
  return $mes;
}

function calculaSemana($fecha_recepcion)
{
  $fecha_separada = str_split($fecha_recepcion,4);
  $ano = $fecha_separada[0];
  $dia_mes = $fecha_separada[1];
  $fecha_separada = str_split($dia_mes,2);
  $mes = $fecha_separada[0];
  $dia = $fecha_separada[1];
  $num_semana = date('W', mktime(0, 0, 0, $mes, $dia, $ano));  
  
  return $num_semana;
}


function calculaNombreMes($fecha_recepcion)
{
  $nombreMes="";
  $fecha_separada = str_split($fecha_recepcion,4);
  $dia_mes = $fecha_separada[1];
  $fecha_separada = str_split($dia_mes,2);
  $mes = $fecha_separada[0];
  
  for ($i=1; $i<= $mes; $i++){
  
		switch ($i) {
	    case 1:
	        $nombreMes="Enero";
	        break;
	    case 2:
	        $nombreMes="Febrero";
	        break;
	    case 3:
	        $nombreMes="Marzo";
	        break;
		case 4:
	        $nombreMes="Abril";
	        break;
		case 5:
	        $nombreMes="Mayo";
	        break;
		case 6:
	        $nombreMes="Junio";
	        break;
		case 7:
	        $nombreMes="Julio";
	        break;
		case 8:
	        $nombreMes="Agosto";
	        break;
		case 9:
	        $nombreMes="Septiembre";
	        break;
		case 10:
	        $nombreMes="Octubre";
	        break;
		case 11:
	        $nombreMes="Noviembre";
	        break;
		case 12:
	        $nombreMes="Diciembre";
	        break;			
		}
  }
  return $nombreMes;
}
	

header("Content-Type: application/vnd.ms-excel; name='excel'");
header("Content-Disposition: attachment; filename=VolcadodeDatos_Periodo_$ano$mes$dia$hora$min$seg.xls"); 

				$fechaInicio = $_REQUEST['fecha'];
				//$fechaInicio = explode("-",$_REQUEST['fecha']);
				//$fechaInicio = $fechaInicio[2].$fechaInicio[1].$fechaInicio[0];//d-m-Y	
				
				$fechaTermino = $_REQUEST['fecha_fin'];
				//$fechaTermino = explode("-",$_REQUEST['fecha_fin']);
				//$fechaTermino = $fechaTermino[2].$fechaTermino[1].$fechaTermino[0];//d-m-Y
				$query = '';
				$totalReportes = mysql_query("select
											
											cl.sucursal
										from reportes r 
									        inner join clientes cl on cl.rut = r.cliente_rut 
							where fecha >= '".$fechaInicio."' and fecha <= '".$fechaTermino."'	
							".$query."
							
							
										
										
										",$conexion);
				
				$valorReportes = mysql_num_rows($totalReportes);
						
$reportes = mysql_query("select 
											r.id,
											r.problema,
											r.sub_problema,
											r.idDescripcion,
											r.fecha,
											r.hora,
											r.fecha_cierre,
											r.hora_cierre,
											r.soporte,
											c.NombreCategoria,
											s.nombreSubCategoria,
											d.nombreDescripcion,
											cl.nombres,
											cl.apellidos,
											cl.sucursal,
											cla.NombreClasificacion,
											r.estado,
											g.nombreGrupoResolutor,
											r.tipo_solucion,
											r.tipoNivel,
											cl.unidad,
											r.horaSolucion,
											r.fechaSolucion,
											r.solucionadoPor,
											r.asignado_por,
											r.solucion_dada_por,
											r.clasificacionCierre,
											r.categoriaCierre,
											r.subcategoriaCierre,
											r.descripcionCierre,
											r.creadoPor
										from reportes r 
										inner join clasificacion cla on cla.idClasificacion = r.idClasificacion
										inner join categoria c on c.idCategoria = r.problema
										inner join subcategoria s on s.idSubCategoria = r.sub_problema
										inner join descripcion d on d.idDescripcion = r.idDescripcion 
										inner join clientes cl on cl.rut = r.cliente_rut	
										inner join users u on u.username = r.soporte
										inner join gruporesolutor g on g.idGrupoResolutor = u.idGrupoResolutor
										where 1 = 1
										".$query."
										and fecha >= '".$fechaInicio."' and fecha <= '".$fechaTermino."'
										order by r.id desc
										
										
										
										",$conexion);
				
				
				$numeroFilas = mysql_num_rows($reportes);
			
				
		
		echo '<table width="800" border="0" align="center">		  
		  <tr>
			<td colspan="27" class="titulo"><font size="2">Volcado de Datos
</font></td>
		  </tr>
		  <tr>
			<td colspan="27" class="columna">Resumen del periodo:</tr>
		  <tr>
			<td colspan="27" class="columna">Desde: ' . $_REQUEST['fecha'] . ' Hasta: ' . $_REQUEST['fecha_fin'] . '</td>
		  </tr>
		  
		  <tr>

<td class="titulo">N&ordm; de Reporte</td>
			<td class="titulo">Usuario</td>
			<td class="titulo">Agencia</td>
			<td class="titulo">Unidad</td>
			<td class="titulo">Clasificaci&oacute;n Apertura</td>
			
			<td class="titulo">Categoria Apertura</td>
			<td class="titulo">SubCategoria Apertura</td>
			<td class="titulo">Descripcion Apertura</td>
			<td class="titulo">Semana Apertura</td>
			<td class="titulo">Mes Apertura</td>
			<td class="titulo">Digito Mes Apertura</td>
			<td class="titulo">Fecha/Hora Inicio</td>
			
			<td class="titulo">Fecha/Hora Solucion</td>
			<td class="titulo">Semana Cierre</td>
			<td class="titulo">Mes Cierre</td>
			<td class="titulo">Digito Mes Cierre</td>
			<td class="titulo">Fecha/Hora Cierre</td>
			<td class="titulo">Tiempo Soluci&oacute;n (D&iacute;as)</td>
			<td class="titulo">Tiempo Soluci&oacute;n (Horas)</td>
			<td class="titulo">Tiempo Total Reporte(D&iacute;as)</td>
			<td class="titulo">Tiempo Total Reporte(Horas)</td>
			
			<td class="titulo">Creado Por</td>
			<td class="titulo">Asignado a</td>
			<td class="titulo">Grupo Resolutor</td>
			<td class="titulo">Solucionado Por</td>
			<td class="titulo">Grupo Resolutor</td>
			<td class="titulo">Cerrado Por</td>
			<td class="titulo">Clasificaci&oacute;n Cierre</td>
			<td class="titulo">Categoria Cierre</td>
			<td class="titulo">SubCategoria Cierre</td>
			<td class="titulo">Descripcion Cierre</td>
			<td class="titulo">Estado</td>
			<td class="titulo">Criticidad</td>
			<td class="titulo">Nivel de Atenci&oacute;n</td>
</tr>';

		
		
			$cantidadTotal = 0;
			$fecha1 = "";
			$diaIni = "";
			$fecha2 = "";
			$diferencia = "";
			$diff = Array();	
			$diffSolucion = Array();	
			$nivel = "";
			$diferenciaSolucion = "";
			$fechaSolucion="";
			$totalHoras=0;
			$totalHorasSolucion=0;
			
			if ($reportes !== false && $numeroFilas > 0){
				$i = 0;
				while($row = mysql_fetch_array($reportes))
				{
				
				
					
					$fecha1 = mktime(0,0,0,mes($row['fecha']),dia($row['fecha']),anio($row['fecha']));		
					$diaIniCalcFeriado = anio($row['fecha']) . '-' . mes($row['fecha']) . '-' . dia($row['fecha']);
					//mktime(hora($row['hora']),minutos($row['hora']),0,mes($row['fecha']),dia($row['fecha']),anio($row['fecha']));		
					
				  
					//$diaIni = mktime(hora($row['hora']),minutos($row['hora']),0,mes($row['fecha']),dia($row['fecha']),anio($row['fecha']));		
					$diaIni = mktime(0,0,0,mes($row['fecha']),dia($row['fecha']),anio($row['fecha']));		
					
					
				//	echo $diaIniCalcFeriado . "-" . hora($row['hora']) . ':' . minutos($row['hora']) . "<br />";
					
				//	echo $hora . "<br />";
				//	echo hora($hora) . "<br />";
					
					
					/*if ($row['fecha_cierre'] != 0){
						$diaFin = dia($row['fecha_cierre']);
					}else{
						$diaFin = dia($fecha);
					}*/
					
					if ($row['fecha_cierre'] != 0){
						//$diaFin = mktime(hora($row['hora_cierre']),minutos($row['hora_cierre']),0,mes($row['fecha_cierre']),dia($row['fecha_cierre']),anio($row['fecha_cierre']));
						$diaFin = mktime(23,59,0,mes($row['fecha_cierre']),dia($row['fecha_cierre']),anio($row['fecha_cierre']));
						
						$fecha2 = mktime(0, 0, 0, mes($row['fecha_cierre']),dia($row['fecha_cierre']),anio($row['fecha_cierre']));
						$diaFinCalcFeriado = anio($row['fecha_cierre']) . '-' . mes($row['fecha_cierre']) . '-' . dia($row['fecha_cierre']);
					}else{
						$diaFin = mktime(hora($hora),minutos($hora),0,mes($fecha),dia($fecha),anio($fecha));
						$fecha2 = mktime(0, 0, 0, mes($fecha), dia($fecha), anio($fecha));
						$diaFinCalcFeriado = anio($fecha) . '-' . mes($fecha) . '-' . dia($fecha);
					}
					
				//	echo $diaFinCalcFeriado . "-" . hora($row['hora_cierre']) . ':' . minutos($row['hora_cierre']) . "<br />";
					
					$diasMenos = fn_calculaDiasNoHabiles($fecha1, $fecha2);
					
				//	echo "diaIni = " . $diaIni . "<br />";
					
				//	echo "diaFin = " . $diaFin . "<br />";
					
				//	echo "diasMenos = " . $diasMenos . "<br />";
					
					$sql = "select
											*
										from feriados 
							where fecha between '" . $diaIniCalcFeriado ."' and '".$diaFinCalcFeriado."'";//
					$data = mysql_query($sql, $conexion);
					$diasFeriados = mysql_num_rows($data);
					
				//	echo "sql = " . $sql . "<br />";
					
				//	echo "diasFeriados = " . $diasFeriados . "<br />";
					
					$horasMenos = $diasMenos * 86400;
					
				//	echo "horasMenos = " . $horasMenos . "<br />";
					
					$diaResult = round((($diaFin - $diaIni) / 60/ 60/ 24)  - 2 - $diasMenos - $diasFeriados, 0); // El -2 es porque el dia inicial y el final se consideran en otra parte
					
				//	echo "diaResult = ((diaFin - diaIni) / 60/ 60/ 24) - 2 - diasMenos - diasFeriados = " . $diaResult . "<br />";
					
					if($diaResult < 0){
						
						$diaResult = 0;
					//	echo "diaResult = 0;<br />";
					}	
					
					
					
					
					
					
					$inicioJornadaMinutos = 8.5 * 60;
					
				//	echo "inicioJornadaMinutos = " . $inicioJornadaMinutos . "<br />";
					
					$finJornadaMinutos = 21 * 60;
					
				//	echo "finJornadaMinutos = " . $finJornadaMinutos . "<br />";
					
					
					$horasTrabajadas = $diaResult * ($finJornadaMinutos - $inicioJornadaMinutos)/60;
					
				//	echo "horasTrabajadas = " . $horasTrabajadas . "<br />";
					
					
					if($diaFinCalcFeriado == $diaIniCalcFeriado){
						$horaInicial = hora($row['hora']) * 60 + minutos($row['hora']);
					
					//	echo "horaInicial = " . $horaInicial . "<br />";
						
						$horasTrabajadasInicial = $horaInicial/60;
						
					//	echo "horasTrabajadasInicial = " . $horasTrabajadasInicial . "<br />";
						
						if ($row['fecha_cierre'] != 0){
							$horaFinal = hora($row['hora_cierre']) * 60 + minutos($row['hora_cierre']);
						//	echo "CERRADO<br />";
						}else{
							$horaFinal = hora($hora) * 60 + minutos($hora);
						//	echo "ABIERTO<br />";
						}
						
						
						
					//	echo "horaFinal = " . $horaFinal . "<br />";
						
						$horasTrabajadasFinal = $horaFinal/60;
					
					//	echo "horasTrabajadasFinal = " . $horasTrabajadasFinal . "<br />";
						
						$horasTrabajadas += ($horasTrabajadasFinal - $horasTrabajadasInicial);
						
					} else {
						$horaInicial = hora($row['hora']) * 60 + minutos($row['hora']);
					
					//	echo "horaInicial = " . $horaInicial . "<br />";
						
						$horasTrabajadasInicial = ($finJornadaMinutos - $horaInicial) / 60;
						
					//	echo "horasTrabajadasInicial = " . $horasTrabajadasInicial . "<br />";
						
						if ($row['fecha_cierre'] != 0){
						
							$horaFinal = hora($row['hora_cierre']) * 60 + minutos($row['hora_cierre']);
						//	echo "CERRADO<br />";
						}else{
							$horaFinal = hora($hora) * 60 + minutos($hora);
						//	echo $hora . "<br />";
						//	echo hora($hora) . "<br />";
						//	echo "ABIERTO<br />";
						}
						
					//	echo "horaFinal = " . $horaFinal . "<br />";
						
						$horasTrabajadasFinal = ($horaFinal - $inicioJornadaMinutos) / 60;
					
					//	echo "horasTrabajadasFinal = " . $horasTrabajadasFinal . "<br />";
						
						$horasTrabajadas += $horasTrabajadasInicial + $horasTrabajadasFinal;
					}
					
					
					
					
					
					
					
					
					
				//	echo "horasTrabajadas = " . $horasTrabajadas . "<br /><br /><br />";
					
					
					//print_r($fecha1);
					//echo "<br />";
					//print_r($horasTrabajadas);
					
					
					
//exit();					
					if ($row['fecha_cierre'] != 0){
						//echo hora($row['hora_cierre']) . ' ' . minutos($row['hora_cierre']) . ' ' . 0 . ' ' . mes($row['fecha_cierre']) . ' ' . dia($row['fecha_cierre']) . ' ' . anio($row['fecha_cierre']);
						$fecha2 = mktime(hora($row['hora_cierre']),minutos($row['hora_cierre']),0,mes($row['fecha_cierre']),dia($row['fecha_cierre']),anio($row['fecha_cierre']));
					}else{
						$fecha2 = mktime(hora($hora),minutos($hora),0,mes($fecha),dia($fecha),anio($fecha));
					}
						$diferencia = $fecha2-$fecha1;
						$diff['horas'] = $diferencia/60/60;
						$diff['minutos'] = $diferencia / 60;
						$diff['dias'] = $diff['horas']/24;
						$totalHoras = number_format($diff['horas'],0 , "," ,".");
					
					/* calculo de horas solucion */
					
					
					
					if ($row['fechaSolucion'] != ''){
					
					
						$fechaSolucion = mktime(hora($row['horaSolucion']),minutos($row['horaSolucion']),0,mes($row['fechaSolucion']),dia($row['fechaSolucion']),anio($row['fechaSolucion']));
					}else{
					
						$fechaSolucion = mktime(hora($hora),minutos($hora),0,mes($fecha),dia($fecha),anio($fecha));
					}
						$diferenciaSolucion = $fechaSolucion-$fecha1;
						$diffSolucion['horas'] = ($diferenciaSolucion/60/60);
						
						$diffSolucion['minutos'] = $diferenciaSolucion / 60;
						$diffSolucion['dias'] = $diffSolucion['horas']/24;
						//$totalHorasSolucion = number_format($diffSolucion['horas'],0 , "," ,".");	
						
						$totalHorasSolucion = $horasTrabajadas;// . ":" . $min;
					//	echo $totalHorasSolucion . "<br />";
						//exit();
						
					
					/*  fin */	
					//$cantidadTotal = $cantidadTotal +  $row['cantidad'];
					
					if($i % 2 == 0)
					$class = "class=columna";
					else
					$class = "class=columnab";
					
					if ($row['tipoNivel'] == '1')
					$nivel = "Primer Nivel";
					else
					$nivel = "Segundo Nivel";
					
					echo '<tr>					
					<td ' . $class . ' align="left">' . $row['id'] . '</td>
					<td ' . $class . ' align="left">' . $row['nombres'] . '&nbsp;' . $row['apellidos'] . '</td>
					<td ' . $class . ' align="left">' . $row['sucursal'] . '</td>
					<td ' . $class . ' align="left">' . $row['unidad'] . '</td>
					<td ' . $class . ' align="left">' . $row['NombreClasificacion'] . '</td>
					<td ' . $class . ' align="left">' . $row['NombreCategoria'] . '</td>
					<td ' . $class . ' align="left">' . $row['nombreSubCategoria'] . '</td>
					<td ' . $class . ' align="left">' . $row['nombreDescripcion'] . '</td>        
					<td ' . $class . ' align="left">' . calculaSemana($row['fecha']) . '</td>        
					<td ' . $class . ' align="left">' . calculaNombreMes($row['fecha']) . '</td>        
					<td ' . $class . ' align="left">' . calculaDigito($row['fecha']) . '</td>        
					<td ' . $class . ' align="left">' . separa_fecha($row['fecha']) . '&nbsp;' . separa_hora($row['hora']) . '</td> ';    
					
					if ($row['fecha_cierre'] != 0){  
						echo '<td ' . $class . '>' . separa_fecha($row['fecha_cierre']) . '&nbsp;' . separa_hora($row['hora_cierre']) . '</td>';  
					} else {
						echo '<td ' . $class . '>' . separa_fecha($fecha) . '&nbsp;' . separa_hora($hora) . '</td>';  
					}
					
					
					if ($row['fecha_cierre'] != 0){ 
						echo '<td ' . $class . ' align="left">' . calculaSemana($row['fecha_cierre']) . '</td>';  
					} else {
						echo '<td ' . $class . ' align="left">' . calculaSemana($fecha) . '</td>';  
					}
					if ($row['fecha_cierre'] != 0){
						echo '<td ' . $class . ' align="left">' . calculaNombreMes($row['fecha_cierre']) . '</td>'; 
					} else {
						echo '<td ' . $class . ' align="left">' . calculaNombreMes($fecha) . '</td>';  
					}
					if ($row['fecha_cierre'] != 0){ 
						echo '<td ' . $class . ' align="left">' . calculaDigito($row['fecha_cierre']) . '</td>';  
					} else {
						echo '<td ' . $class . ' align="left">' . calculaDigito($fecha) . '</td>';  
					}
					if ($row['fecha_cierre'] != 0){
						echo '<td ' . $class . ' align="left">' . separa_fecha($row['fecha_cierre']) . '&nbsp;' . separa_hora($row['hora_cierre']) . '</td>';  
					} else {
						echo '<td ' . $class . ' align="left">' . separa_fecha($fecha) . '&nbsp;' . separa_hora($hora) . '</td>'; 
					}
					
					
					echo '<td ' . $class . ' align="left">' . number_format($diffSolucion['horas']/24,2 , "," ,".") . '</td>';  
					if(strtoupper($row['estado']) == 'CERRADO'){
						if ($totalHorasSolucion > 0){
							echo '<td ' . $class . '>';
							//echo $totalHorasSolucion . '<br />';
							$horas = round($totalHorasSolucion, 2);
							$arr = explode(".", "" . $horas);
							//print_r($arr);
							if(count($arr) == 1){
								$arr[1] = 0;
							}
							$aj = '';
							$hor = ($totalHorasSolucion * 60);
							$hoFin = 0;
							while($hor - 60 >= 0){
								$hor = $hor - 60;							
								$hoFin++;
							}
							$mi = $hor;
							if($mi < 10){
								$mi = '0' . $mi;
							}
							$arr[1] = '0' . $arr[1];
							$aj = 'CON';
							$min = $arr[1] * 60 / 100;
							echo $hoFin . ':' . $mi;//$arr[0] . ":" . (int)$min;
							
							echo '&nbsp;Horas</td>';
						} else {
							echo '<td ' . $class . '>';
							//echo $totalHorasSolucion . '<br />';
							$horas = round($totalHorasSolucion, 2);
							//$horas = number_format($diffSolucion['minutos']/60,2 , "," ,".");
							$arr = explode(".", "" . $horas);
							//print_r($arr);
							if(count($arr) == 1){
								$arr[1] = 0;
							}
							if($arr[1] < 10){
								$arr[1] = $arr[1] * 10;
							}
							$min = $arr[1] * 60 / 100;
							echo $arr[0] . ":" . (int)$min;
							
							echo '</td>';
						}
					} else {
						echo '<td ' . $class . '>';
							echo "No Aplica";
							echo '</td>';
					}
					
					
					
					
					echo '<td ' . $class . ' align="left">' . number_format($diff['horas']/24,2 , "," ,".") . '</td>'; 
					if ($totalHoras > 0){
						echo '<td ' . $class . ' align="left">' . number_format($diff['horas'],2 , "," ,".") . '</td>';
					} else {
						echo '<td ' . $class . ' align="left">' . number_format($diff['minutos']/60,2 , "," ,".") . '</td>';
					}
					
					
					
					echo '<td ' . $class . ' align="left">' . $row['creadoPor'] . '</td>
						<td ' . $class . ' align="left">';
					if ($row['estado'] == 'Asignado'){
							echo $row['soporte'];
					} else {
						
							echo $row['solucion_dada_por'];
					}
					echo '</td>					
					<td ' . $class . ' align="left">' . $row['nombreGrupoResolutor'] . '</td>        					
					<td ' . $class . ' align="left">';
					if ($row['solucionadoPor'] != ''){
						echo $row['solucionadoPor'];
					}else {
						echo "Soluci&oacute;n pendiente";
					}
					echo '</td>
					
					<td ' . $class . ' align="left">';
						$grupoResolutor = "";
					if ($row['solucionadoPor'] != ''){
						$sqlGrupo = mysql_query("SELECT u.idGrupoResolutor ,g.nombreGrupoResolutor
												 FROM users u 
												 inner join gruporesolutor g on u.idGrupoResolutor = g.idGrupoResolutor 
													WHERE u.username= '".$row['solucionadoPor']."'",$conexion);
						if($row_grupo = mysql_fetch_array($sqlGrupo)){
							$grupoResolutor = $row_grupo['nombreGrupoResolutor'];
						}
					}
					if ($row['solucionadoPor'] == ''){
						echo "Soluci&oacute;n pendiente";

					}else {
						
						echo $grupoResolutor;
					}
					
					echo '</td>
					
					<td ' . $class . ' align="left">';
					if ($row['solucion_dada_por'] != ''){
						echo $row['solucion_dada_por'];
					}else {
						echo "Cierre pendiente";
					}
					echo '</td>';
					
					
					$nombreClasificacionCierre = "";
					if ($row['clasificacionCierre'] != ''){
						$clasificacionCierre = mysql_query("SELECT * FROM clasificacion WHERE idClasificacion= ".$row['clasificacionCierre']."",$conexion);
						if($row_problem = mysql_fetch_array($clasificacionCierre)){
							$nombreClasificacionCierre = $row_problem['NombreClasificacion'];
						}
					}
					
					echo '<td ' . $class . ' align="left">' . $nombreClasificacionCierre . '</td>';
					
					$nombreCategoriaCierre="";
					if ($row['categoriaCierre'] != ''){
						$categoriaCierre = mysql_query("SELECT * FROM categoria WHERE idCategoria= ".$row['categoriaCierre']."",$conexion);
						if($row_problem = mysql_fetch_array($categoriaCierre)){
							$nombreCategoriaCierre = $row_problem['NombreCategoria'];
						}
					}
					
					echo '<td ' . $class . ' align="left">' . $nombreCategoriaCierre . '</td>';
					
					
					$nombreSubCategoria="";
					if ($row['subcategoriaCierre'] != ''){
						$subCategoriaCierre = mysql_query("SELECT * FROM subcategoria WHERE idSubCategoria= ".$row['subcategoriaCierre']."",$conexion);
						if($row_problem = mysql_fetch_array($subCategoriaCierre)){
							$nombreSubCategoria = $row_problem['nombreSubCategoria'];
						}
					}
					
					
					echo '<td ' . $class . ' align="left">' . $nombreSubCategoria . '</td>';
					
					
					$nombreDescripcionCierre="";
					if ($row['descripcionCierre'] != ''){
						$descripcionCierre = mysql_query("SELECT * FROM descripcion WHERE idDescripcion= ".$row['descripcionCierre']."",$conexion);
						if($row_problem = mysql_fetch_array($descripcionCierre)){
							$nombreDescripcionCierre = $row_problem['nombreDescripcion'];
						}
					}
					
					
					echo '<td ' . $class . ' align="left">' . $nombreDescripcionCierre . '</td>  
					<td ' . $class . ' align="left">' . $row['estado'] . '</td>
					<td ' . $class . ' align="left">' . $row['tipo_solucion'] . '</td>
					<td ' . $class . ' align="left">' . $nivel . '</td>
					</tr>';	
		
					$i++;
				}
				if ($class == "columna"){
				$class = "columnab";
				}
				else{
				$class = "columna";
				}
						
				
				echo '<tr>
				<td colspan="20" align="left" class="' . $class . '">&nbsp;</td>
				</tr>		
		<tr /></table>';




}


