package model
{
	import components.TrdProgressBar;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.remoting.RemoteObject;
	
	import services.ConexionSocket;
	
	import vo.TicketVO;
	import vo.UserVO;

	[Bindable]
	public class ModelApp
	{
		private static var modelLocator:ModelApp;
		/*public var rmtObjSucursales:RemoteObject;
		public var rmtObjClientes:RemoteObject;
		public var rmtObjUsuarios:RemoteObject;*/
		//public var rmtObjMant:RemoteObject;
		public var conexion:ConexionSocket = new ConexionSocket();
		public var arrSucursales:ArrayCollection;
		public var objSucursales:Object = {};
		public var arrSucursalesTodas:ArrayCollection;
		public var fnSucursalesFilter:Function;
		public var sucursalesFilter:String;
		
		public var arrClientes:ArrayCollection;
		public var arrComboClientes:ArrayCollection;
		public var objClientes:Object = {};
		public var objClientesRut:Object = {};
		public var fnClientesFilter:Function;
		public var clientesFilter:String;
		
		public var arrPerfiles:ArrayCollection;
		public var arrGrupoResolutor:ArrayCollection;
		public var arrTipoUsuario:ArrayCollection;
		public var arrClasificacion:ArrayCollection;
		public var arrCategoria:ArrayCollection;
		public var arrSubCategoria:ArrayCollection;
		public var arrDescripcion:ArrayCollection;
		
		public var arrNotificaciones:ArrayCollection = new ArrayCollection();
		
		public var arrCriticidad:ArrayCollection = new ArrayCollection([{label: 'Baja', id: '1'}, {label: 'Media', id: '2'}, {label: 'Baja', id: '3'}]);
		public var arrEstados:ArrayCollection = new ArrayCollection([{label: 'Todos', id: '0'}, {label: 'Asignado', id: '1'}, {label: 'Cerrado', id: '2'}]);
		public var popBl:TrdProgressBar;
		public var cntrBl:int = 0;
		
		public var objTipoUsuario:Object = {};
		public var objGrupoResolutor:Object = {};
		public var objPerfiles:Object = {};
		public var objClasificacion:Object = {};
		public var objCategoria:Object = {};
		public var objSubCategoria:Object = {};
		public var objDescripcion:Object = {};
		
		
		public var objTicket:Object = {};
		public var arrTickets:ArrayCollection = new ArrayCollection();
		public var fnTicketsFilter:Function;
		
		public var arrUsuarios:ArrayCollection;
		public var objUsuarios:Object = {};
		public var fnUsuariosFilter:Function;
		public var usuarioFilter:String;
		public var usuarioActivo:UserVO;
		//public var grupoResolutorFilter:String;
		
		public var arrVolcado:ArrayCollection;
		
		
		public var arrFormaAtencion:ArrayCollection;
		public var arrTiempoSolucion:ArrayCollection;
		public var objFormaAtencion:Object = {};
		public var objTiempoSolucion:Object = {};
		
		public var totalPaginas:int;
		public var totalRegistros:int;
		public var arrPaginas:Array = [];
		public var cantidadPagina:int = 5000;
		public var paginaActual:int = 0;
		
		public var ticketSeleccionado:TicketVO;
		public var tituloTrans:String = '';
		public var contenidoTrans:String = '';
		
		public static const CLASIFICACION:String = 'Clasificacion';
		public static const CATEGORIA:String = 'Categoria';
		public static const SUBCATEGORIA:String = 'SubCategoria';
		public static const PROBLEMA:String = 'Problema';
		
		
		
		public static function getInstance():ModelApp
		{
			if ( modelLocator == null ){
				modelLocator = new ModelApp();
			}
			
			return modelLocator;
		}
		
		public function ModelApp()
		{
			if(modelLocator){
				throw new Error("Singleton... use getInstance()");
			} 
			modelLocator = this;
		}
		
		
	}
}