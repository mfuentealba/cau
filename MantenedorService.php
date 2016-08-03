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
 
 require_once("PerfilVO.php");
 require_once("GrupoResolutorVO.php");
 require_once("ClasificacionVO.php");
 require_once("CategoriaVO.php");
 require_once("SubCategoriaVO.php");
 require_once("DescripcionVO.php");
 
 
class MantenedorService {

	var $username = "cau2";
	var $password = "cau";
	var $server = "localhost";
	var $port = "3306";
	var $databasename = "cau";
	var $tablename = "perfiles";

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
	public function getAllPerfiles() {
		//echo "hfdfgjsfgskdf";
		$stmt = mysqli_prepare($this->connection, "SELECT * FROM perfiles");		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_execute($stmt);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$rows = array();
		//$rows = new stdClass();
		$row = new PerfilVO();
		mysqli_stmt_bind_result($stmt, $row->id, $row->perfil, $row->descripcion);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
		  //$rows->{$row->id} = $row;
	      //$row = new stdClass();
		  $row = new PerfilVO();
	      mysqli_stmt_bind_result($stmt, $row->id, $row->perfil, $row->descripcion);
	    }
		
		mysqli_stmt_free_result($stmt);
	    mysqli_close($this->connection);
		return $rows;
		//return $resp;
	}
	
	
	
	public function getAllGrupoResolutor() {
		//echo "hfdfgjsfgskdf";
		$stmt = mysqli_prepare($this->connection, "SELECT * FROM  GrupoResolutor");		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_execute($stmt);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$rows = array();
		//$rows = new stdClass();
		$row = new GrupoResolutorVO();
		mysqli_stmt_bind_result($stmt, $row->idGrupoResolutor, $row->nombreGrupoResolutor);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
		  //$rows->{$row->id} = $row;
	      //$row = new stdClass();
		  $row = new GrupoResolutorVO();
	      mysqli_stmt_bind_result($stmt, $row->idGrupoResolutor, $row->nombreGrupoResolutor);
	    }
		
		mysqli_stmt_free_result($stmt);
	    mysqli_close($this->connection);
		return $rows;
		//return $resp;
	}
	
	
	public function getAllClasificacion() {
		//echo "hfdfgjsfgskdf";
		$stmt = mysqli_prepare($this->connection, "SELECT * FROM  Clasificacion");		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_execute($stmt);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$rows = array();
		//$rows = new stdClass();
		$row = new ClasificacionVO();
		mysqli_stmt_bind_result($stmt, $row->idClasificacion, $row->NombreClasificacion);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
		  //$rows->{$row->id} = $row;
	      //$row = new stdClass();
		  $row = new ClasificacionVO();
	      mysqli_stmt_bind_result($stmt, $row->idClasificacion, $row->NombreClasificacion);
	    }
		
		mysqli_stmt_free_result($stmt);
	    mysqli_close($this->connection);
		return $rows;
		//return $resp;
	}
	
	public function getAllCategoria() {
		//echo "hfdfgjsfgskdf";
		$stmt = mysqli_prepare($this->connection, "SELECT * FROM  Categoria");		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_execute($stmt);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$rows = array();
		//$rows = new stdClass();
		$row = new CategoriaVO();
		mysqli_stmt_bind_result($stmt, $row->idCategoria, $row->NombreCategoria);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
		  //$rows->{$row->id} = $row;
	      //$row = new stdClass();
		  $row = new CategoriaVO();
	      mysqli_stmt_bind_result($stmt, $row->idCategoria, $row->NombreCategoria);
	    }
		
		mysqli_stmt_free_result($stmt);
	    mysqli_close($this->connection);
		return $rows;
		//return $resp;
	}
	
	
	public function getAllSubCategoria() {
		//echo "hfdfgjsfgskdf";
		$stmt = mysqli_prepare($this->connection, "SELECT * FROM  SubCategoria");		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_execute($stmt);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$rows = array();
		//$rows = new stdClass();
		$row = new SubCategoriaVO();
		mysqli_stmt_bind_result($stmt, $row->idSubCategoria, $row->nombreSubCategoria);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
		  //$rows->{$row->id} = $row;
	      //$row = new stdClass();
		  $row = new SubCategoriaVO();
	      mysqli_stmt_bind_result($stmt, $row->idSubCategoria, $row->nombreSubCategoria);
	    }
		
		mysqli_stmt_free_result($stmt);
	    mysqli_close($this->connection);
		return $rows;
		//return $resp;
	}
	
	
	public function getAllDescripcion() {
		//echo "hfdfgjsfgskdf";
		$stmt = mysqli_prepare($this->connection, "SELECT * FROM  Descripcion");		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_execute($stmt);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$rows = array();
		//$rows = new stdClass();
		$row = new DescripcionVO();
		mysqli_stmt_bind_result($stmt, $row->idDescripcion, $row->nombreDescripcion, $row->idFormaAtencion, $row->idTiempoSolucion);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
		  //$rows->{$row->id} = $row;
	      //$row = new stdClass();
		  $row = new DescripcionVO();
	      mysqli_stmt_bind_result($stmt, $row->idDescripcion, $row->nombreDescripcion, $row->idFormaAtencion, $row->idTiempoSolucion);
	    }
		
		mysqli_stmt_free_result($stmt);
	    mysqli_close($this->connection);
		return $rows;
		//return $resp;
	}
	
	
	
	
	
	
	
	public function getClasificacionCategorias($item) {//http://localhost:8080/weborb/services/weborb/cau/Controller.php?data={"arrCategorias":{"length":0,"sort":null,"source":[],"list":{"length":0,"uid":"E4766D9D-07DA-9BB5-33E7-522DAC7B42F1","source":[]},"filterFunction":null},"idClasificacion":1,"NombreClasificacion":"Incidencia"}&servicio=MantenedorService&accion=getClasificacionCategorias
		//echo "hfdfgjsfgskdf";
		$stmt = mysqli_prepare($this->connection, "SELECT idCategoria FROM  asocia_clasificacioncategoria WHERE idClasificacion = ?");		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_bind_param($stmt, 's', $item->idClasificacion);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_execute($stmt);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$rows = array();
		//$rows = new stdClass();
		//$row = new CategoriaVO();
		$row = new stdClass();
		mysqli_stmt_bind_result($stmt, $row->idCategoria);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
		  //$rows->{$row->id} = $row;
	      //$row = new stdClass();
		  $row = new stdClass();
	      mysqli_stmt_bind_result($stmt, $row->idCategoria);
	    }
		
		mysqli_stmt_free_result($stmt);
	    mysqli_close($this->connection);
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
	public function getSucursalesByID($itemID) {
		
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
	public function createClasificacion($item) {
		//return 0;

		$stmt = mysqli_prepare($this->connection, "INSERT INTO Clasificacion (NombreClasificacion) VALUES (?)");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		/*$item->sucursal = 'hola';
		$item->direccion = 'hola';*/
		
		mysqli_stmt_bind_param($stmt, 's', $item->NombreClasificacion);
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
		$item->id = $autoid;
		return $item;
	}
	
	public function createCategoria($item) {
		//return 0;

		$stmt = mysqli_prepare($this->connection, "INSERT INTO Categoria (NombreCategoria) VALUES (?)");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		/*$item->sucursal = 'hola';
		$item->direccion = 'hola';*/
		
		mysqli_stmt_bind_param($stmt, 's', $item->NombreCategoria);
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
		$item->id = $autoid;
		return $item;
	}
	
	public function createSubCategoria($item) {
		//return 0;

		$stmt = mysqli_prepare($this->connection, "INSERT INTO SubCategoria (nombreSubCategoria) VALUES (?)");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		/*$item->sucursal = 'hola';
		$item->direccion = 'hola';*/
		
		mysqli_stmt_bind_param($stmt, 's', $item->nombreSubCategoria);
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
		$item->id = $autoid;
		return $item;
	}
	
	public function createDescripcion($item) {
		//return 0;

		$stmt = mysqli_prepare($this->connection, "INSERT INTO Descripcion (nombreDescripcion, idFormaAtencion, idTiempoSolucion) VALUES (?, ?, ?)");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		/*$item->sucursal = 'hola';
		$item->direccion = 'hola';*/
		
		mysqli_stmt_bind_param($stmt, 'sii', $item->nombreDescripcion, $item->idFormaAtencion, $item->idTiempoSolucion);
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
		$item->id = $autoid;
		return $item;
	}

	/**
	 * Updates the passed item in the table.
	 *
	 * Add authorization or any logical checks for secure access to your data 
	 *
	 * @param stdClass $item
	 * @return void
	 */
	public function updateSucursales($item) {
	
		$stmt = mysqli_prepare($this->connection, "UPDATE $this->tablename SET sucursal=?, direccion=? WHERE id=?");		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_bind_param($stmt, 'ssi', $item->sucursal, $item->direccion, $item->id);		
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
	public function deleteSucursales($itemID) {
				
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
	public function getSucursales_paged($startIndex, $numItems) {
		
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
