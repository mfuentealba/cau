package controller
{
	import event.ClienteEvent;
	import event.MantenedoresEvent;
	import event.SucursalEvent;
	import event.TicketEvent;
	import event.UsuarioEvent;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import listeners.ClienteListener;
	import listeners.MantenedorListener;
	import listeners.SucursalListener;
	import listeners.TicketListener;
	import listeners.UsuarioListener;
	
	import model.ModelApp;
	
	public class Controller extends ControllerBase
	{
		public static var controladorGeneral:Controller;
		[Bindable] private var modelApp:ModelApp = ModelApp.getInstance();
		
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
		}	
	}
}