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
 require_once("ComentarioVO.php");
 require_once("phpmailer.php");
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
		$this->connectionAux = mysqli_connect(
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
		$stmt = mysqli_prepare($this->connection, "SELECT `id`, `tipo_solucion`, `problema`, `sub_problema`, `rotulo`, `dir_ip`, `cliente_rut`, `fecha`, `hora`, `soporte`, `estado`, `descripcion`, `hora_cierre`, `fecha_cierre`, `asignado_por`, `comentario_cierre`, `problema_e`, `sub_problema_e`, `solucion_dada_por`, `idClasificacion`, `idDescripcion`, `tiempoSolucion`, `administracionRemota`, `tipoNivel`, `reporteSolucionado`, `fechaSolucion`, `horaSolucion`, `solucionadoPor`, `clasificacionCierre`, `categoriaCierre`, `subcategoriaCierre`, `descripcionCierre`, `creadoPor` FROM $this->tablename order by fecha desc limit 1,10");		
		$this->throwExceptionOnError();
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$rows = array();
		$row = new TicketVO();
		
		mysqli_stmt_bind_result($stmt, $row-> id, $row->tipo_solucion, $row->problema, $row->sub_problema, $row->rotulo, $row->dir_ip, $row->cliente_rut, $row->fecha, $row->hora, $row->soporte, $row->estado, $row->descripcion, $row->hora_cierre, $row->fecha_cierre, $row->asignado_por, $row->comentario_cierre, $row->problema_e, $row->sub_problema_e, $row->solucion_dada_por, $row->idClasificacion, $row->idDescripcion, $row->tiempoSolucion, $row->administracionRemota, $row->tipoNivel, $row->reporteSolucionado, $row->fechaSolucion, $row->horaSolucion, $row->solucionadoPor, $row->clasificacionCierre, $row->categoriaCierre, $row->subcategoriaCierre, $row->descripcionCierre, $row->creadoPor);
		
		//$data = $row->id;
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
		  //return $data;//$row;
	      //$row = new stdClass();
		  $row = new TicketVO();
	      mysqli_stmt_bind_result($stmt, $row-> id, $row->tipo_solucion, $row->problema, $row->sub_problema, $row->rotulo, $row->dir_ip, $row->cliente_rut, $row->fecha, $row->hora, $row->soporte, $row->estado, $row->descripcion, $row->hora_cierre, $row->fecha_cierre, $row->asignado_por, $row->comentario_cierre, $row->problema_e, $row->sub_problema_e, $row->solucion_dada_por, $row->idClasificacion, $row->idDescripcion, $row->tiempoSolucion, $row->administracionRemota, $row->tipoNivel, $row->reporteSolucionado, $row->fechaSolucion, $row->horaSolucion, $row->solucionadoPor, $row->clasificacionCierre, $row->categoriaCierre, $row->subcategoriaCierre, $row->descripcionCierre, $row->creadoPor);
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
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
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
		
		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$autoid = mysqli_stmt_insert_id($stmt);
		//return $autoid;
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

		//$autoid = mysqli_stmt_insert_id($stmt);

		mysqli_stmt_free_result($stmt);		
		mysqli_close($this->connection);
		$row->id = $autoid;
		
		$stmt = mysqli_prepare($this->connection, "INSERT INTO reportes_grabados (id, soporte, reporte, comentarios, fecha, hora) VALUES (null, ?, ?, ?, ?, ?)");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		$msg = "Ticket ssignado a " . $row->soporte;
		mysqli_stmt_bind_param($stmt, 'sisis',  $row->soporte, $autoid, $msg, $row->fecha, $row->hora);
		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
//return $stmt;
		//$autoid = mysqli_stmt_insert_id($stmt);

		mysqli_stmt_free_result($stmt);		
		mysqli_close($this->connection);
		$row->id = $autoid;
		
		
		$cuerpoMensaje = "====================================================== <br />";
		$cuerpoMensaje.= "     Centro Atención de Usuarios - Notificacion de Nuevo Ticket     <br />";
		$cuerpoMensaje.= "====================================================== <br />";
		$cuerpoMensaje.= " <br />";
		$cuerpoMensaje.= " Estimado(a) Usuario(a) :<br />";
		$cuerpoMensaje.= " <br /> <br />";
		$cuerpoMensaje.= " Se ha generado un nuevo ticket en nuestro Sistema de Reportes.         <br />";
		$cuerpoMensaje.= " Nº de Ticket : ".$autoid.".<br />";
		$cuerpoMensaje.= " Para conocer a mas detalles acerca de este ticket, y su estado actual  <br />";
		$cuerpoMensaje.= " de progreso, agradeceremos contactarse con nuestros operadores.      <br />";
		$cuerpoMensaje.= " <br />";
		$cuerpoMensaje.= " Atte: <br />";
		$cuerpoMensaje.= " <br />";
		
		
		$this->fnCorreo('', $cuerpoMensaje);
		
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

	public function reasignarTicket($soporte, $id, $comentario) {
	
		$stmt = mysqli_prepare($this->connection, "UPDATE $this->tablename SET soporte=? WHERE id=?");		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_bind_param($stmt, 'ss', $soporte, $id);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$this->saveComentarios($comentario);
		
		$stmt = mysqli_prepare($this->connection, "SELECT * FROM $this->tablename WHERE id = " . $id);		
		$this->throwExceptionOnError();
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$this->throwExceptionOnError();
		
		$row = new TicketVO();
		
		mysqli_stmt_bind_result($stmt, $row-> id, $row->tipo_solucion, $row->problema, $row->sub_problema, $row->rotulo, $row->dir_ip, $row->cliente_rut, $row->fecha, $row->hora, $row->soporte, $row->estado, $row->descripcion, $row->hora_cierre, $row->fecha_cierre, $row->asignado_por, $row->comentario_cierre, $row->problema_e, $row->sub_problema_e, $row->solucion_dada_por, $row->idClasificacion, $row->idDescripcion, $row->tiempoSolucion, $row->administracionRemota, $row->tipoNivel, $row->reporteSolucionado, $row->fechaSolucion, $row->horaSolucion, $row->solucionadoPor, $row->clasificacionCierre, $row->categoriaCierre, $row->subcategoriaCierre, $row->descripcionCierre, $row->creadoPor);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_fetch($stmt);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$cuerpoMensaje = "============================================================ <br />";
		$cuerpoMensaje.= "     Centro de Atencion Usuarios - Notificacion de Reasignacion de Ticket    <br />";
		$cuerpoMensaje.= "============================================================ <br />";
		$cuerpoMensaje.= " <br /> <br />";
		$cuerpoMensaje.= " Estimado(a) Usuario(a) :<br />";
		$cuerpoMensaje.= " <br /> <br />";
		$cuerpoMensaje.= " Se ha reasignado este ticket a su agenda del Sistema de Reportes <br />";
		$cuerpoMensaje.= " con los siguientes datos de identificacion :                   <br />";
		$cuerpoMensaje.= " <br /> ";
		$cuerpoMensaje.= " Nº de Ticket : ".$id." <br /><br />";
		$cuerpoMensaje.= " Para conocer mas detalles del ticket antes mencionado, puede acceder<br />";
		$cuerpoMensaje.= " a los comentarios en nuestro sistema.  <br />";
		$cuerpoMensaje.= " <br /> <br />";
		$cuerpoMensaje.= " Atte:<br />";
		$cuerpoMensaje.= " <br />";
		
		
		$this->fnCorreo('', $cuerpoMensaje);
		
		mysqli_stmt_free_result($stmt);		
		mysqli_close($this->connection);
		return $row;
	}
	
	
	
	public function cerrarTicket($id, $comentario) {
	
		$stmt = mysqli_prepare($this->connection, "UPDATE $this->tablename SET estado='cerrado', fecha_cierre=?, hora_cierre=? WHERE id=?");		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_bind_param($stmt, 'iss', $comentario->fecha, $comentario->hora, $id);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$this->saveComentarios($comentario);
		
		$stmt = mysqli_prepare($this->connection, "SELECT * FROM $this->tablename WHERE id = " . $id);		
		$this->throwExceptionOnError();
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$this->throwExceptionOnError();
		
		$row = new TicketVO();
		
		mysqli_stmt_bind_result($stmt, $row-> id, $row->tipo_solucion, $row->problema, $row->sub_problema, $row->rotulo, $row->dir_ip, $row->cliente_rut, $row->fecha, $row->hora, $row->soporte, $row->estado, $row->descripcion, $row->hora_cierre, $row->fecha_cierre, $row->asignado_por, $row->comentario_cierre, $row->problema_e, $row->sub_problema_e, $row->solucion_dada_por, $row->idClasificacion, $row->idDescripcion, $row->tiempoSolucion, $row->administracionRemota, $row->tipoNivel, $row->reporteSolucionado, $row->fechaSolucion, $row->horaSolucion, $row->solucionadoPor, $row->clasificacionCierre, $row->categoriaCierre, $row->subcategoriaCierre, $row->descripcionCierre, $row->creadoPor);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_fetch($stmt);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		
		
		$cuerpoMensaje = "========================================================== <br />";
		$cuerpoMensaje.= "     Centro Atención de Usuarios - Notificacion de Cierre de Ticket     <br />";
		$cuerpoMensaje.= "========================================================== <br />";
		$cuerpoMensaje.= " <br /> <br />";
		$cuerpoMensaje.= " Estimado(a) Usuario(a) :<br />";
		$cuerpoMensaje.= " <br /> <br />";
		$cuerpoMensaje.= " Se ha cerrado en nuestro Sistema de Reportes el <br />";
		$cuerpoMensaje.= " Nº de Ticket : ".$id.".<br /><br />";
		$cuerpoMensaje.= " Si el problema persiste, favor llamar a nuestros operadores, <br />";
		$cuerpoMensaje.= " indicando el Nº de ticket antes mencionado.  <br />";
		$cuerpoMensaje.= " <br /> <br />";
		$cuerpoMensaje.= " Atte:<br />";
		$cuerpoMensaje.= " <br />";
		
		
		$this->fnCorreo('', $cuerpoMensaje);
		
		
		mysqli_stmt_free_result($stmt);		
		mysqli_close($this->connection);
		return $row;
	}

	
	
	public function solicitudCerrarTicket($ticket, $comentario) {
		//return $ticket;
		$stmt = mysqli_prepare($this->connection, "UPDATE $this->tablename SET estado='Pendiente de Cierre', solucion_dada_por=?, fechaSolucion=?, horaSolucion=?, soporte=? WHERE id=?");		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_bind_param($stmt, 'sisss', $ticket->solucion_dada_por, $comentario->fecha, $comentario->hora, $ticket->soporte, $ticket->id);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$this->saveComentarios($comentario);
		
		$stmt = mysqli_prepare($this->connection, "SELECT * FROM $this->tablename WHERE id = " . $ticket->id);		
		$this->throwExceptionOnError();
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$this->throwExceptionOnError();
		
		$row = new TicketVO();
		
		mysqli_stmt_bind_result($stmt, $row-> id, $row->tipo_solucion, $row->problema, $row->sub_problema, $row->rotulo, $row->dir_ip, $row->cliente_rut, $row->fecha, $row->hora, $row->soporte, $row->estado, $row->descripcion, $row->hora_cierre, $row->fecha_cierre, $row->asignado_por, $row->comentario_cierre, $row->problema_e, $row->sub_problema_e, $row->solucion_dada_por, $row->idClasificacion, $row->idDescripcion, $row->tiempoSolucion, $row->administracionRemota, $row->tipoNivel, $row->reporteSolucionado, $row->fechaSolucion, $row->horaSolucion, $row->solucionadoPor, $row->clasificacionCierre, $row->categoriaCierre, $row->subcategoriaCierre, $row->descripcionCierre, $row->creadoPor);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_fetch($stmt);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		
		
		$cuerpoMensaje = "========================================================== <br />";
		$cuerpoMensaje.= "     Centro Atención de Usuarios - Notificacion de Solicitud de Cierre de Ticket     <br />";
		$cuerpoMensaje.= "========================================================== <br />";
		$cuerpoMensaje.= " <br /> <br />";
		$cuerpoMensaje.= " Estimado(a) Usuario(a) :<br />";
		$cuerpoMensaje.= " <br /> <br />";
		$cuerpoMensaje.= " Se ha reasignado ticket para cerrar en nuestro Sistema de Reportes el <br />";
		$cuerpoMensaje.= " Nº de Ticket : ".$ticket->id.".<br /><br />";
		$cuerpoMensaje.= " <br />";
		$cuerpoMensaje.= "<br />";
		$cuerpoMensaje.= " <br /> <br />";
		$cuerpoMensaje.= " Atte:<br />";
		$cuerpoMensaje.= " <br />";
		
		
		$this->fnCorreo('', $cuerpoMensaje);
		
		
		mysqli_stmt_free_result($stmt);		
		mysqli_close($this->connection);
		return $row;
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
	public function count($idCla, $username, $estado) {
		$opt = '';
		if($username != ''){
			$opt = "AND soporte = '" . $username . "'";
		}
		
		if($estado != 'Todos'){
			$opt .= " AND estado = '" . $estado . "'";
		}
		$stmt = mysqli_prepare($this->connection, "SELECT COUNT(*) AS COUNT FROM $this->tablename where idClasificacion = " . $idCla . " " . $opt);
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_result($stmt, $rec_count);
		$this->throwExceptionOnError();
		
		mysqli_stmt_fetch($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_free_result($stmt);
		mysqli_close($this->connection);
		
		$obj = new stdClass();
		$obj->paginas = round($rec_count / 5000, 0, PHP_ROUND_HALF_UP);
		$obj->registros = $rec_count;
		
		return $obj;
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
	public function getTickets_paged($startIndex, $numItems, $idCla, $username, $estado) {
		$opt = '';
		if($username != ''){
			$opt = "AND soporte = '" . $username . "'";
		}
		
		if($estado != 'Todos'){
			$opt .= " AND estado = '" . $estado . "'";
		}
		//return "SELECT * FROM $this->tablename where idClasificacion = " . $idCla . " " . $opt . " order by fecha desc limit $startIndex, $numItems";
		$stmt = mysqli_prepare($this->connection, "SELECT * FROM $this->tablename where idClasificacion = " . $idCla . " " . $opt . " order by fecha desc limit $startIndex, $numItems");		
		$this->throwExceptionOnError();
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$rows = array();
		$row = new TicketVO();
		
		mysqli_stmt_bind_result($stmt, $row-> id, $row->tipo_solucion, $row->problema, $row->sub_problema, $row->rotulo, $row->dir_ip, $row->cliente_rut, $row->fecha, $row->hora, $row->soporte, $row->estado, $row->descripcion, $row->hora_cierre, $row->fecha_cierre, $row->asignado_por, $row->comentario_cierre, $row->problema_e, $row->sub_problema_e, $row->solucion_dada_por, $row->idClasificacion, $row->idDescripcion, $row->tiempoSolucion, $row->administracionRemota, $row->tipoNivel, $row->reporteSolucionado, $row->fechaSolucion, $row->horaSolucion, $row->solucionadoPor, $row->clasificacionCierre, $row->categoriaCierre, $row->subcategoriaCierre, $row->descripcionCierre, $row->creadoPor);
		
		//$data = $row->id;
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
		  $row = new TicketVO();
	      mysqli_stmt_bind_result($stmt, $row-> id, $row->tipo_solucion, $row->problema, $row->sub_problema, $row->rotulo, $row->dir_ip, $row->cliente_rut, $row->fecha, $row->hora, $row->soporte, $row->estado, $row->descripcion, $row->hora_cierre, $row->fecha_cierre, $row->asignado_por, $row->comentario_cierre, $row->problema_e, $row->sub_problema_e, $row->solucion_dada_por, $row->idClasificacion, $row->idDescripcion, $row->tiempoSolucion, $row->administracionRemota, $row->tipoNivel, $row->reporteSolucionado, $row->fechaSolucion, $row->horaSolucion, $row->solucionadoPor, $row->clasificacionCierre, $row->categoriaCierre, $row->subcategoriaCierre, $row->descripcionCierre, $row->creadoPor);
	    }
		
		mysqli_stmt_free_result($stmt);
	    mysqli_close($this->connection);
		
		return $rows;
	}
	
	
	public function getAllComentarios($itemID) {
		
		$stmt = mysqli_prepare($this->connection, "SELECT id, soporte, reporte, comentarios, fecha, hora FROM reportes_grabados WHERE reporte = ? order by fecha, hora desc");		
		$this->throwExceptionOnError();
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		mysqli_stmt_bind_param($stmt, 's', $itemID);
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		$rows = array();
		$row = new ComentarioVO();
		
		mysqli_stmt_bind_result($stmt, $row->id, $row->soporte, $row->reporte, $row->comentarios, $row->fecha, $row->hora);
		
		//$data = $row->id;
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
		  $row = new ComentarioVO();
	      mysqli_stmt_bind_result($stmt, $row->id, $row->soporte, $row->reporte, $row->comentarios, $row->fecha, $row->hora);
	    }
		
		mysqli_stmt_free_result($stmt);
	    mysqli_close($this->connection);
		
		return $rows;
	}
	
	public function saveComentarios($row) {
		//return $row;
		$stmt = mysqli_prepare($this->connection, "INSERT INTO reportes_grabados (id, soporte, reporte, comentarios, fecha, hora) VALUES (null, ?, ?, ?, ?, ?)");
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		mysqli_stmt_bind_param($stmt, 'sisis',  $row->soporte, $row->reporte, $row->comentarios, $row->fecha, $row->hora);
		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
//return $stmt;
		$autoid = mysqli_stmt_insert_id($stmt);

		mysqli_stmt_free_result($stmt);		
		mysqli_close($this->connection);
		$row->id = $autoid;
		return $row;
	}
	
	
	/**
	 * Utility function to throw an exception if an error occurs 
	 * while running a mysql command.
	 */
	 
	private function fnCorreo($correo, $html){
	
		$smtp=new PHPMailer();
		//return true;
		# Indicamos que vamos a utilizar un servidor SMTP
		$smtp->IsSMTP();

		# Definimos el formato del correo con UTF-8
		$smtp->CharSet="UTF-8";

		# autenticación contra nuestro servidor smtp
		$smtp->SMTPAuth   = true;						// enable SMTP authentication
		$smtp->SMTPSecure = "tls";
		$smtp->Host       = "smtp.gmail.com";			// sets MAIL as the SMTP server
		$smtp->Username   = "anti.demiurgo@gmail.com";	// MAIL username
		$smtp->Password   = "dragonnegro";			// MAIL password
		$smtp->Port       = 587;
		# datos de quien realiza el envio
		$smtp->From       = "soporte@yo.cl"; // from mail
		$smtp->FromName   = "Test"; // from mail name

		# Indicamos las direcciones donde enviar el mensaje con el formato
		#   "correo"=>"nombre usuario"
		# Se pueden poner tantos correos como se deseen
		$mailTo=array(
		    "mario.fuentealba.otarola@gmail.com"=>"mario fuentealba otarola",		    
		);

		# establecemos un limite de caracteres de anchura
		$smtp->WordWrap   = 50; // set word wrap

		# NOTA: Los correos es conveniente enviarlos en formato HTML y Texto para que
		# cualquier programa de correo pueda leerlo.

		# Definimos el contenido HTML del correo
		$contenidoHTML="<head>";
		$contenidoHTML.="<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">";
		$contenidoHTML.="</head><body>";
		$contenidoHTML .= $html;
		//$contenidoHTML.="<p><a href='http://www.lawebdelprogramador.com'>http://www.lawebdelprogramador.com</a></p>";
		$contenidoHTML.="</body>\n";

		# Definimos el contenido en formato Texto del correo
		$contenidoTexto="Contenido en formato Texto";
		$contenidoTexto.="\n\nhttp://www.lawebdelprogramador.com";

		# Definimos el subject
		$smtp->Subject="Envio de prueba utilizando un servidor SMTP";

		# Adjuntamos el archivo "leameLWP.txt" al correo.
		# Obtenemos la ruta absoluta de donde se ejecuta este script para encontrar el
		# archivo leameLWP.txt para adjuntar. Por ejemplo, si estamos ejecutando nuestro
		# script en: /home/xve/test/sendMail.php, nos interesa obtener unicamente:
		# /home/xve/test para posteriormente adjuntar el archivo leameLWP.txt, quedando
		# /home/xve/test/leameLWP.txt
		/*$rutaAbsoluta=substr($_SERVER["SCRIPT_FILENAME"],0,strrpos($_SERVER["SCRIPT_FILENAME"],"/"));
		$smtp->AddAttachment($rutaAbsoluta."/leameLWP.txt", "LeameLWP.txt");*/

		# Indicamos el contenido
		$smtp->AltBody=$contenidoTexto; //Text Body
		$smtp->MsgHTML($contenidoHTML); //Text body HTML

		foreach($mailTo as $mail=>$name)
		{
		    $smtp->ClearAllRecipients();
		    $smtp->AddAddress($mail,$name);

		    if(!$smtp->Send())
		    {
		        echo "<br />Error (".$mail."): ".$smtp->ErrorInfo;
		    }else{
		        echo "<br />Envio realizado a ".$name." (".$mail.")";
		    }
		}
	
	
	} 
	
	public function fnVolcado($fechaInicio, $fechaTermino){
		
		$stmt = mysqli_prepare($this->connection, "select 
											r.*
										from reportes r 
										inner join clasificacion cla on cla.idClasificacion = r.idClasificacion
										inner join categoria c on c.idCategoria = r.problema
										inner join subcategoria s on s.idSubCategoria = r.sub_problema
										inner join descripcion d on d.idDescripcion = r.idDescripcion 
										inner join clientes cl on cl.rut = r.cliente_rut	
										inner join users u on u.username = r.soporte
										inner join gruporesolutor g on g.idGrupoResolutor = u.idGrupoResolutor
										where fecha >= '".$fechaInicio."' and fecha <= '".$fechaTermino."'										
										order by r.id desc
										");
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
		$row = new TicketVO();
		
		mysqli_stmt_bind_result($stmt, $row-> id, $row->tipo_solucion, $row->problema, $row->sub_problema, $row->rotulo, $row->dir_ip, $row->cliente_rut, $row->fecha, $row->hora, $row->soporte, $row->estado, $row->descripcion, $row->hora_cierre, $row->fecha_cierre, $row->asignado_por, $row->comentario_cierre, $row->problema_e, $row->sub_problema_e, $row->solucion_dada_por, $row->idClasificacion, $row->idDescripcion, $row->tiempoSolucion, $row->administracionRemota, $row->tipoNivel, $row->reporteSolucionado, $row->fechaSolucion, $row->horaSolucion, $row->solucionadoPor, $row->clasificacionCierre, $row->categoriaCierre, $row->subcategoriaCierre, $row->descripcionCierre, $row->creadoPor);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		//$data = $row->id;
		
		
	    while (mysqli_stmt_fetch($stmt)) {
			$rows[] = $row;
			$arr = explode("|", $this->calculaDias($row));
			$row->diasTicket = $arr[0];
			$row->horasTicket = $arr[1];
			$row->diasTotalTicket = $arr[2];
			$row->horasTotalTicket = $arr[3];
			//return array($row);
			
			
			$row = new TicketVO();


			mysqli_stmt_bind_result($stmt, $row-> id, $row->tipo_solucion, $row->problema, $row->sub_problema, $row->rotulo, $row->dir_ip, $row->cliente_rut, $row->fecha, $row->hora, $row->soporte, $row->estado, $row->descripcion, $row->hora_cierre, $row->fecha_cierre, $row->asignado_por, $row->comentario_cierre, $row->problema_e, $row->sub_problema_e, $row->solucion_dada_por, $row->idClasificacion, $row->idDescripcion, $row->tiempoSolucion, $row->administracionRemota, $row->tipoNivel, $row->reporteSolucionado, $row->fechaSolucion, $row->horaSolucion, $row->solucionadoPor, $row->clasificacionCierre, $row->categoriaCierre, $row->subcategoriaCierre, $row->descripcionCierre, $row->creadoPor);
			
	    }
		
		mysqli_stmt_free_result($stmt);
	    mysqli_close($this->connection);
		
		return $rows;
		
		
	}
	
	
	private function dia($fecha_recepcion)
	{
	  $fecha_separada = str_split($fecha_recepcion,4);
	  $dia_mes = $fecha_separada[1];
	  $fecha_separada = str_split($dia_mes,2);
	  $dia = $fecha_separada[1];
	  return $dia;
	}

	private function mes($fecha_recepcion)
	{
	  $fecha_separada = str_split($fecha_recepcion,4);
	  $dia_mes = $fecha_separada[1];
	  $fecha_separada = str_split($dia_mes,2);
	  $mes = $fecha_separada[0];
	  
	  return $mes;
	}

	private function anio($fecha_recepcion)
	{
	  $fecha_separada = str_split($fecha_recepcion,4);
	  $ano = $fecha_separada[0];
	  return $ano;
	}



	private function hora($hora_recepcion)
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

	private function minutos($hora_recepcion)
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


	private function separa_fecha($fecha_recepcion)
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
	private function separa_hora($hora_recepcion)
	{
	  $hora_separada = explode(':', $hora_recepcion);
	  $hora = $hora_separada[0];
	  $minuto = $hora_separada[1];
	  $hora_con_puntos = $hora.":".$minuto;
	  return $hora_con_puntos;
	}
	
	
	private function fn_calculaDiasNoHabiles($fechaInicial, $fechaFinal){			
		$DifDias = ($fechaFinal - $fechaInicial)/60/60/24;
		$dias = 0;
		$Segundos = 0;
		for ($i=0; $i < $DifDias; $i++)  
		{  
			$Segundos = $Segundos + 86400;  
			$caduca = date("D", $fechaInicial + $Segundos);  
			if ($caduca == "Sat" || $caduca == "Sun")  
			{  
				$dias++;
			}  											
		}  
		return $dias;
	}
	
	private function calculaDias($row){
		
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
			
			
		
		$fecha1 = mktime(0,0,0,$this->mes($row->fecha),$this->dia($row->fecha),$this->anio($row->fecha));		
		$diaIniCalcFeriado = $this->anio($row->fecha) . '-' . $this->mes($row->fecha) . '-' . $this->dia($row->fecha);
		$diaIni = mktime(0,0,0,$this->mes($row->fecha),$this->dia($row->fecha),$this->anio($row->fecha));		
		
		
		if ($row->fecha_cierre != 0){
			//$diaFin = mktime(hora($row->hora_cierre),minutos($row->hora_cierre),0,mes($row->fecha_cierre),dia($row->fecha_cierre),anio($row->fecha_cierre));
			$diaFin = mktime(23,59,0,$this->mes($row->fecha_cierre),$this->dia($row->fecha_cierre),$this->anio($row->fecha_cierre));
			
			$fecha2 = mktime(0, 0, 0, $this->mes($row->fecha_cierre),$this->dia($row->fecha_cierre),$this->anio($row->fecha_cierre));
			$diaFinCalcFeriado = $this->anio($row->fecha_cierre) . '-' . $this->mes($row->fecha_cierre) . '-' . $this->dia($row->fecha_cierre);
		}else{
			$diaFin = mktime($this->hora($hora),$this->minutos($hora),0,$this->mes($fecha),$this->dia($fecha),$this->anio($fecha));
			$fecha2 = mktime(0, 0, 0, $this->mes($fecha), $this->dia($fecha), $this->anio($fecha));
			$diaFinCalcFeriado = $this->anio($fecha) . '-' . $this->mes($fecha) . '-' . $this->dia($fecha);
		}
		$diasMenos = $this->fn_calculaDiasNoHabiles($fecha1, $fecha2);
		$sql = "select
					count(*) cantidad
				from feriados 
				where fecha between '" . $diaIniCalcFeriado ."' and '".$diaFinCalcFeriado."'";//
				
		$stmt = mysqli_prepare($this->connectionAux, $sql);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		mysqli_stmt_execute($stmt);		
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}

		mysqli_stmt_bind_result($stmt, $diasFeriados);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		mysqli_stmt_fetch($stmt);
		$msg = $this->throwExceptionOnError();
		if($msg != ''){
			return $msg;
		}
		
		
		$horasMenos = $diasMenos * 86400;
		$diaResult = round((($diaFin - $diaIni) / 60/ 60/ 24)  - 2 - $diasMenos - $diasFeriados, 0); // El -2 es porque el dia inicial y el final se consideran en otra parte
		if($diaResult < 0){
			$diaResult = 0;
		}	
		$inicioJornadaMinutos = 8.5 * 60;
		$finJornadaMinutos = 21 * 60;
		$horasTrabajadas = $diaResult * ($finJornadaMinutos - $inicioJornadaMinutos)/60;
		if($diaFinCalcFeriado == $diaIniCalcFeriado){
			$horaInicial = $this->hora($row->hora) * 60 + $this->minutos($row->hora);
			$horasTrabajadasInicial = $horaInicial/60;
			
			if ($row->fecha_cierre != 0){
				$horaFinal = $this->hora($row->hora_cierre) * 60 + $this->minutos($row->hora_cierre);
			}else{
				$horaFinal = $this->hora($hora) * 60 + $this->minutos($hora);
			}
			$horasTrabajadasFinal = $horaFinal/60;
			$horasTrabajadas += ($horasTrabajadasFinal - $horasTrabajadasInicial);
			
		} else {
			$horaInicial = $this->hora($row->hora) * 60 + $this->minutos($row->hora);
			$horasTrabajadasInicial = ($finJornadaMinutos - $horaInicial) / 60;
			
			if ($row->fecha_cierre != 0){
				$horaFinal = $this->hora($row->hora_cierre) * 60 + $this->minutos($row->hora_cierre);
			}else{
				$horaFinal = $this->hora($hora) * 60 + $this->minutos($hora);
			}
			$horasTrabajadasFinal = ($horaFinal - $inicioJornadaMinutos) / 60;
			$horasTrabajadas += $horasTrabajadasInicial + $horasTrabajadasFinal;
		}
				
		if ($row->fecha_cierre != 0){
			$fecha2 = mktime($this->hora($row->hora_cierre),$this->minutos($row->hora_cierre),0,$this->mes($row->fecha_cierre),$this->dia($row->fecha_cierre),$this->anio($row->fecha_cierre));
		}else{
			$fecha2 = mktime($this->hora($hora),$this->minutos($hora),0,$this->mes($fecha),$this->dia($fecha),$this->anio($fecha));
		}
		$diferencia = $fecha2-$fecha1;
		$diff['horas'] = $diferencia/60/60;
		$diff['minutos'] = $diferencia / 60;
		$diff['dias'] = $diff['horas']/24;
		$totalHoras = number_format($diff['horas'],0 , "," ,".");
		if ($row->fechaSolucion != ''){
			$fechaSolucion = mktime($this->hora($row->horaSolucion),$this->minutos($row->horaSolucion),0,$this->mes($row->fechaSolucion),$this->dia($row->fechaSolucion),$this->anio($row->fechaSolucion));
		}else{
		
			$fechaSolucion = mktime($this->hora($hora),$this->minutos($hora),0,$this->mes($fecha),$this->dia($fecha),$this->anio($fecha));
		}
		$diferenciaSolucion = $fechaSolucion-$fecha1;
		$diffSolucion['horas'] = ($diferenciaSolucion/60/60);
		$diffSolucion['minutos'] = $diferenciaSolucion / 60;
		$diffSolucion['dias'] = $diffSolucion['horas']/24;
		$totalHorasSolucion = $horasTrabajadas;// . ":" . $min;
		
		
		
		if ($totalHorasSolucion > 0){
			$horas = round($totalHorasSolucion, 2);
			$arr = explode(".", "" . $horas);
			$aj = '';
			$hor = ($totalHorasSolucion * 60);
			$hoFin = 0;
			while($hor - 60 > 0){
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
			$hor = $hoFin . ':' . $mi;
		} else { 
				
			$horas = number_format($diffSolucion['minutos']/60,2 , "," ,".");
			$arr = explode(".", "" . $horas);
			if($arr[1] < 10){
				$arr[1] = $arr[1] * 10;
			}
			$min = $arr[1] * 60 / 100;
			$hor = $arr[0] . ":" . (int)$min;
		
		}
		$ds = number_format($diff['horas']/24,2 , "," ,".");
		if ($totalHoras > 0){
			$rs = number_format($diff['horas'],2 , "," ,".");
		} else { 
			$rs = number_format($diff['minutos']/60,2 , "," ,".");
		}
		
		return number_format($diffSolucion['horas']/24,2 , "," ,".") . '|' . $hor . '|' . $ds . '|' . $rs;
		
	}
	
	
	 
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
