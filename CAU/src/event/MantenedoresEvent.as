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
		public static const BUSCA_CATEGORIAS_ASOCIADAS:String = 'getClasificacionCategorias';
		public static const AGREGAR_CATEGORIAS:String = 'setClasificacionCategorias';
		public static const ELIMINAR_CLASIFICACION_CATEGORIAS:String = 'removeClasificacionCategorias';
		public static const CREAR_CLASIFICACION:String = 'saveClasificacion';
		public static const MODIFICAR_CLASIFICACION:String = 'updateClasificacion';
		public static const ELIMINAR_CLASIFICACION:String = 'deleteClasificacion';
		/*public static const MODIFICAR:String = 'updateSucursales';
		public static const ELIMINAR:String = 'deleteSucursales';*/
		
		public var item:*;
		 
		
		public function MantenedoresEvent(type:String, _callback:Function = null, _item:* = null)
		{
			super(type, bubbles, cancelable);
			clase = "MantenedoresEvent";
			callback = _callback;
			this.item = _item;
		}
	}
}