<?php
$urlBase = "http://ratedata.gaincapital.com/";
$objMes = new stdclass();
$objMes->{"01"} = "enero";
$objMes->{"02"} = "febrero";
$objMes->{"03"} = "marzo";
$objMes->{"04"} = "abril";
$objMes->{"05"} = "mayo";
$objMes->{"06"} = "junio";
$objMes->{"07"} = "julio";
$objMes->{"08"} = "agosto";
$objMes->{"09"} = "septiembre";
$objMes->{"10"} = "octubre";
$objMes->{"11"} = "noviembre";
$objMes->{"12"} = "diciembre";


$con=mysqli_connect("localhost","forex","forex","forex");

if (mysqli_connect_errno()) {
	echo "Failed to connect to MySQL: " . mysqli_connect_error();
} else {
	echo "BIEN";
}


for($x = 2010; $x < 2017; $x++){
	$url = $urlBase . $x;
	$contenido = file_get_contents($url);
	//echo "El contenido de la URL es:n";
	//echo $contenido;
	$patrón = '/[0-9]{2}\s.{1,20}">/';
	preg_match_all($patrón, $contenido, $arr);
	print_r($arr);
	//exit();
	for($i = 0; $i < count($arr[0]); $i++){
		$mes = $objMes->{explode(" ", $arr[0][$i])[0]};
		echo $mes;
		mysqli_query($con, "CREATE TABLE IF NOT EXISTS `eurusd_der" . $x . "_" . $mes . "` (
							`id` int(11) NOT NULL,
							  `cDealable` varchar(30) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'D',
							  `CurrencyPair` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
							  `RateDateTime` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
							  `RateBid` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
							  `RateAsk` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
							  `CodPer` varchar(30) COLLATE utf8_spanish2_ci NOT NULL
							) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

							");
		//exit();
		$arr[0][$i] = $url . '/' . $arr[0][$i];
		$arr[0][$i] = substr($arr[0][$i], 0, count($arr[0][$i]) - 3);
		$arr[0][$i] = str_ireplace(" ", "%20", $arr[0][$i]);
		$contenido = file_get_contents($arr[0][$i]);
		//echo $contenido;
		$patrón = '/EUR_USD_.{1,20}zip"/';
		preg_match_all($patrón, $contenido, $arrZIP);
		sort($arrZIP[0]);
		print_r($arrZIP);
		
		for($j = 0; $j < count($arrZIP[0]); $j++){
			$arrZIP[0][$j] = substr($arrZIP[0][$j], 0, count($arrZIP[0][$j]) - 2);
			$nomFile = $arrZIP[0][$j];
			$arrZIP[0][$j] = $arr[0][$i] . '/' . $arrZIP[0][$j];
			$contenido = file_get_contents($arrZIP[0][$j]);
			//echo $contenido;
			file_put_contents ("EURUSD\\EURUSD" . $x . "_" . $mes . "_" . $nomFile, $contenido);	
			
			$newName = "EURUSD" . $x . "_" . $mes . "_" . $nomFile . ".csv";
			$zip = new ZipArchive;
			if($zip->open("EURUSD\\EURUSD" . $x . "_" . $mes . "_" . $nomFile) === TRUE) {
				
				$zip->renameIndex(0, $newName);
				$zip->close();
				$zip->open("EURUSD\\EURUSD" . $x . "_" . $mes . "_" . $nomFile);
				$zip->extractTo('EURUSD\\Procesados');
				$zip->close();
				echo 'ok';
			} else {
				echo 'failed';
			}
			//exit();
			
			echo "EURUSD\\Procesados\\" . $newName;
/*			$contenido = file_get_contents("EURUSD\\Procesados\\" . $newName);
			echo $contenido;
			$contenido = limpiaCadena($contenido);
			echo $contenido;
			file_put_contents ("EURUSD\\Procesados\\" . $newName, $contenido);
			
			
			$contenido = file_get_contents("EURUSD\\Procesados\\" . $newName);
			echo $contenido;
			$contenido = limpiaCadena2($contenido);
			echo $contenido;
			file_put_contents ("EURUSD\\Procesados\\" . $newName, $contenido);
	*/		
			
			$str = fnStrImport($newName, $x, $mes);
			echo $str;
			
			/*if($newName == "EURUSD2009_noviembre_EUR_USD_Week4.zip.csv"){
				
				$result = mysqli_query($con, "ALTER TABLE eurusd MODIFY COLUMN cDealable VARCHAR(1) after id");
			}*/
			//mysqli_query($con, "TRUNCATE TABLE eurusd_der");
			
			
	/*		mysqli_query($con, "CREATE TABLE IF NOT EXISTS `eurusd_der" . $x . "` (
`id` int(11) NOT NULL,
  `cDealable` varchar(30) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'D',
  `CurrencyPair` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `RateDateTime` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `RateBid` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `RateAsk` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `CodPer` varchar(30) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

");*/
			
			
			$result = mysqli_query($con, $str);
			if (mysqli_affected_rows($con) > 0) {
			  $message = "The data was successfully added!" . mysqli_affected_rows($con);
			} else {
			  $message = "The user update failed: " . mysqli_affected_rows($con);
			  $message .= mysqli_error($con); 
			}
			//exit();
		}
	}
	

}



/*	
$zip = new ZipArchive;
if($zip->open('EURUSD\\EURUSD2009_noviembre_EUR_USD_Week4.zip') === TRUE) {
    $zip->extractTo('EURUSD\\Procesados');
    $zip->close();
    echo 'ok';
} else {
    echo 'failed';
}

$str = "LOAD DATA LOCAL INFILE 'C:\\\\Users\\\\mfuentealba\\\\EURUSD\\\\Procesados\\\\EUR_USD_Week4.csv'
INTO TABLE eurusd
FIELDS TERMINATED BY ',' 
ENCLOSED BY '\"'
LINES TERMINATED BY '\\n';";
echo $str;



$result = mysqli_query($con, "select * from eurusd");


 while ($row = mysqli_fetch_row($result)) {
	printf("%s\n", $row[0]);
}

*/



/*
$result = mysqli_query($con, $str);

if (mysqli_affected_rows($con) > 0) {
  $message = "The data was successfully added!" . mysqli_affected_rows($con);
} else {
  $message = "The user update failed: " . mysqli_affected_rows($con);
  $message .= mysqli_error($con); 
};*/

//echo $message;
mysqli_close($con);


function limpiaCadena($cadena) {
	//return utf8_encode($cadena);
	return iconv("ISO-8859-1","ISO-8859-1//IGNORE",$cadena);
}


function limpiaCadena2($cadena) {
	 
	return $cadena;
}

function fnStrImport($str, $x, $mes){
	$str = "LOAD DATA LOCAL INFILE 'C:\\\\Users\\\\mario\\\\EURUSD\\\\Procesados\\\\" . $str . "'
INTO TABLE eurusd_der" . $x . "_" . $mes . "
CHARACTER SET utf8
FIELDS TERMINATED BY ',' 
ENCLOSED BY '\"'
LINES TERMINATED BY '\\n'
;";
	return $str;
}

/*(id, cDealable, CurrencyPair, RateDateTime, RateBid, RateAsk, @CodPer)
SET RateDateTime = SUBSTRING(@CodPer, 0, 7)*/

function throwExceptionOnError($link = null) {
	
	if(mysqli_error($link)) {
		$msg = mysqli_errno($link) . ": " . mysqli_error($link);
		return 'MySQL Error - '. $msg;
		throw new Exception('MySQL Error - '. $msg);
		
	} else {
		return '';
	}		
}
