<?php

/**
 *  README for sample service
 *
 *  This generated sample service contains functions that illustrate typical service operations.
 *  Use these functions as a starting point for creating your own service implementation. Modify the 
 *  function signatures, references to the database, and implementation according to your needs. 
 *  Delete the functions that you do not use.
 *
 *  Save your changes and return to Flash Builder. In Flash Builder Data/Services View, refresh 
 *  the service. Then drag service operations onto user interface components in Design View. For 
 *  example, drag the getAllItems() operation onto a DataGrid.
 *  
 *  This code is for prototyping only.
 *  
 *  Authenticate the user prior to allowing them to call these methods. You can find more 
 *  information at http://www.adobe.com/go/flex_security
 *
 */
 
 require_once("TicketVO.php");
 
class TicketService {

	var $username = "cau2";
	var $password = "cau";
	var $server = "localhost";
	var $port = "3306";
	var $databasename = "cau";
	var $tablename = "Reportes";

	var $connection;

	/**
	 * The constructor initializes the connection to database. Everytime a request is 
	 * received by Zend AMF, an instance of the service class is created and then the
	 * requested method is invoked.
	 */
	public function __construct() {
	  	$this->connection = mysqli_connect(
	  							$this->server,  
	  							$this->username,  
	  							$this->password, 
	  							$this->databasename,
	  							$this->port
	  						);

		$this->throwExceptionOnError($this->connection);
	}

	/**
	 * Returns all the rows from the table.
	 *
	 * Add authroization or any logical checks for secure access to your data 
	 *
	 * @return array
	 */
	public function getAllTickets() {
		//echo "hfdfgjsfgskdf";
		$stmt = mysqli_prepare($this->connection, "SELECT * FROM $this->tablename");		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		$row = new UserVO();
		
		mysqli_stmt_bind_result($stmt, $row->id, $row->perfil, $row->username, $row->email, $row->password, $row->nombre_completo, $row->tema, $row->tipoUsuario, $row->idGrupoResolutor);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      //$row = new stdClass();
		  $row = new UserVO();
	      mysqli_stmt_bind_result($stmt, $row->id, $row->perfil, $row->username, $row->email, $row->password, $row->nombre_completo, $row->tema, $row->tipoUsuario, $row->idGrupoResolutor);
	    }
		
		mysqli_stmt_free_result($stmt);
	    mysqli_close($this->connection);
		/*$prueba = new ClienteVO();
		$prueba->id = 10;
		$prueba->direccion = 'hola';
		$prueba->sucursal = 'hola';
		return array($prueba);*/
		return $rows;
		//return $resp;
	}

	/**
	 * Returns the item corresponding to the value specified for the primary key.
	 *
	 * Add authorization or any logical checks for secure access to your data 
	 *
	 * 
	 * @return stdClass
	 */
	public function getUsersByID($itemID) {
		
		$stmt = mysqli_prepare($this->connection, "SELECT * FROM $this->tablename where id=?");
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_param($stmt, 'i', $itemID);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_result($stmt, $row->id, $row->sucursal, $row->direccion);
		
		if(mysqli_stmt_fetch($stmt)) {
	      return $row;
		} else {
	      return null;
		}
	}

	/**
	 * Returns the item corresponding to the value specified for the primary key.
	 *
	 * Add authorization or any logical checks for secure access to your data 
	 *
	 * 
	 * @return stdClass
	 */
	public function createTicket($row) {
		//return $row;
		
		$stmt = mysqli_prepare($this->connection, "INSERT INTO num_reporte (id) VALUES (null)");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$autoid = mysqli_stmt_insert_id($stmt);
		
		$stmt = mysqli_prepare($this->connection, "INSERT INTO $this->tablename (id,  tipo_solucion,  problema,  sub_problema,  rotulo,  dir_ip,  cliente_rut,  fecha,  hora,  soporte,  estado,  descripcion,  hora_cierre,  fecha_cierre,  asignado_por,  comentario_cierre,  problema_e,  sub_problema_e,  solucion_dada_por,  idClasificacion,  idDescripcion,  tiempoSolucion,  administracionRemota,  tipoNivel,  reporteSolucionado,  fechaSolucion,  horaSolucion,  solucionadoPor,  clasificacionCierre,  categoriaCierre,  subcategoriaCierre,  descripcionCierre,  creadoPor) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		/*$item->sucursal = 'hola';
		$item->direccion = 'hola';*/
		$row->id = $autoid;
		mysqli_stmt_bind_param($stmt, 'ssiisssisssssississiiiiiisssiiiis',  $row-> id, $row->tipo_solucion, $row->problema, $row->sub_problema, $row->rotulo, $row->dir_ip, $row->cliente_rut, $row->fecha, $row->hora, $row->soporte, $row->estado, $row->descripcion, $row->hora_cierre, $row->fecha_cierre, $row->asignado_por, $row->comentario_cierre, $row->problema_e, $row->sub_problema_e, $row->solucion_dada_por, $row->idClasificacion, $row->idDescripcion, $row->tiempoSolucion, $row->administracionRemota, $row->tipoNivel, $row->reporteSolucionado, $row->fechaSolucion, $row->horaSolucion, $row->solucionadoPor, $row->clasificacionCierre, $row->categoriaCierre, $row->subcategoriaCierre, $row->descripcionCierre, $row->creadoPor);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		$autoid = mysqli_stmt_insert_id($stmt);

		mysqli_stmt_free_result($stmt);		
		mysqli_close($this->connection);
		$row->id = $autoid;
		return $row;
	}

	/**
	 * Updates the passed item in the table.
	 *
	 * Add authorization or any logical checks for secure access to your data 
	 *
	 * @param stdClass $item
	 * @return void
	 */
	public function updateTickets($item) {
	
		$stmt = mysqli_prepare($this->connection, "UPDATE $this->tablename SET perfil=?, username=?, email=?, password=?, nombre_completo=?, tema=?, tipoUsuario=?, idGrupoResolutor=? WHERE id=?");		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_bind_param($stmt, 'ssssssssi', $item->perfil, $item->username, $item->email, $item->password, $item->nombre_completo, $item->tema, $item->tipoUsuario, $item->idGrupoResolutor, $item->id);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		
		mysqli_stmt_free_result($stmt);		
		mysqli_close($this->connection);
		return $item;
	}

	/**
	 * Deletes the item corresponding to the passed primary key value from 
	 * the table.
	 *
	 * Add authorization or any logical checks for secure access to your data 
	 *
	 * 
	 * @return void
	 */
	public function deleteTickets($itemID) {
				
		$stmt = mysqli_prepare($this->connection, "DELETE FROM $this->tablename WHERE id = ?");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_bind_param($stmt, 'i', $itemID);
		mysqli_stmt_execute($stmt);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_free_result($stmt);		
		mysqli_close($this->connection);
		return $itemID;
	}


	/**
	 * Returns the number of rows in the table.
	 *
	 * Add authorization or any logical checks for secure access to your data 
	 *
	 * 
	 */
	public function count() {
		$stmt = mysqli_prepare($this->connection, "SELECT COUNT(*) AS COUNT FROM $this->tablename");
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_result($stmt, $rec_count);
		$this->throwExceptionOnError();
		
		mysqli_stmt_fetch($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_free_result($stmt);
		mysqli_close($this->connection);
		
		return $rec_count;
	}


	/**
	 * Returns $numItems rows starting from the $startIndex row from the 
	 * table.
	 *
	 * Add authorization or any logical checks for secure access to your data 
	 *
	 * 
	 * 
	 * @return array
	 */
	public function getClientes_paged($startIndex, $numItems) {
		
		$stmt = mysqli_prepare($this->connection, "SELECT * FROM $this->tablename LIMIT ?, ?");
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_param($stmt, 'ii', $startIndex, $numItems);
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, $row->id, $row->sucursal, $row->direccion);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      mysqli_stmt_bind_result($stmt, $row->id, $row->sucursal, $row->direccion);
	    }
		
		mysqli_stmt_free_result($stmt);		
		mysqli_close($this->connection);
		
		return $rows;
	}
	
	
	/**
	 * Utility function to throw an exception if an error occurs 
	 * while running a mysql command.
	 */
	private function throwExceptionOnError($link = null) {
		if($link == null) {
			$link = $this->connection;
		}
		if(mysqli_error($link)) {
			$msg = mysqli_errno($link) . ": " . mysqli_error($link);
			return 'MySQL Error - '. $msg;
			throw new Exception('MySQL Error - '. $msg);
			
		} else {
			return '';
		}		
	}
}

?>
