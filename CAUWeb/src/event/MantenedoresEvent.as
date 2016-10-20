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
		public static const LISTAR_TIEMPO_SOLUCION:String = 'getAllTiempoSolucion';
		public static const LISTAR_FORMA_ATENCION:String = 'getAllFormaAtencion';
		
		public static const BUSCA_CATEGORIAS_ASOCIADAS:String = 'getClasificacionCategorias';
		public static const AGREGAR_CATEGORIAS:String = 'setClasificacionCategorias';
		public static const ELIMINAR_CLASIFICACION_CATEGORIAS:String = 'removeClasificacionCategorias';
		public static const CREAR_CLASIFICACION:String = 'saveClasificacion';
		public static const MODIFICAR_CLASIFICACION:String = 'updateClasificacion';
		public static const ELIMINAR_CLASIFICACION:String = 'deleteClasificacion';
		
		public static const BUSCA_SUBCATEGORIAS_ASOCIADAS:String = 'getCategoriaSubcategorias';
		public static const AGREGAR_SUBCATEGORIAS:String = 'setCategoriaSubcategoria';
		public static const ELIMINAR_CATEGORIA_SUBCATEGORIA:String = 'removeCategoriaSubcategoria';
		public static const CREAR_CATEGORIA:String = 'saveCategoria';
		public static const MODIFICAR_CATEGORIA:String = 'updateCategoria';
		public static const ELIMINAR_CATEGORIA:String = 'deleteCategoria';
		
		public static const BUSCA_PROBLEMAS_ASOCIADOS:String = 'getSubcategoriaProblemas';
		public static const AGREGAR_PROBLEMAS:String = 'setSubcategoriaProblema';
		public static const ELIMINAR_SUBCATEGORIA_PROBLEMAS:String = 'removeSubcategoriaProblema';
		public static const CREAR_SUBCATEGORIAS:String = 'saveSubcategoria';
		public static const MODIFICAR_SUBCATEGORIAS:String = 'updateSubCategoria';
		public static const ELIMINAR_SUBCATEGORIAS:String = 'deleteSubcategoria';
		
		public static const CREAR_PROBLEMAS:String = 'saveProblemas';
		public static const MODIFICAR_PROBLEMAS:String = 'updateProblema';
		public static const ELIMINAR_PROBLEMAS:String = 'deleteProblemas';
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