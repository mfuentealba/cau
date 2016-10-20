package event
{
	import flash.events.Event;
	
	import vo.SucursalVO;
	
	public class SucursalEvent extends BaseEvent
	{
		public static const LISTAR:String = 'getAllSucursales';
		public static const CREAR:String = 'createSucursales';
		public static const MODIFICAR:String = 'updateSucursales';
		public static const ELIMINAR:String = 'deleteSucursales';
		
		
		 
		public var sucursalVO:SucursalVO;
		
		public function SucursalEvent(type:String, _sucursalVO:SucursalVO = null, _callback:Function = null)
		{
			super(type, bubbles, cancelable);
			clase = "SucursalEvent";
			sucursalVO = _sucursalVO;
			callback = _callback;
		}
	}
}