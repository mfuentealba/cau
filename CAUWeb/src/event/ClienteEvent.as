package event
{
	import flash.events.Event;
	
	import vo.ClienteVO;
	
	public class ClienteEvent extends BaseEvent
	{
		public static const LISTAR:String = 'getAllClientes';
		public static const CREAR:String = 'createClientes';
		public static const MODIFICAR:String = 'updateClientes';
		public static const ELIMINAR:String = 'deleteClientes';
		
		
		 
		public var clienteVO:ClienteVO;
		
		public function ClienteEvent(type:String, _clienteVO:ClienteVO = null, _callback:Function = null)
		{
			super(type, bubbles, cancelable);
			clase = "ClientesEvent";
			clienteVO = _clienteVO;
			callback = _callback;
		}
	}
}