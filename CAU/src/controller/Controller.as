package controller
{
	import com.adobe.serialization.json.JSON;
	
	import event.ClienteEvent;
	import event.MantenedoresEvent;
	import event.SucursalEvent;
	import event.TicketEvent;
	import event.UsuarioEvent;
	
	import flash.events.DataEvent;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import listeners.ClienteListener;
	import listeners.MantenedorListener;
	import listeners.SucursalListener;
	import listeners.TicketListener;
	import listeners.UsuarioListener;
	
	import model.ModelApp;
	
	import mx.controls.Alert;
	
	import services.DelegadoNode;
	
	import vo.NotificacionVO;
	import vo.TicketVO;
	
	public class Controller extends ControllerBase
	{
		public static var controladorGeneral:Controller;
		[Bindable] private var modelApp:ModelApp = ModelApp.getInstance();
		[Bindable] private var dlNode:DelegadoNode = DelegadoNode.getInstance();
		
		/*private var sucursalListener:SucursalListener = new SucursalListener();
		private var clienteListener:ClienteListener = new ClienteListener();
		private var mantenedorListener:MantenedorListener = new MantenedorListener();*/
		
		public static function getInstance():Controller
		{
			if ( controladorGeneral == null ){
				controladorGeneral = new Controller();
				
			}
			
			return controladorGeneral;
		}
		
		public function Controller(target:IEventDispatcher=null)
		{
			if(controladorGeneral){
				throw new Error("Singleton... use getInstance()");
			} 
			controladorGeneral = this;
			inic();			
		}
		
		public function inic():void{
			addEventListenerNew(SucursalEvent.LISTAR, SucursalListener);
			addEventListenerNew(SucursalEvent.CREAR, SucursalListener);
			addEventListenerNew(SucursalEvent.MODIFICAR, SucursalListener);
			addEventListenerNew(SucursalEvent.ELIMINAR, SucursalListener);
			
			addEventListenerNew(ClienteEvent.LISTAR, ClienteListener);
			addEventListenerNew(ClienteEvent.CREAR, ClienteListener);
			addEventListenerNew(ClienteEvent.MODIFICAR, ClienteListener);
			addEventListenerNew(ClienteEvent.ELIMINAR, ClienteListener);
			
			addEventListenerNew(UsuarioEvent.LISTAR, UsuarioListener);
			addEventListenerNew(UsuarioEvent.CREAR, UsuarioListener);
			addEventListenerNew(UsuarioEvent.MODIFICAR, UsuarioListener);
			addEventListenerNew(UsuarioEvent.ELIMINAR, UsuarioListener);
			addEventListenerNew(UsuarioEvent.LOGIN, UsuarioListener);
			addEventListenerNew(UsuarioEvent.BUSCAR_NOTIFICACIONES, UsuarioListener);
			
			addEventListenerNew(MantenedoresEvent.LISTAR_PERFILES, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.LISTAR_GRUPORESOLUTOR, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.LISTAR_CLASIFICACION, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.LISTAR_CATEGORIAS, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.LISTAR_SUBCATEGORIAS, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.LISTAR_DESCRIPCION, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.LISTAR_TIEMPO_SOLUCION, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.LISTAR_FORMA_ATENCION, MantenedorListener);
			
			addEventListenerNew(MantenedoresEvent.BUSCA_CATEGORIAS_ASOCIADAS, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.AGREGAR_CATEGORIAS, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.ELIMINAR_CLASIFICACION_CATEGORIAS, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.CREAR_CLASIFICACION, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.ELIMINAR_CLASIFICACION, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.MODIFICAR_CLASIFICACION, MantenedorListener);
			
			addEventListenerNew(MantenedoresEvent.BUSCA_SUBCATEGORIAS_ASOCIADAS, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.AGREGAR_SUBCATEGORIAS, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.ELIMINAR_CATEGORIA_SUBCATEGORIA, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.CREAR_CATEGORIA, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.ELIMINAR_CATEGORIA, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.MODIFICAR_CATEGORIA, MantenedorListener);
			
			addEventListenerNew(MantenedoresEvent.BUSCA_PROBLEMAS_ASOCIADOS, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.AGREGAR_PROBLEMAS, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.ELIMINAR_SUBCATEGORIA_PROBLEMAS, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.CREAR_SUBCATEGORIAS, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.ELIMINAR_SUBCATEGORIAS, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.MODIFICAR_SUBCATEGORIAS, MantenedorListener);
			
			addEventListenerNew(MantenedoresEvent.CREAR_PROBLEMAS, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.ELIMINAR_PROBLEMAS, MantenedorListener);
			addEventListenerNew(MantenedoresEvent.MODIFICAR_PROBLEMAS, MantenedorListener);
			
			addEventListenerNew(TicketEvent.CREAR, TicketListener);
			addEventListenerNew(TicketEvent.LISTAR, TicketListener);
			addEventListenerNew(TicketEvent.TOTAL_PAGINAS, TicketListener);
			addEventListenerNew(TicketEvent.LISTAR_PAGINA, TicketListener);
			addEventListenerNew(TicketEvent.LISTAR_COMENTARIOS, TicketListener);
			addEventListenerNew(TicketEvent.GUARDAR_COMENTARIOS, TicketListener);
			addEventListenerNew(TicketEvent.REASIGNAR_TICKET, TicketListener);
			addEventListenerNew(TicketEvent.CERRAR_TICKET, TicketListener);
			addEventListenerNew(TicketEvent.SOLICITUD_CERRAR_TICKET, TicketListener);
			addEventListenerNew(TicketEvent.REPORTE_VOLCADO_MOSTRAR, TicketListener);
			addEventListenerNew(TicketEvent.LEER_TICKET, TicketListener);
			addEventListenerNew(TicketEvent.BUSCAR_TICKET, TicketListener);
			
			
			dlNode.callbackRecep = callbackRecep;
			addEventListener(UsuarioEvent.CONN, despachar);
		}	
		
		private function despachar(evento:*):void{
			switch(evento.clase){
				case 'UsuarioEvent':
					//var sesionEvent:SesionEvent = event as SesionEvent;
					switch(evento.type){
						case UsuarioEvent.CONN:
							DelegadoNode.getInstance().fnIdentificarUsuario(sesionResponse);
							break;
						//DelegadoSQLite.getInstance().fnDelegado(fn del controller que actualiza vista, fn callback del evento para alguna otra actualizacion mas visual)
					}
					break;
				
			}
		}	
		
		
		/***************NODEJS**************************************/
		
		private function callbackRecep(result:DataEvent):void{
			var arrParam:Array = String(result.data).split('|');
			switch(arrParam[1]){			
				case 'MSG':
					if(arrParam[2] == 'OK'){
						
						Alert.show(arrParam[3], 'INFO');
					}
					
					break;
				case 'NUEVO_TICKET':
					var ticketVO:TicketVO = new TicketVO(com.adobe.serialization.json.JSON.decode(arrParam[2]));
					modelApp.arrTickets.addItem(ticketVO);
					if(ticketVO.soporte == modelApp.usuarioActivo.username){
						var obj:NotificacionVO = new NotificacionVO();
						obj.mensaje = 'Se ha asignado el ticket N° ' + ticketVO.id;
						var f:String = ticketVO.fecha + '';
						obj.fecha = f.substr(0, 4) + '-' + f.substr(2, 2) + '-' + f.substr(4, 2) + ' ' + ticketVO.hora;
						obj.tipo = 'TicketVO';
						obj.id = 'TicketVO|' + ticketVO.id;
						modelApp.arrNotificaciones.addItem(obj);
						//modelApp.dictNotificaciones[ticketVO] = {pos: modelApp.arrNotificaciones.source.length - 1, obj: obj};
						modelApp.strNot = modelApp.arrNotificaciones.source.length == 0 ? '' : modelApp.arrNotificaciones.source.length + '';
					}
					break;
				
				case 'REASIGNACION_TICKET':
					ticketVO = new TicketVO(com.adobe.serialization.json.JSON.decode(arrParam[2]));
					
					if(ticketVO.soporte == modelApp.usuarioActivo.username){
						obj = new NotificacionVO();
						obj.mensaje = 'Se ha reasignado el ticket N° ' + ticketVO.id;
						f = ticketVO.fecha + '';
						obj.fecha = f.substr(0, 4) + '-' + f.substr(2, 2) + '-' + f.substr(4, 2) + ' ' + ticketVO.hora;
						obj.tipo = 'Reasignacion';
						obj.id = 'Reasignacion|' + ticketVO.id;
						modelApp.arrNotificaciones.addItem(obj);
						//modelApp.dictNotificaciones[ticketVO] = {pos: modelApp.arrNotificaciones.source.length - 1, obj: obj};
						modelApp.strNot = modelApp.arrNotificaciones.source.length == 0 ? '' : modelApp.arrNotificaciones.source.length + '';
					}
					break;
				
			}
		}
		
		
		private function sesionResponse(aEvent : DataEvent):void{
			var arrSesion:Array = String(aEvent.data).split('|');
			/*modelApp.sesion = new SesionVO();
			modelApp.sesion.id = arrSesion[0];
			modelApp.sesion.user = arrSesion[1];*/
			
			
		}
		
	}
}