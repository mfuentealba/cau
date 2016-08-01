package event
{
	import flash.events.Event;
	
	
	public class MantenedoresEvent extends BaseEvent
	{
		public static const LISTAR_PERFILES:String = 'getAllPerfiles';
		public static const LISTAR_GRUPORESOLUTOR:String = 'getAllGrupoResolutor';
		public static const LISTAR_CLASIFICACION:String = 'getAllClasificacion';
		public static const LISTAR_CATEGORIAS:String = 'getAllCategoria';
		public static const LISTAR_SUBCATEGORIAS:String = 'getAllSubCategoria';
		public static const LISTAR_DESCRIPCION:String = 'getAllDescripcion';
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