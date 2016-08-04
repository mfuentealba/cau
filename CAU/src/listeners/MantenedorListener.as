package listeners
{
	import com.adobe.serialization.json.JSON;
	
	import event.MantenedoresEvent;
	
	import flash.events.Event;
	import flash.net.Responder;
	
	import model.ModelApp;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import services.CustomRemoteObject;
	import services.ServiceRO;
	
	import vo.CategoriaVO;
	import vo.ClasificacionVO;
	import vo.DescripcionVO;
	import vo.GrupoResolutorVO;
	import vo.PerfilVO;
	import vo.SubCategoriaVO;
	
	public class MantenedorListener //implements IBaseListener
	{
		private static var evento:MantenedoresEvent;		
		private static var modelApp:ModelApp = ModelApp.getInstance();
		
		
		public static function exec(_evento:Event):void{
			evento = MantenedoresEvent(_evento);
			var rmtObj:CustomRemoteObject = ServiceRO.fnRmtObjMantenedores(); 
			rmtObj.addEventListener(ResultEvent.RESULT, result);
			switch(evento.type){
				case MantenedoresEvent.LISTAR_PERFILES:
					trace("LISTAR_PERFILES_INI");
					rmtObj.getAllPerfiles();
					//modelApp.rmtObjMant.getAllPerfiles();
					break;
				case MantenedoresEvent.LISTAR_GRUPORESOLUTOR:
					trace("LISTAR_GRUPORESOLUTOR_INI");
					rmtObj.getAllGrupoResolutor();
					
					break;
				
				case MantenedoresEvent.LISTAR_CLASIFICACION:
					trace("LISTAR_CLASIFICACION_INI");
					rmtObj.getAllClasificacion();
					//modelApp.rmtObjMant.getAllPerfiles();
					break;
				case MantenedoresEvent.LISTAR_CATEGORIAS:
					trace("LISTAR_CATEGORIAS_INI");
					rmtObj.getAllCategoria();
					
					break;
				case MantenedoresEvent.LISTAR_SUBCATEGORIAS:
					trace("LISTAR_SUBCATEGORIAS_INI");
					rmtObj.getAllSubCategoria();
					//modelApp.rmtObjMant.getAllPerfiles();
					break;
				case MantenedoresEvent.LISTAR_DESCRIPCION:
					trace("LISTAR_DESCRIPCION_INI");
					rmtObj.getAllDescripcion();
					
					break;
				
				case MantenedoresEvent.BUSCA_CATEGORIAS_ASOCIADAS:
					trace("BUSCA_CATEGORIAS_ASOCIADAS_INI");
					var str:String = com.adobe.serialization.json.JSON.encode(evento.item);
					rmtObj.getClasificacionCategorias(evento.item.idClasificacion);
					rmtObj.item = evento.item;
					rmtObj.callback = evento.callback;
					break;
				case MantenedoresEvent.AGREGAR_CATEGORIAS:
					trace("AGREGAR_CATEGORIAS_INI");
					
					rmtObj.setClasificacionCategorias(evento.item[0].idClasificacion, evento.item[1]);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					break;
				case MantenedoresEvent.ELIMINAR_CLASIFICACION_CATEGORIAS:
					trace("ELIMINAR_CATEGORIAS_INI");
					
					rmtObj.removeClasificacionCategorias(evento.item[0].idClasificacion, evento.item[1]);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					break;
				
				case MantenedoresEvent.CREAR_CLASIFICACION:
					var obj:Object = {idClasificacion: evento.item[0].idClasificacion, NombreClasificacion: evento.item[0].NombreClasificacion};
					str = com.adobe.serialization.json.JSON.encode(obj);
					rmtObj.saveClasificacion(evento.item[0].NombreClasificacion);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					
					break;
				case MantenedoresEvent.MODIFICAR_CLASIFICACION:
					obj = {idClasificacion: evento.item[0].idClasificacion, NombreClasificacion: evento.item[0].NombreClasificacion};
					str = com.adobe.serialization.json.JSON.encode(obj);
					rmtObj.updateClasificacion([evento.item[0].idClasificacion, evento.item[0].NombreClasificacion]);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					
					break;
				case MantenedoresEvent.ELIMINAR_CLASIFICACION:
					rmtObj.deleteClasificacion(evento.item[0].idClasificacion);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					
					break;
				/*case MantenedoresEvent.MODIFICAR:
					modelApp.rmtObjSucursales.updateSucursales(evento.sucursalVO);
					
					break;
				case MantenedoresEvent.ELIMINAR:
					modelApp.rmtObjSucursales.deleteSucursales(evento.sucursalVO.id);
					
					break;*/
				
			}
		}
		
		public static function result(data:ResultEvent):void
		{
			switch(data.token.message['operation']){
				case MantenedoresEvent.LISTAR_PERFILES:
					modelApp.arrPerfiles = new ArrayCollection(data.result as Array);
					modelApp.arrPerfiles.source.forEach(fnDictPerfil);
					trace("LISTAR_PERFILES");
					//var obj:Object = data.result;
					break;
				case MantenedoresEvent.LISTAR_GRUPORESOLUTOR:
					modelApp.arrGrupoResolutor = new ArrayCollection(data.result as Array);
					modelApp.arrGrupoResolutor.source.forEach(fnDictGrupoResolutor);
					trace("LISTAR_GRUPORESOLUTOR");
					break;
				case MantenedoresEvent.LISTAR_CLASIFICACION:
					modelApp.arrClasificacion = new ArrayCollection(data.result as Array);
					modelApp.arrClasificacion.source.forEach(fnDictClasificacion);
					trace("LISTAR_CLASIFICACION");
					break;
				case MantenedoresEvent.LISTAR_CATEGORIAS:
					modelApp.arrCategoria = new ArrayCollection(data.result as Array);
					modelApp.arrCategoria.source.forEach(fnDictCategoria);
					trace("LISTAR_CATEGORIAS");
					break;
				case MantenedoresEvent.LISTAR_SUBCATEGORIAS:
					modelApp.arrSubCategoria = new ArrayCollection(data.result as Array);
					modelApp.arrSubCategoria.source.forEach(fnDictSubCategoria);
					trace("LISTAR_SUBCATEGORIAS");
					break;
				case MantenedoresEvent.LISTAR_DESCRIPCION:
					modelApp.arrDescripcion = new ArrayCollection(data.result as Array);
					modelApp.arrDescripcion.source.forEach(fnDictDescripcion);
					trace("LISTAR_DESCRIPCION");
					break;
				case MantenedoresEvent.BUSCA_CATEGORIAS_ASOCIADAS:
					var arr:Array = data.result as Array;
					ClasificacionVO(data.target['item']).arrCategoriasIn = new ArrayCollection();
					ClasificacionVO(data.target['item']).arrCategoriasOut = new ArrayCollection();
					for each(var obj:* in arr){
						if(modelApp.objCategoria.hasOwnProperty(obj['idCategoria'])){
							if(obj['sel'] == 1){
								ClasificacionVO(data.target['item']).arrCategoriasIn.addItem({obj:modelApp.objCategoria[obj['idCategoria']], sel: true});	
							} else {
								ClasificacionVO(data.target['item']).arrCategoriasOut.addItem({obj:modelApp.objCategoria[obj['idCategoria']], sel: false});
							}
							
						}
						
					}
					data.target['callback'].call(null, data.target['item']); 
					trace("BUSCA_CATEGORIAS_ASOCIADAS");
					break;
				case MantenedoresEvent.AGREGAR_CATEGORIAS:
					arr = data.result as Array;
					ClasificacionVO(data.target['item']).arrCategoriasIn = new ArrayCollection();
					ClasificacionVO(data.target['item']).arrCategoriasOut = new ArrayCollection();
					for each(obj in arr){
						if(modelApp.objCategoria.hasOwnProperty(obj['idCategoria'])){
							if(obj['sel'] == 1){
								ClasificacionVO(data.target['item']).arrCategoriasIn.addItem({obj:modelApp.objCategoria[obj['idCategoria']], sel: true});	
							} else {
								ClasificacionVO(data.target['item']).arrCategoriasOut.addItem({obj:modelApp.objCategoria[obj['idCategoria']], sel: false});
							}
							
						}
						
					}
					data.target['callback'].call(null, data.target['item']);
					trace("AGREGAR_CATEGORIAS");
					break;
				
				case MantenedoresEvent.ELIMINAR_CLASIFICACION_CATEGORIAS:
					arr = data.result as Array;
					ClasificacionVO(data.target['item']).arrCategoriasIn = new ArrayCollection();
					ClasificacionVO(data.target['item']).arrCategoriasOut = new ArrayCollection();
					for each(obj in arr){
						if(modelApp.objCategoria.hasOwnProperty(obj['idCategoria'])){
							if(obj['sel'] == 1){
								ClasificacionVO(data.target['item']).arrCategoriasIn.addItem({obj:modelApp.objCategoria[obj['idCategoria']], sel: true});	
							} else {
								ClasificacionVO(data.target['item']).arrCategoriasOut.addItem({obj:modelApp.objCategoria[obj['idCategoria']], sel: false});
							}
							
						}
						
					}
					data.target['callback'].call(null, data.target['item']);
					trace("ELIMINAR_CATEGORIAS");
					break;
				
				case MantenedoresEvent.CREAR_CLASIFICACION:
					
					if(data.result.hasOwnProperty('idClasificacion')){
						modelApp.arrClasificacion.addItem(data.result);
						data.target.callback.call(null, data.result);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					break;
				case MantenedoresEvent.MODIFICAR_CLASIFICACION:
					if(data.result.hasOwnProperty('idClasificacion')){
						data.target.callback.call(null, data.result);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					break;
				case MantenedoresEvent.ELIMINAR_CLASIFICACION:
					if(data.result == data.target.item.idClasificacion){
						data.target.callback.call(null, data.result);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					
					break;
				
				/*case SucursalEvent.MODIFICAR:
					evento.callback.call(this, data.result);
					break;
				case SucursalEvent.ELIMINAR:
					evento.callback.call(this, data.result);
					
					break;*/
			}
		}
		
		private static function fnDictPerfil(item:PerfilVO, index:int, arr:Array):void{
			modelApp.objPerfiles[item.id + ''] = item;
		}
		
		private static function fnDictGrupoResolutor(item:GrupoResolutorVO, index:int, arr:Array):void{
			modelApp.objGrupoResolutor[item.idGrupoResolutor + ''] = item;
		}
		
		private static function fnDictClasificacion(item:ClasificacionVO, index:int, arr:Array):void{
			modelApp.objClasificacion[item.idClasificacion + ''] = item;
		}
		
		private static function fnDictCategoria(item:CategoriaVO, index:int, arr:Array):void{
			modelApp.objCategoria[item.idCategoria + ''] = item;
		}
		
		private static function fnDictSubCategoria(item:SubCategoriaVO, index:int, arr:Array):void{
			modelApp.objSubCategoria[item.idSubCategoria + ''] = item;
		}
		
		private static function fnDictDescripcion(item:DescripcionVO, index:int, arr:Array):void{
			modelApp.objDescripcion[item.idDescripcion + ''] = item;
		}
		
		
		public static function fault(info:Object):void
		{
		}
	}
}