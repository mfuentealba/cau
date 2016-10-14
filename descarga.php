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

/*
for($x = 2004; $x < 2017; $x++){
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
		//exit();
		$arr[0][$i] = $url . '/' . $arr[0][$i];
		$arr[0][$i] = substr($arr[0][$i], 0, count($arr[0][$i]) - 3);
		$arr[0][$i] = str_ireplace(" ", "%20", $arr[0][$i]);
		$contenido = file_get_contents($arr[0][$i]);
		//echo $contenido;
		$patrón = '/EUR_USD_.{1,20}zip"/';
		preg_match_all($patrón, $contenido, $arrZIP);
		print_r($arrZIP);
		
		for($j = 0; $j < count($arrZIP[0]); $j++){
			$arrZIP[0][$j] = substr($arrZIP[0][$j], 0, count($arrZIP[0][$j]) - 2);
			$nomFile = $arrZIP[0][$j];
			$arrZIP[0][$j] = $arr[0][$i] . '/' . $arrZIP[0][$j];
			$contenido = file_get_contents($arrZIP[0][$j]);
			//echo $contenido;
			file_put_contents ("EURUSD\\EURUSD" . $x . "_" . $mes . "_" . $nomFile, $contenido);			
			//exit();
		}
	}
	

}*/

/*
	LOAD DATA INFILE 'c:/tmp/discounts_2.csv'
INTO TABLE discounts
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(title,@expired_date,amount)
SET expired_date = STR_TO_DATE(@expired_date, '%m/%d/%Y');
	*/
$zip = new ZipArchive;
if($zip->open('EURUSD\\EURUSD2009_noviembre_EUR_USD_Week4.zip') === TRUE) {
    $zip->extractTo('EURUSD\\Procesados');
    $zip->close();
    echo 'ok';
} else {
    echo 'failed';
}

$username = "forex";
$password = "forex";
$server = "localhost";
$port = "3306";
$databasename = "forex";
$tablename = "EURUSD";	
$connection = mysqli_connect(
						$server,  
						$username,  
						$password, 
						$databasename,
						$port
					);

/*$stmt = mysqli_ prepare($connection, "LOAD DATA INFILE 'EURUSD\\Procesados\\EUR_USD_Week4.csv'
INTO TABLE eurusd
FIELDS TERMINATED BY ',' 
ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;");
*/
$str = "LOAD DATA INFILE 'C:\\\\Users\\\\mario\\\\EURUSD\\\\Procesados\\\\EUR_USD_Week4.csv'
INTO TABLE eurusd
FIELDS TERMINATED BY ',' 
ENCLOSED BY '\"'
LINES TERMINATED BY '\\n'
IGNORE 1 ROWS;";
echo $str;
if ($connection->query($str) === TRUE) {
    printf("Se creó con éxtio la tabla myCity.\n");
} else {
	printf("MAL.\n");
}		

/*$msg = throwExceptionOnError($connection);
if($msg != ''){
	echo $msg;
	exit();
}

mysqli_stmt_execute($stmt);

$msg = throwExceptionOnError($connection);
if($msg != ''){
	echo $msg;
	exit();
}
*/
function throwExceptionOnError($link = null) {
	
	if(mysqli_error($link)) {
		$msg = mysqli_errno($link) . ": " . mysqli_error($link);
		return 'MySQL Error - '. $msg;
		throw new Exception('MySQL Error - '. $msg);
		
	} else {
		return '';
	}		
}
