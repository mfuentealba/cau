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

	var $username = "cau3";
	var $password = "cau";
	var $server = "localhost";
	var $port = "3306";
	var $databasename = "cau2";
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
		mysqli_stmt_bind_result($stmt, $row->idClasificacion, $row->nombreClasificacion);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
		  //$rows->{$row->id} = $row;
	      //$row = new stdClass();
		  $row = new ClasificacionVO();
	      mysqli_stmt_bind_result($stmt, $row->idClasificacion, $row->nombreClasificacion);
	    }
		
		mysqli_stmt_free_result($stmt);
	    mysqli_close($this->connection);
		return $rows;
		//return $resp;
	}
	
	public function getAllCategoria() {
		//echo "hfdfgjsfgskdf";
		$stmt = mysqli_prepare($this->connection, "SELECT c.*, case when a.idcategoria is null then 'N' else 'S' end FROM  Categoria c left join asocia_clasificacioncategoria a on c.idcategoria=a.idcategoria");		
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
		mysqli_stmt_bind_result($stmt, $row->idCategoria, $row->nombreCategoria, $row->asociada);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
		  //$rows->{$row->id} = $row;
	      //$row = new stdClass();
		  $row = new CategoriaVO();
	      mysqli_stmt_bind_result($stmt, $row->idCategoria, $row->nombreCategoria, $row->asociada);
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
	
	
	public function getAllTiempoSolucion() {
		//echo "hfdfgjsfgskdf";
		$stmt = mysqli_prepare($this->connection, "SELECT * FROM  TiempoSolucion");		
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
		$row = new stdClass();
		mysqli_stmt_bind_result($stmt, $row->idTiempoSolucion, $row->descripcion);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
		  //$rows->{$row->id} = $row;
	      $row = new stdClass();
		  //$row = new DescripcionVO();
	      mysqli_stmt_bind_result($stmt, $row->idTiempoSolucion, $row->descripcion);
	    }
		
		mysqli_stmt_free_result($stmt);
	    mysqli_close($this->connection);
		return $rows;
		//return $resp;
	}
	
	
	public function getAllFormaAtencion() {
		//echo "hfdfgjsfgskdf";
		$stmt = mysqli_prepare($this->connection, "SELECT * FROM  FormaAtencion");		
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
		$row = new stdClass();
		//$row = new DescripcionVO();
		mysqli_stmt_bind_result($stmt, $row->idFormaAtencion, $row->descripcion);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
		  //$rows->{$row->id} = $row;
	      $row = new stdClass();
		  //$row = new DescripcionVO();
	      mysqli_stmt_bind_result($stmt, $row->idFormaAtencion, $row->descripcion);
	    }
		
		mysqli_stmt_free_result($stmt);
	    mysqli_close($this->connection);
		return $rows;
		//return $resp;
	}
	
	
	
	
	
	
	public function getClasificacionCategorias($id) {//http://localhost:8080/weborb/services/weborb/cau/Controller.php?data={"arrCategorias":{"length":0,"sort":null,"source":[],"list":{"length":0,"uid":"E4766D9D-07DA-9BB5-33E7-522DAC7B42F1","source":[]},"filterFunction":null},"idClasificacion":1,"nombreClasificacion":"Incidencia"}&servicio=MantenedorService&accion=getClasificacionCategorias
		//echo "hfdfgjsfgskdf";
		$stmt = mysqli_prepare($this->connection, "SELECT c.idCategoria, case when idClasificacion is null then 0 else 1 end sel 
FROM categoria c left join asocia_clasificacioncategoria asoc on c.idcategoria = asoc.idcategoria and asoc.idclasificacion = ?");		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_bind_param($stmt, 's', $id);		
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
		mysqli_stmt_bind_result($stmt, $row->idCategoria, $row->sel);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
		  //$rows->{$row->id} = $row;
	      //$row = new stdClass();
		  $row = new stdClass();
	      mysqli_stmt_bind_result($stmt, $row->idCategoria, $row->sel);
	    }
		
		mysqli_stmt_free_result($stmt);
	    mysqli_close($this->connection);
		return $rows;
		//return $resp;
	}
	
	
	
	//public function getCategoriaSubcategorias($arr) {//http://localhost:8080/weborb/services/weborb/cau/Controller.php?data={"arrCategorias":{"length":0,"sort":null,"source":[],"list":{"length":0,"uid":"E4766D9D-07DA-9BB5-33E7-522DAC7B42F1","source":[]},"filterFunction":null},"idClasificacion":1,"nombreClasificacion":"Incidencia"}&servicio=MantenedorService&accion=getClasificacionCategorias
	public function getCategoriaSubcategorias($id, $idClas) {//http://localhost:8080/weborb/services/weborb/cau/Controller.php?data={"arrCategorias":{"length":0,"sort":null,"source":[],"list":{"length":0,"uid":"E4766D9D-07DA-9BB5-33E7-522DAC7B42F1","source":[]},"filterFunction":null},"idClasificacion":1,"nombreClasificacion":"Incidencia"}&servicio=MantenedorService&accion=getClasificacionCategorias
		//echo "hfdfgjsfgskdf";
		
		/*$id = $arr[0]; 
		$idClas = $arr[1]; */
		//return " ca: " . $id . " cla: " . $idClas;
		$stmt = mysqli_prepare($this->connection, "SELECT c.idSubCategoria, case when idCategoria is null then 0 else 1 end sel 
FROM subcategoria c left join asocia_categoriasubcategoria asoc on c.idsubcategoria = asoc.idsubcategoria and asoc.idcategoria = " . $id . " and asoc.idClasificacion=" . $idClas . "");		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		/*mysqli_stmt_bind_param($stmt, 'ss', $id, $idclas);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}*/
		
		mysqli_stmt_execute($stmt);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$rows = array();
		//$rows = new stdClass();
		//$row = new CategoriaVO();
		$row = new stdClass();
		mysqli_stmt_bind_result($stmt, $row->idSubCategoria, $row->sel);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
		  //$rows->{$row->id} = $row;
	      //$row = new stdClass();
		  $row = new stdClass();
	      mysqli_stmt_bind_result($stmt, $row->idSubCategoria, $row->sel);
	    }
		
		mysqli_stmt_free_result($stmt);
	    mysqli_close($this->connection);
		return $rows;
		//return $resp;
	}
	
	public function getSubcategoriaProblemas($id, $idCat, $idClas) {//http://localhost:8080/weborb/services/weborb/cau/Controller.php?data={"arrCategorias":{"length":0,"sort":null,"source":[],"list":{"length":0,"uid":"E4766D9D-07DA-9BB5-33E7-522DAC7B42F1","source":[]},"filterFunction":null},"idClasificacion":1,"nombreClasificacion":"Incidencia"}&servicio=MantenedorService&accion=getClasificacionCategorias
		//echo "hfdfgjsfgskdf";
		
		/*return "SELECT c.idDescripcion, case when idSubCategoria is null then 0 else 1 end sel 
FROM descripcion c left join asocia_subcategoriadescripcion asoc on c.idDescripcion = asoc.idDescripcion and asoc.idsubcategoria = " . $id . " and asoc.idcategoria = " . $idCat . " and idclasificacion = " . $idClas;*/
		$stmt = mysqli_prepare($this->connection, "SELECT c.idDescripcion, case when idSubCategoria is null then 0 else 1 end sel 
FROM descripcion c left join asocia_subcategoriadescripcion asoc on c.idDescripcion = asoc.idDescripcion and asoc.idsubcategoria = " . $id . " and asoc.idcategoria = " . $idCat . " and idclasificacion = " . $idClas);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		/*mysqli_stmt_bind_param($stmt, 's', $id);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}*/
		
		mysqli_stmt_execute($stmt);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$rows = array();
		//$rows = new stdClass();
		//$row = new CategoriaVO();
		$row = new stdClass();
		mysqli_stmt_bind_result($stmt, $row->idDescripcion, $row->sel);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
		  //$rows->{$row->id} = $row;
	      //$row = new stdClass();
		  $row = new stdClass();
	      mysqli_stmt_bind_result($stmt, $row->idDescripcion, $row->sel);
	    }
		
		mysqli_stmt_free_result($stmt);
	    mysqli_close($this->connection);
		return $rows;
		//return $resp;
	}
	
	
	
	public function setClasificacionCategorias($idClas, $arr) {
	
		for($i = 0; $i < count($arr); $i++){
			$stmt = mysqli_prepare($this->connection, "INSERT INTO asocia_clasificacioncategoria (idClasificacion, idCategoria) VALUES (?,?)");
			$msg = $this->throwExceptionOnError();
			if($msg != ''){
				return $msg;
			}

			mysqli_stmt_bind_param($stmt, 'ii', $idClas, $arr[$i]);
			$msg = $this->throwExceptionOnError();
			if($msg != ''){
				return $msg;
			}

			mysqli_stmt_execute($stmt);		
			$msg = $this->throwExceptionOnError();
			if($msg != ''){
				return $msg;
			}

		}
		
		return $this->getClasificacionCategorias($idClas);	
		
	}
	
	public function setClasificacionCategorias2($arr, $idCat) {
	
		$stmt = mysqli_prepare($this->connection, "INSERT INTO asocia_clasificacioncategoria (idClasificacion, idCategoria) 
													SELECT idClasificacion, ?
													FROM clasificacion
													WHERE idClasificacion in (" . $arr . ")");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_bind_param($stmt, 'i', $idCat);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		
		/*for($i = 0; $i < count($arr); $i++){
			$stmt = mysqli_prepare($this->connection, "INSERT INTO asocia_clasificacioncategoria (idClasificacion, idCategoria) VALUES (?,?)");
			$msg = $this->throwExceptionOnError();
			if($msg != ''){
				return $msg;
			}

			mysqli_stmt_bind_param($stmt, 'ii', $arr[$i], $idCat);
			$msg = $this->throwExceptionOnError();
			if($msg != ''){
				return $msg;
			}

			mysqli_stmt_execute($stmt);		
			$msg = $this->throwExceptionOnError();
			if($msg != ''){
				return $msg;
			}

		}*/
		
		return '';	
		
	}
	
	
	
	public function setCategoriaSubCategoria($idClas, $idCat, $arr) {
	
		for($i = 0; $i < count($arr); $i++){
			$stmt = mysqli_prepare($this->connection, "INSERT INTO asocia_categoriasubcategoria (idClasificacion, idCategoria, idSubCategoria) VALUES (?,?,?)");
			$msg = $this->throwExceptionOnError();
			if($msg != ''){
				return $msg;
			}

			mysqli_stmt_bind_param($stmt, 'iii', $idClas, $idCat, $arr[$i]);
			$msg = $this->throwExceptionOnError();
			if($msg != ''){
				return $msg;
			}

			mysqli_stmt_execute($stmt);		
			$msg = $this->throwExceptionOnError();
			if($msg != ''){
				return $msg;
			}

		}
		
		return $this->getCategoriaSubcategorias($idCat, $idClas);	
		
	}
	
	public function setCategoriaSubCategorias2($idClas, $arr, $idSub) {
	
		
		/*$stmt = mysqli_prepare($this->connection, "INSERT INTO asocia_categoriasubcategoria (idClasificacion, idCategoria, idSubCategoria) 
												   SELECT idClasificacion, idCategoria, ? 
												   FROM asocia_clasificacioncategoria 
												   WHERE (idClasificacion = ? OR ? = 0) 
														AND idCategoria in (" . $arr . ")");*/
		$stmt = mysqli_prepare($this->connection, "INSERT INTO asocia_categoriasubcategoria (idClasificacion, idCategoria, idSubCategoria) 
												   SELECT idClasificacion, idCategoria, ? 
												   FROM asocia_clasificacioncategoria 
												   WHERE idCategoria in (" . $arr . ")");
		$msg = $this->throwExceptionOnError();
		
		return "INSERT INTO asocia_categoriasubcategoria (idClasificacion, idCategoria, idSubCategoria) 
												   SELECT idClasificacion, idCategoria, " . $idSub . " 
												   FROM asocia_clasificacioncategoria 
												   WHERE idCategoria in (" . $arr . ")";
		
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_bind_param($stmt, 'i', $idSub);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		/*for($i = 0; $i < count($arr); $i++){
			//$stmt = mysqli_prepare($this->connection, "INSERT INTO asocia_categoriasubcategoria (idClasificacion, idCategoria, idSubCategoria) VALUES (?,?,?)");
			$stmt = mysqli_prepare($this->connection, "INSERT INTO asocia_categoriasubcategoria (idClasificacion, idCategoria, idSubCategoria) 
														SELECT idClasificacion, ?, ? 
														FROM clasificacion 
														WHERE (idClasificacion = ? OR ? = 0)");
			$msg = $this->throwExceptionOnError();
			if($msg != ''){
				return $msg;
			}

			mysqli_stmt_bind_param($stmt, 'iiii', $arr[$i], $idSub, $idClas, $idClas);
			$msg = $this->throwExceptionOnError();
			if($msg != ''){
				return $msg;
			}

			mysqli_stmt_execute($stmt);		
			$msg = $this->throwExceptionOnError();
			if($msg != ''){
				return $msg;
			}

		}*/
		
		return '';	
		
	}
	
	
	
	public function setSubCategoriaProblema($idClas, $idCat, $idSub, $arr) {
	
		for($i = 0; $i < count($arr); $i++){
			$stmt = mysqli_prepare($this->connection, "INSERT INTO asocia_subcategoriadescripcion (idClasificacion, idCategoria, idSubCategoria, idDescripcion) VALUES (?,?,?,?)");
			$msg = $this->throwExceptionOnError();
			if($msg != ''){
				return $msg;
			}

			mysqli_stmt_bind_param($stmt, 'iiii', $idClas, $idCat, $idSub, $arr[$i]);
			$msg = $this->throwExceptionOnError();
			if($msg != ''){
				return $msg;
			}

			mysqli_stmt_execute($stmt);		
			$msg = $this->throwExceptionOnError();
			if($msg != ''){
				return $msg;
			}

		}
		
		return $this->getSubcategoriaProblemas($idSub, $idCat, $idClas);	
		
	}
	
	public function setSubCategoriaProblemas2($idClas, $idCat, $arr, $idProb) {
	
		
		/*$stmt = mysqli_prepare($this->connection, "INSERT INTO asocia_subcategoriadescripcion (idClasificacion, idCategoria, idSubCategoria, idDescripcion)
												   SELECT idClasificacion, idCategoria, idSubCategoria, ? 
												   FROM asocia_categoriasubcategoria 
												   WHERE (idClasificacion = ? OR ? = 0) 
														AND (idCategoria = ? OR ? = 0)
														AND idSubcategoria in (" . $arr . ")");*/
		$stmt = mysqli_prepare($this->connection, "INSERT INTO asocia_subcategoriadescripcion (idClasificacion, idCategoria, idSubCategoria, idDescripcion)
												   SELECT idClasificacion, idCategoria, idSubCategoria, ? 
												   FROM asocia_categoriasubcategoria 
												   WHERE idSubcategoria in (" . $arr . ")");												
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		//mysqli_stmt_bind_param($stmt, 'iiiii', $idProb, $idClas, $idClas, $idCat, $idCat);
		mysqli_stmt_bind_param($stmt, 'i', $idProb);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
/*		
		for($i = 0; $i < count($arr); $i++){
			//$stmt = mysqli_prepare($this->connection, "INSERT INTO asocia_subcategoriadescripcion (idClasificacion, idCategoria, idSubCategoria, idDescripcion) VALUES (?,?,?,?)");
			$stmt = mysqli_prepare($this->connection, "INSERT INTO asocia_subcategoriadescripcion (idClasificacion, idCategoria, idSubCategoria, idDescripcion) SELECT idClasificacion, idCategoria, ?, ? FROM asocia_clasificacioncategoria WHERE (idClasificacion = ? OR ? = 0) AND (idCategoria = ? OR ? = 0)");
			$msg = $this->throwExceptionOnError();
			if($msg != ''){
				return $msg;
			}

			mysqli_stmt_bind_param($stmt, 'iiiiii', $arr[$i], $idProb, $idClas, $idClas, $idCat, $idCat);
			$msg = $this->throwExceptionOnError();
			if($msg != ''){
				return $msg;
			}

			mysqli_stmt_execute($stmt);		
			$msg = $this->throwExceptionOnError();
			if($msg != ''){
				return $msg;
			}

		}
	*/	
		return '';	
		
	}
	
	
	
	
	
	
	public function removeClasificacionCategorias($id, $arr) {
	
		for($i = 0; $i < count($arr); $i++){
			$stmt = mysqli_prepare($this->connection, "DELETE FROM asocia_clasificacioncategoria WHERE idClasificacion = ? AND idCategoria = ?");
			$msg = $this->throwExceptionOnError();
			if($msg != ''){
				return $msg;
			}

			mysqli_stmt_bind_param($stmt, 'ii', $id, $arr[$i]);
			$msg = $this->throwExceptionOnError();
			if($msg != ''){
				return $msg;
			}

			mysqli_stmt_execute($stmt);		
			$msg = $this->throwExceptionOnError();
			if($msg != ''){
				return $msg;
			}

		}
		
		return $this->getClasificacionCategorias($id);	
		
	}
	
	public function removeCategoriaSubcategoria($idCla, $idCat, $arr) {
		$idSub = implode(',', $arr);
		$stmt = mysqli_prepare($this->connection, "DELETE FROM asocia_categoriaSubcategoria WHERE idClasificacion = ? AND idCategoria = ? AND idSubcategoria in (" . $idSub . ")");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_bind_param($stmt, 'ii', $idCla, $idCat);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		return $this->getCategoriaSubcategorias($idCat, $idCla);	
		
	}
	
	public function removeSubcategoriaProblema($idCla, $idCat, $idSub, $arr) {
		$idPro = implode(',', $arr);
		$stmt = mysqli_prepare($this->connection, "DELETE FROM asocia_subcategoriaDescripcion WHERE idClasificacion = ? AND idCategoria = ? AND idSubcategoria=? and idDescripcion in (" . $idPro . ")");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_bind_param($stmt, 'iii', $idCla, $idCat, $idSub);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		//	return $idPro;
		return $this->getSubCategoriaProblemas($idSub, $idCat, $idCla);	
		
	}
	
	public function saveClasificacion($row) {
		//return 0;

		$stmt = mysqli_prepare($this->connection, "INSERT INTO Clasificacion (nombreClasificacion) VALUES (?)");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		/*$item->sucursal = 'hola';
		$item->direccion = 'hola';*/
		
		mysqli_stmt_bind_param($stmt, 's', $row);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg . " ----" . $row;
		}

		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg . " ----" . $row;
		}

		$autoid = mysqli_stmt_insert_id($stmt);

		mysqli_stmt_free_result($stmt);		
		mysqli_close($this->connection);
		$row2 = new ClasificacionVO();
		$row2->idClasificacion = $autoid;
		$row2->nombreClasificacion = $row;
		return $row2;
	}
	
	public function saveCategoria($row, $arr) {
		//return 0;

		$stmt = mysqli_prepare($this->connection, "INSERT INTO Categoria (nombreCategoria) VALUES (?)");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		/*$item->sucursal = 'hola';
		$item->direccion = 'hola';*/
		
		mysqli_stmt_bind_param($stmt, 's', $row);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg . " ----" . $row;
		}

		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg . " ----" . $row;
		}

		$autoid = mysqli_stmt_insert_id($stmt);
		
		mysqli_stmt_free_result($stmt);	
		//return count($arr) . ' ' . $autoid;
		if($arr != '' && isset($autoid)){
			
			$val = $this->setClasificacionCategorias2($arr, $autoid);
			
		}
		

		mysqli_stmt_free_result($stmt);		
		mysqli_close($this->connection);
		
		if($val != ''){
			return $val;
			
		}
		
		$row2 = new CategoriaVO();
		$row2->idCategoria = $autoid;
		$row2->nombreCategoria = $row;
		return $row2;
	}
	
	
	public function saveSubcategoria($row, $idClas, $arr) {
		//return 0;

		$stmt = mysqli_prepare($this->connection, "INSERT INTO subcategoria (nombresubcategoria) VALUES (?)");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_bind_param($stmt, 's', $row);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg . " ----" . $row;
		}

		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg . " ----" . $row;
		}

		$autoid = mysqli_stmt_insert_id($stmt);

		if($arr != '' && isset($autoid)){
			$val = $this->setCategoriaSubcategorias2($idClas, $arr, $autoid);
			
		}
		
		mysqli_stmt_free_result($stmt);		
		mysqli_close($this->connection);
		
		if($val != ''){
			return $val;
			
		}
		
		
		$row2 = new SubCategoriaVO();
		$row2->idSubCategoria = $autoid;
		$row2->nombreSubCategoria = $row;
		return $row2;
	}
	
	
	public function saveProblemas($row, $idFormaAtencion, $idTiempoSolucion, $idClas, $idCat, $arr) {
		//return 0;

		$stmt = mysqli_prepare($this->connection, "INSERT INTO descripcion (nombreDescripcion, idFormaAtencion, idTiempoSolucion) VALUES (?,0,?)");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		
		mysqli_stmt_bind_param($stmt, 'si', $row, $idTiempoSolucion);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg . " ----" . $row;
		}

		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg . " ----" . $row;
		}

		$autoid = mysqli_stmt_insert_id($stmt);
		
		
		if(count($arr) > 0 && isset($autoid)){
			$val = $this->setSubcategoriaProblemas2($idClas, $idCat, $arr, $autoid);
			
		}

		mysqli_stmt_free_result($stmt);		
		mysqli_close($this->connection);
		
		if($val != ''){
			return $val;
			
		}
		
		$row2 = new DescripcionVO();
		$row2->idDescripcion = $autoid;
		$row2->nombreDescripcion = $row;
		$row2->idFormaAtencion = $idFormaAtencion; 
		$row2->idTiempoSolucion = $idTiempoSolucion;
		return $row2;
	}
	
	
	public function updateClasificacion($item) {
	
		$stmt = mysqli_prepare($this->connection, "UPDATE Clasificacion SET nombreClasificacion=? WHERE idClasificacion=?");		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_bind_param($stmt, 'si', $item[1], $item[0]);
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
		$row2 = new ClasificacionVO();
		$row2->idClasificacion = $item[0];
		$row2->nombreClasificacion = $item[1];
		return $row2;
	}
	
	public function updateCategoria($item) {
	
		$stmt = mysqli_prepare($this->connection, "UPDATE Categoria SET nombreCategoria=? WHERE idCategoria=?");		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_bind_param($stmt, 'si', $item[1], $item[0]);
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
		$row2 = new CategoriaVO();
		$row2->idCategoria = $item[0];
		$row2->nombreCategoria = $item[1];
		return $row2;
	}
	
	public function updateSubCategoria($item) {
	
		$stmt = mysqli_prepare($this->connection, "UPDATE SubCategoria SET nombreSubCategoria=? WHERE idSubCategoria=?");		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_bind_param($stmt, 'si', $item[1], $item[0]);
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
		$row2 = new SubCategoriaVO();
		$row2->idSubCategoria = $item[0];
		$row2->nombreSubCategoria = $item[1];
		return $row2;
	}
	
	public function updateProblema($item) {
	
		$stmt = mysqli_prepare($this->connection, "UPDATE Descripcion SET nombreDescripcion=?, idFormaAtencion=?, idTiempoSolucion=? WHERE idDescripcion=?");		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_bind_param($stmt, 'siii', $item[1], $item[2], $item[3], $item[0]);
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
		$row2 = new DescripcionVO();
		$row2->idDescripcion = $item[0];
		$row2->nombreDescripcion = $item[1];
		$row2->idFormaAtencion = $item[2];
		$row2->idTiempoSolucion = $item[3];
		return $row2;
	}
	
	
	public function deleteClasificacion($itemID) {
		$stmt = mysqli_prepare($this->connection, "DELETE FROM asocia_subcategoriadescripcion WHERE idClasificacion=?");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_bind_param($stmt, 'i', $itemID);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$stmt = mysqli_prepare($this->connection, "DELETE FROM asocia_categoriasubcategoria WHERE idClasificacion=?");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_bind_param($stmt, 'i', $itemID);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		
		$stmt = mysqli_prepare($this->connection, "DELETE FROM asocia_clasificacioncategoria WHERE idClasificacion=?");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_bind_param($stmt, 'i', $itemID);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
				
		$stmt = mysqli_prepare($this->connection, "DELETE FROM `cau`.`clasificacion` WHERE `clasificacion`.`idClasificacion` = ?");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_bind_param($stmt, 'i', $itemID);
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
		return $itemID;
	}
	
	
	public function deleteCategoria($itemID) {
		$stmt = mysqli_prepare($this->connection, "DELETE FROM asocia_subcategoriadescripcion WHERE idCategoria=?");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_bind_param($stmt, 'i', $itemID);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$stmt = mysqli_prepare($this->connection, "DELETE FROM asocia_categoriasubcategoria WHERE idCategoria=?");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_bind_param($stmt, 'i', $itemID);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}


		$stmt = mysqli_prepare($this->connection, "DELETE FROM asocia_clasificacioncategoria WHERE idCategoria=?");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_bind_param($stmt, 'i', $itemID);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
				
		$stmt = mysqli_prepare($this->connection, "DELETE FROM `cau`.`categoria` WHERE idCategoria = ?");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_bind_param($stmt, 'i', $itemID);
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
		return $itemID;
	}
	
	public function deleteSubCategoria($itemID) {
		$stmt = mysqli_prepare($this->connection, "DELETE FROM asocia_subcategoriadescripcion WHERE idSubCategoria=?");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_bind_param($stmt, 'i', $itemID);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$stmt = mysqli_prepare($this->connection, "DELETE FROM asocia_categoriasubcategoria WHERE idSubCategoria=?");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_bind_param($stmt, 'i', $itemID);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
						
		$stmt = mysqli_prepare($this->connection, "DELETE FROM `cau`.`subcategoria` WHERE idSubCategoria = ?");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_bind_param($stmt, 'i', $itemID);
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
		return $itemID;
	}
	
	public function deleteProblemas($itemID) {
		$stmt = mysqli_prepare($this->connection, "DELETE FROM asocia_subcategoriadescripcion WHERE idDescripcion=?");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_bind_param($stmt, 'i', $itemID);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
				
		$stmt = mysqli_prepare($this->connection, "DELETE FROM `cau`.`descripcion` WHERE idDescripcion = ?");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_bind_param($stmt, 'i', $itemID);
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
		return $itemID;
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

		$stmt = mysqli_prepare($this->connection, "INSERT INTO Clasificacion (nombreClasificacion) VALUES (?)");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		/*$item->sucursal = 'hola';
		$item->direccion = 'hola';*/
		
		mysqli_stmt_bind_param($stmt, 's', $item->nombreClasificacion);
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

		$stmt = mysqli_prepare($this->connection, "INSERT INTO Categoria (nombreCategoria) VALUES (?)");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		/*$item->sucursal = 'hola';
		$item->direccion = 'hola';*/
		
		mysqli_stmt_bind_param($stmt, 's', $item->nombreCategoria);
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
