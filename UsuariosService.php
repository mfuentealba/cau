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
 
 require_once("UserVO.php");
 require_once("NotificacionVO.php"); 
 
class UsuariosService {

	var $username = "cau3";
	var $password = "cau";
	var $server = "localhost";
	var $port = "3306";
	var $databasename = "cau2";
	var $tablename = "Users";

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
	public function getAllUsers() {
		//echo "hfdfgjsfgskdf";
		$stmt = mysqli_prepare($this->connection, "SELECT * FROM $this->tablename");		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		$row = new UserVO();
		
		mysqli_stmt_bind_result($stmt, $row->id, $row->perfil, $row->username, $row->email, $row->password, $row->nombre_completo, $row->tema, $row->tipoUsuario, $row->idGrupoResolutor, $row->estado);
		
	    while (mysqli_stmt_fetch($stmt)) {
			//$row->password = 
			$rows[] = $row;
			//$row = new stdClass();
			$row = new UserVO();
			mysqli_stmt_bind_result($stmt, $row->id, $row->perfil, $row->username, $row->email, $row->password, $row->nombre_completo, $row->tema, $row->tipoUsuario, $row->idGrupoResolutor, $row->estado);
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
	 
	public function getAllNotificaciones($soporte) {
		
		$stmt = mysqli_prepare($this->connection, "SELECT id, fecha, hora FROM reportes WHERE soporte=? AND estado <> 'Cerrado' AND notificacion = 'N'  order by fecha desc, hora desc");		
		$this->throwExceptionOnError();
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		mysqli_stmt_bind_param($stmt, 's', $soporte);
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$rows = array();
		$row = new stdclass();
		
		mysqli_stmt_bind_result($stmt, $row->id, $row->fecha, $row->hora);
		
		//$data = $row->id;
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
	    while (mysqli_stmt_fetch($stmt)) {
		  $not = new NotificacionVO();
		  $not->id = 'TicketVO|' . $row->id;
		  $not->tipo = 'TicketVO';
		  $not->mensaje = 'Se ha asignado el ticket N° ' . $row->id;
		  $not->fecha = $row->fecha . ' ' . $row->hora;
	      $rows[] = $not;
		  $row = new stdclass();
	      mysqli_stmt_bind_result($stmt, $row->id, $row->fecha, $row->hora);
	    }
		
		mysqli_stmt_free_result($stmt);
		
		$stmt = mysqli_prepare($this->connection, "SELECT idreporte, fecha, hora, origen FROM asignaciones WHERE destino=? AND estado = 'N'  order by fecha desc, hora desc");		
		$this->throwExceptionOnError();
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		mysqli_stmt_bind_param($stmt, 's', $soporte);
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$rows = array();
		$row = new stdclass();
		
		mysqli_stmt_bind_result($stmt, $row->id, $row->fecha, $row->hora, $row->origen);
		
		//$data = $row->id;
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
	    while (mysqli_stmt_fetch($stmt)) {
		  $not = new NotificacionVO();
		  $not->id = 'Reasignacion|' . $row->id;
		  $not->tipo = 'Reasignacion';
		  $not->mensaje = 'El usuario ' . $row->origen . ' ha reasignado el ticket N° ' . $row->id;
		  $not->fecha = $row->fecha . ' ' . $row->hora;
	      $rows[] = $not;
		  $row = new stdclass();
	      mysqli_stmt_bind_result($stmt, $row->id, $row->fecha, $row->hora);
	    }
		
		mysqli_stmt_free_result($stmt);
		
	    mysqli_close($this->connection);
		
		return $rows;
	}	 
	
	
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
	public function createUsers($row) {
		//return 0;

		$stmt = mysqli_prepare($this->connection, "INSERT INTO $this->tablename (perfil, username, email, password, nombre_completo, tema, tipoUsuario, idGrupoResolutor) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		/*$item->sucursal = 'hola';
		$item->direccion = 'hola';*/
		
		mysqli_stmt_bind_param($stmt, 'ssssssss',  $row->perfil, $row->username, $row->email, md5($row->password), $row->nombre_completo, $row->tema, $row->tipoUsuario, $row->idGrupoResolutor);
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
	public function updateUsers($item) {
	
		$stmt = mysqli_prepare($this->connection, "UPDATE $this->tablename SET perfil=?, username=?, email=?, password=?, nombre_completo=?, tema=?, tipoUsuario=?, idGrupoResolutor=?, estado=? WHERE id=?");		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_bind_param($stmt, 'sssssssssi', $item->perfil, $item->username, $item->email, $item->password, $item->nombre_completo, $item->tema, $item->tipoUsuario, $item->idGrupoResolutor, $item->estado, $item->id);		
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
	public function deleteUsers($itemID) {
				
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
	 
	 
	 
	public function login($user, $pass) {
		$pass = md5($pass);
		$stmt = mysqli_prepare($this->connection, "SELECT id, perfil, username, email, password, nombre_completo, tema, tipoUsuario, idGrupoResolutor FROM $this->tablename WHERE username = '" . $user . "' AND password = '" . $pass . "'");		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		$row = new UserVO();
		
		mysqli_stmt_bind_result($stmt, $row->id, $row->perfil, $row->username, $row->email, $row->password, $row->nombre_completo, $row->tema, $row->tipoUsuario, $row->idGrupoResolutor);
		
	    
		if(mysqli_stmt_fetch($stmt)) {
	      return $row;
		} else {
	      return null;
		}
	}
	 
	 
	 
	 
	 
	 
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
