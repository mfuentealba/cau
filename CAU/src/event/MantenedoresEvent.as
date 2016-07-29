package event
{
	import flash.events.Event;
	
	
	public class MantenedoresEvent extends BaseEvent
	{
		public static const LISTAR_PERFILES:String = 'getAllPerfiles';
		public static const LISTAR_GRUPORESOLUTOR:String = 'getAllGrupoResolutor';
		/*public static const MODIFICAR:String = 'updateSucursales';
		public static const ELIMINAR:String = 'deleteSucursales';*/
		
		
		 
		
		public function MantenedoresEvent(type:String, _callback:Function = null)
		{
			super(type, bubbles, cancelable);
			clase = "MantenedoresEvent";
			callback = _callback;
		}
	}
}