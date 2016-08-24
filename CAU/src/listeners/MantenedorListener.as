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
	import mx.rpc.remoting.Operation;
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
				case MantenedoresEvent.LISTAR_TIEMPO_SOLUCION:
					trace("LISTAR_TIEMPO_SOLUCION_INI");
					rmtObj[evento.type].send();
					
					break;
				case MantenedoresEvent.LISTAR_FORMA_ATENCION:
					trace("LISTAR_FORMA_ATENCION_INI");
					rmtObj[evento.type].send();
					
					break;
				
				/***************************************************************/
				
				case MantenedoresEvent.BUSCA_CATEGORIAS_ASOCIADAS:
					trace("BUSCA_CATEGORIAS_ASOCIADAS_INI");
					var str:String = com.adobe.serialization.json.JSON.encode(evento.item);
					rmtObj[evento.type].send(evento.item.idClas.idClasificacion);
					rmtObj.item = evento.item['idClas'];
					rmtObj.callback = evento.callback;
					break;
				case MantenedoresEvent.AGREGAR_CATEGORIAS:
					trace("AGREGAR_CATEGORIAS_INI");
					
					rmtObj[evento.type].send(evento.item[0].idClasificacion, evento.item[1]);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					break;
				case MantenedoresEvent.ELIMINAR_CLASIFICACION_CATEGORIAS:
					trace("ELIMINAR_CATEGORIAS_INI");
					
					rmtObj[evento.type].send(evento.item[0].idClasificacion, evento.item[1]);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					break;
				
				case MantenedoresEvent.CREAR_CLASIFICACION:
					var obj:Object = {idClasificacion: evento.item[0].idClasificacion, nombreClasificacion: evento.item[0].nombreClasificacion};
					str = com.adobe.serialization.json.JSON.encode(obj);
					Operation(rmtObj[evento.type]).send(evento.item[0].nombreClasificacion);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					
					break;
				case MantenedoresEvent.MODIFICAR_CLASIFICACION:
					obj = {idClasificacion: evento.item[0].idClasificacion, nombreClasificacion: evento.item[0].nombreClasificacion};
					str = com.adobe.serialization.json.JSON.encode(obj);
					rmtObj[evento.type].send([evento.item[0].idClasificacion, evento.item[0].nombreClasificacion]);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					
					break;
				case MantenedoresEvent.ELIMINAR_CLASIFICACION:
					rmtObj[evento.type].send(evento.item[0].idClasificacion);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					
					break;
				/***************************************/
				case MantenedoresEvent.BUSCA_SUBCATEGORIAS_ASOCIADAS:
					trace("BUSCA_SUBCATEGORIAS_ASOCIADAS");
					//str = com.adobe.serialization.json.JSON.encode(evento.item);
					rmtObj[evento.type].send(evento.item.idCategoria.obj.idCategoria, evento.item.idClas);
					rmtObj.item = evento.item['idCategoria']['obj'];
					rmtObj.callback = evento.callback;
					break;
				case MantenedoresEvent.AGREGAR_SUBCATEGORIAS:
					trace("AGREGAR_SUBCATEGORIAS");
					
					rmtObj[evento.type].send(evento.item[0].idCategoria, evento.item[1]);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					break;
				case MantenedoresEvent.ELIMINAR_CATEGORIA_SUBCATEGORIA:
					trace("ELIMINAR_CATEGORIA_SUBCATEGORIA");
					
					rmtObj[evento.type].send(evento.item[0].idCategoria, evento.item[1]);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					break;
				
				case MantenedoresEvent.CREAR_CATEGORIA:
					trace("CREAR_CATEGORIA");
					obj = {idCategoria: evento.item[0].idCategoria, nombreCategoria: evento.item[0].nombreCategoria};
					str = com.adobe.serialization.json.JSON.encode(obj);
					rmtObj[evento.type].send(evento.item[0].nombreCategoria, evento.item[1].source);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					
					break;
				case MantenedoresEvent.MODIFICAR_CATEGORIA:
					trace("MODIFICAR_CATEGORIA");
					obj = {idCategoria: evento.item[0].idCategoria, nombreCategoria: evento.item[0].nombreCategoria};
					str = com.adobe.serialization.json.JSON.encode(obj);
					rmtObj[evento.type].send([evento.item[0].idCategoria, evento.item[0].nombreCategoria]);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					
					
					break;
				case MantenedoresEvent.ELIMINAR_CATEGORIA:
					trace("ELIMINAR_CATEGORIA");
					rmtObj[evento.type].send(evento.item[0]['obj'].idCategoria);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					
					
					break;
				
				
				/***************************************/
				case MantenedoresEvent.BUSCA_PROBLEMAS_ASOCIADOS:
					trace("BUSCA_SUBCATEGORIAS_ASOCIADAS");
					//str = com.adobe.serialization.json.JSON.encode(evento.item);
					rmtObj[evento.type].send(evento.item.idSubCategoria.obj.idSubCategoria, evento.item.idCategoria, evento.item.idClas);
					rmtObj.item = evento.item['idSubCategoria']['obj'];
					rmtObj.callback = evento.callback;
					break;
				case MantenedoresEvent.AGREGAR_PROBLEMAS:
					trace("AGREGAR_SUBCATEGORIAS");
					
					rmtObj[evento.type].send(evento.item[0].idSubCategoria, evento.item[1]);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					break;
				case MantenedoresEvent.ELIMINAR_SUBCATEGORIA_PROBLEMAS:
					trace("ELIMINAR_CATEGORIA_SUBCATEGORIA");
					
					rmtObj[evento.type].send(evento.item[0].idSubCategoria, evento.item[1]);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					break;
				
				case MantenedoresEvent.CREAR_SUBCATEGORIAS:
					obj = {idSubCategoria: evento.item[0].idSubCategoria, nombreSubCategoria: evento.item[0].nombreSubCategoria};
					str = com.adobe.serialization.json.JSON.encode(obj);
					rmtObj[evento.type].send(evento.item[0].nombreSubCategoria, evento.item[1], evento.item[2].source);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					
					break;
				case MantenedoresEvent.MODIFICAR_SUBCATEGORIAS:
					obj = {idSubCategoria: evento.item[0].idSubCategoria, nombreSubCategoria: evento.item[0].nombreSubCategoria};
					str = com.adobe.serialization.json.JSON.encode(obj);
					rmtObj[evento.type].send([evento.item[0].idSubCategoria, evento.item[0].nombreSubCategoria]);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					
					
					break;
				case MantenedoresEvent.ELIMINAR_SUBCATEGORIAS:
					rmtObj[evento.type].send(evento.item[0]['obj'].idSubCategoria);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					
					
					break;
				
				
				
				
				/***************************************/
				case MantenedoresEvent.CREAR_PROBLEMAS:
					obj = {idDescripcion: evento.item[0].idDescripcion, nombreDescripcion: evento.item[0].nombreDescripcion};
					str = com.adobe.serialization.json.JSON.encode(obj);
					rmtObj[evento.type].send(evento.item[0].nombreDescripcion, evento.item[0].idFormaAtencion, evento.item[0].idTiempoSolucion, evento.item[1], evento.item[2], evento.item[3].source);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					
					break;
				case MantenedoresEvent.MODIFICAR_PROBLEMAS:
					obj = {idDescripcion: evento.item[0].idDescripcion, nombreDescripcion: evento.item[0].nombreDescripcion, idFormaAtencion: evento.item[0].idFormaAtencion, idTiempoSolucion: evento.item[0].idTiempoSolucion};
					str = com.adobe.serialization.json.JSON.encode(obj);
					rmtObj[evento.type].send([evento.item[0].idDescripcion, evento.item[0].nombreDescripcion, evento.item[0].idFormaAtencion, evento.item[0].idTiempoSolucion]);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					
					
					break;
				case MantenedoresEvent.ELIMINAR_PROBLEMAS:
					rmtObj[evento.type].send(evento.item[0]['obj'].idDescripcion);
					rmtObj.item = evento.item[0];
					rmtObj.callback = evento.callback;
					
					
					break;
				
				/***************************************/
				
				
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
			var objTipificacion:Object = {CLASIFICACION:{arrIn : 'arrAsociadosIn', arrOut: 'arrAsociadosOut', idPrincipal: 'idClasificacion', id: 'idCategoria', obj: 'objCategoria', arr: 'arrClasificacion', objPropio: 'objClasificacion'},
											CATEGORIAS: {arrIn : 'arrAsociadosIn', arrOut: 'arrAsociadosOut', idPrincipal: 'idCategoria', id: 'idSubCategoria', obj: 'objSubCategoria', arr: 'arrCategoria', objPropio: 'objCategoria'},
										 SUBCATEGORIAS: {arrIn : 'arrAsociadosIn', arrOut: 'arrAsociadosOut', idPrincipal: 'idSubCategoria', id: 'idDescripcion', obj: 'objDescripcion', arr: 'arrSubCategoria', objPropio: 'objSubCategoria'},
										 PROBLEMAS: {id: 'idDescripcion', arr: 'arrDescripcion', objPropio: 'objDescripcion', idPrincipal: 'idDescripcion'}
										};
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
				
				case MantenedoresEvent.LISTAR_TIEMPO_SOLUCION:
					modelApp.arrTiempoSolucion = new ArrayCollection(data.result as Array);
					modelApp.arrTiempoSolucion.source.forEach(fnDictTiemposolucion);
					trace("LISTAR_TIEMPO_SOLUCION");
					break;
				case MantenedoresEvent.LISTAR_FORMA_ATENCION:
					modelApp.arrFormaAtencion = new ArrayCollection(data.result as Array);
					modelApp.arrFormaAtencion.source.forEach(fnDictFormaAtencion);
					trace("LISTAR_FORMA_ATENCION");
					break;
				
				
				/****************************************/
				case MantenedoresEvent.BUSCA_CATEGORIAS_ASOCIADAS:
					var opt:String = 'CLASIFICACION';
					var arr:Array = data.result as Array;
					data.target['item'][objTipificacion[opt]['arrIn']] = new ArrayCollection();
					data.target['item'][objTipificacion[opt]['arrOut']] = new ArrayCollection();
					for each(var obj:* in arr){
						if(modelApp[objTipificacion[opt]['obj']].hasOwnProperty(obj[objTipificacion[opt]['id']])){
							if(obj['sel'] == 1){
								data.target['item'][objTipificacion[opt]['arrIn']].addItem({obj: modelApp[objTipificacion[opt]['obj']][obj[objTipificacion[opt]['id']]], sel: true});	
							} else {
								data.target['item'][objTipificacion[opt]['arrOut']].addItem({obj: modelApp[objTipificacion[opt]['obj']][obj[objTipificacion[opt]['id']]], sel: false});
							}
							
						}
						
					}
					data.target['callback'].call(null, data.target['item']); 
					trace("BUSCA_CATEGORIAS_ASOCIADAS");
					break;
				case MantenedoresEvent.AGREGAR_CATEGORIAS:
					opt = 'CLASIFICACION';
					arr = data.result as Array;
					data.target['item'][objTipificacion[opt]['arrIn']] = new ArrayCollection();
					data.target['item'][objTipificacion[opt]['arrOut']] = new ArrayCollection();
					for each(obj in arr){
						if(modelApp[objTipificacion[opt]['obj']].hasOwnProperty(obj[objTipificacion[opt]['id']])){
							if(obj['sel'] == 1){
								data.target['item'][objTipificacion[opt]['arrIn']].addItem({obj: modelApp[objTipificacion[opt]['obj']][obj[objTipificacion[opt]['id']]], sel: true});	
							} else {
								data.target['item'][objTipificacion[opt]['arrOut']].addItem({obj: modelApp[objTipificacion[opt]['obj']][obj[objTipificacion[opt]['id']]], sel: false});
							}
							
						}
						
					}
					data.target['callback'].call(null, data.target['item']);
					trace("AGREGAR_CATEGORIAS");
					break;
				
				case MantenedoresEvent.ELIMINAR_CLASIFICACION_CATEGORIAS:
					opt = 'CLASIFICACION';
					arr = data.result as Array;
					data.target['item'][objTipificacion[opt]['arrIn']] = new ArrayCollection();
					data.target['item'][objTipificacion[opt]['arrOut']] = new ArrayCollection();
					for each(obj in arr){
						if(modelApp[objTipificacion[opt]['obj']].hasOwnProperty(obj[objTipificacion[opt]['id']])){
							if(obj['sel'] == 1){
								data.target['item'][objTipificacion[opt]['arrIn']].addItem({obj: modelApp[objTipificacion[opt]['obj']][obj[objTipificacion[opt]['id']]], sel: true});	
							} else {
								data.target['item'][objTipificacion[opt]['arrOut']].addItem({obj: modelApp[objTipificacion[opt]['obj']][obj[objTipificacion[opt]['id']]], sel: false});
							}
							
						}
						
					}
					data.target['callback'].call(null, data.target['item']);
					trace("ELIMINAR_CATEGORIAS");
					break;
				
				case MantenedoresEvent.CREAR_CLASIFICACION:
					opt = 'CLASIFICACION';
					if(data.result.hasOwnProperty(objTipificacion[opt]['idPrincipal'])){
						modelApp[objTipificacion[opt]['arr']].addItem(data.result);
						modelApp[objTipificacion[opt]['objPropio']][data.result[objTipificacion[opt]['idPrincipal']]] = data.result;
						data.target.callback.call(null, data.result);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					break;
				case MantenedoresEvent.MODIFICAR_CLASIFICACION:
					opt = 'CLASIFICACION';
					if(data.result.hasOwnProperty(objTipificacion[opt]['idPrincipal'])){
						Alert.show("Registro modificado con éxito", "Información");
						data.target.callback.call(null, data.result, ModelApp.CLASIFICACION);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					break;
				case MantenedoresEvent.ELIMINAR_CLASIFICACION:
					opt = 'CLASIFICACION';
					if(data.result == data.target.item[objTipificacion[opt]['idPrincipal']]){
						Alert.show("Registro eliminado con éxito", "Información");
						data.target.callback.call(null, data.result, ModelApp.CLASIFICACION);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					
					break;
				
				/*********************************************************/
				case MantenedoresEvent.BUSCA_SUBCATEGORIAS_ASOCIADAS:
					opt = 'CATEGORIAS';
					arr = data.result as Array;
					data.target['item'][objTipificacion[opt]['arrIn']] = new ArrayCollection();
					data.target['item'][objTipificacion[opt]['arrOut']] = new ArrayCollection();
					for each(obj in arr){
						if(modelApp[objTipificacion[opt]['obj']].hasOwnProperty(obj[objTipificacion[opt]['id']])){
							if(obj['sel'] == 1){
								data.target['item'][objTipificacion[opt]['arrIn']].addItem({obj: modelApp[objTipificacion[opt]['obj']][obj[objTipificacion[opt]['id']]], sel: true});	
							} else {
								data.target['item'][objTipificacion[opt]['arrOut']].addItem({obj: modelApp[objTipificacion[opt]['obj']][obj[objTipificacion[opt]['id']]], sel: false});
							}
							
						}
						
					}
					data.target['callback'].call(null, data.target['item']); 
					trace("BUSCA_CATEGORIAS_ASOCIADAS");
					break;
				case MantenedoresEvent.AGREGAR_SUBCATEGORIAS:
					opt = 'CATEGORIAS';
					arr = data.result as Array;
					data.target['item'][objTipificacion[opt]['arrIn']] = new ArrayCollection();
					data.target['item'][objTipificacion[opt]['arrOut']] = new ArrayCollection();
					for each(obj in arr){
					if(modelApp[objTipificacion[opt]['obj']].hasOwnProperty(obj[objTipificacion[opt]['id']])){
						if(obj['sel'] == 1){
							data.target['item'][objTipificacion[opt]['arrIn']].addItem({obj: modelApp[objTipificacion[opt]['obj']][obj[objTipificacion[opt]['id']]], sel: true});	
						} else {
							data.target['item'][objTipificacion[opt]['arrOut']].addItem({obj: modelApp[objTipificacion[opt]['obj']][obj[objTipificacion[opt]['id']]], sel: false});
						}
						
					}
					
				}
					data.target['callback'].call(null, data.target['item']);
					trace("AGREGAR_CATEGORIAS");
					break;
				
				case MantenedoresEvent.ELIMINAR_CATEGORIA_SUBCATEGORIA:
					opt = 'CATEGORIAS';
					arr = data.result as Array;
					data.target['item'][objTipificacion[opt]['arrIn']] = new ArrayCollection();
					data.target['item'][objTipificacion[opt]['arrOut']] = new ArrayCollection();
					for each(obj in arr){
						if(modelApp[objTipificacion[opt]['obj']].hasOwnProperty(obj[objTipificacion[opt]['id']])){
							if(obj['sel'] == 1){
								data.target['item'][objTipificacion[opt]['arrIn']].addItem({obj: modelApp[objTipificacion[opt]['obj']][obj[objTipificacion[opt]['id']]], sel: true});	
							} else {
								data.target['item'][objTipificacion[opt]['arrOut']].addItem({obj: modelApp[objTipificacion[opt]['obj']][obj[objTipificacion[opt]['id']]], sel: false});
							}
							
						}
						
					}
					data.target['callback'].call(null, data.target['item']);
					trace("ELIMINAR_CATEGORIAS");
					break;
				
				case MantenedoresEvent.CREAR_CATEGORIA:
					opt = 'CATEGORIAS';
					if(data.result.hasOwnProperty(objTipificacion[opt]['idPrincipal'])){
						modelApp[objTipificacion[opt]['arr']].addItem(data.result);
						modelApp[objTipificacion[opt]['objPropio']][data.result[objTipificacion[opt]['idPrincipal']]] = data.result;
						data.target.callback.call(null, data.result);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					break;
				case MantenedoresEvent.MODIFICAR_CATEGORIA:
					opt = 'CATEGORIAS';
					if(data.result.hasOwnProperty(objTipificacion[opt]['idPrincipal'])){
						Alert.show("Registro modificado con éxito", "Información");
						data.target.callback.call(null, data.result, ModelApp.CATEGORIA);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					break;
				case MantenedoresEvent.ELIMINAR_CATEGORIA:
					opt = 'CATEGORIAS';
					if(data.result == data.target.item['obj'][objTipificacion[opt]['idPrincipal']]){
						Alert.show("Registro eliminado con éxito", "Información");
						data.target.callback.call(null, data.result, ModelApp.CATEGORIA);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					
					break;
				/*********************************************************/
				case MantenedoresEvent.BUSCA_PROBLEMAS_ASOCIADOS:
					opt = 'SUBCATEGORIAS';
					arr = data.result as Array;
					data.target['item'][objTipificacion[opt]['arrIn']] = new ArrayCollection();
					data.target['item'][objTipificacion[opt]['arrOut']] = new ArrayCollection();
					for each(obj in arr){
					if(modelApp[objTipificacion[opt]['obj']].hasOwnProperty(obj[objTipificacion[opt]['id']])){
						if(obj['sel'] == 1){
							data.target['item'][objTipificacion[opt]['arrIn']].addItem({obj: modelApp[objTipificacion[opt]['obj']][obj[objTipificacion[opt]['id']]], sel: true});	
						} else {
							data.target['item'][objTipificacion[opt]['arrOut']].addItem({obj: modelApp[objTipificacion[opt]['obj']][obj[objTipificacion[opt]['id']]], sel: false});
						}
						
					}
					
				}
					data.target['callback'].call(null, data.target['item']); 
					trace("BUSCA_CATEGORIAS_ASOCIADAS");
					break;
				case MantenedoresEvent.AGREGAR_PROBLEMAS:
					opt = 'SUBCATEGORIAS';
					arr = data.result as Array;
					data.target['item'][objTipificacion[opt]['arrIn']] = new ArrayCollection();
					data.target['item'][objTipificacion[opt]['arrOut']] = new ArrayCollection();
					for each(obj in arr){
					if(modelApp[objTipificacion[opt]['obj']].hasOwnProperty(obj[objTipificacion[opt]['id']])){
						if(obj['sel'] == 1){
							data.target['item'][objTipificacion[opt]['arrIn']].addItem({obj: modelApp[objTipificacion[opt]['obj']][obj[objTipificacion[opt]['id']]], sel: true});	
						} else {
							data.target['item'][objTipificacion[opt]['arrOut']].addItem({obj: modelApp[objTipificacion[opt]['obj']][obj[objTipificacion[opt]['id']]], sel: false});
						}
						
					}
					
				}
					data.target['callback'].call(null, data.target['item']);
					trace("AGREGAR_CATEGORIAS");
					break;
				
				case MantenedoresEvent.ELIMINAR_SUBCATEGORIA_PROBLEMAS:
					opt = 'SUBCATEGORIAS';
					arr = data.result as Array;
					data.target['item'][objTipificacion[opt]['arrIn']] = new ArrayCollection();
					data.target['item'][objTipificacion[opt]['arrOut']] = new ArrayCollection();
					for each(obj in arr){
					if(modelApp[objTipificacion[opt]['obj']].hasOwnProperty(obj[objTipificacion[opt]['id']])){
						if(obj['sel'] == 1){
							data.target['item'][objTipificacion[opt]['arrIn']].addItem({obj: modelApp[objTipificacion[opt]['obj']][obj[objTipificacion[opt]['id']]], sel: true});	
						} else {
							data.target['item'][objTipificacion[opt]['arrOut']].addItem({obj: modelApp[objTipificacion[opt]['obj']][obj[objTipificacion[opt]['id']]], sel: false});
						}
						
					}
					
				}
					data.target['callback'].call(null, data.target['item']);
					trace("ELIMINAR_CATEGORIAS");
					break;
				
				case MantenedoresEvent.CREAR_SUBCATEGORIAS:
					opt = 'SUBCATEGORIAS';
					if(data.result.hasOwnProperty(objTipificacion[opt]['idPrincipal'])){
						modelApp[objTipificacion[opt]['arr']].addItem(data.result);
						modelApp[objTipificacion[opt]['objPropio']][data.result[objTipificacion[opt]['idPrincipal']]] = data.result;
						data.target.callback.call(null, data.result);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					break;
				case MantenedoresEvent.MODIFICAR_SUBCATEGORIAS:
					opt = 'SUBCATEGORIAS';
					if(data.result.hasOwnProperty(objTipificacion[opt]['idPrincipal'])){
						Alert.show("Registro modificado con éxito", "Información");
						data.target.callback.call(null, data.result, ModelApp.SUBCATEGORIA);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					break;
				case MantenedoresEvent.ELIMINAR_SUBCATEGORIAS:
					opt = 'SUBCATEGORIAS';
					if(data.result == data.target.item['obj'][objTipificacion[opt]['idPrincipal']]){
						Alert.show("Registro eliminado con éxito", "Información");
						data.target.callback.call(null, data.result, ModelApp.SUBCATEGORIA);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					
					break;
				
				
				/******************************************************/
				
				case MantenedoresEvent.CREAR_PROBLEMAS:
					opt = 'PROBLEMAS';
					if(data.result.hasOwnProperty(objTipificacion[opt]['id'])){
						modelApp[objTipificacion[opt]['arr']].addItem(data.result);
						modelApp[objTipificacion[opt]['objPropio']][data.result[objTipificacion[opt]['idPrincipal']]] = data.result;
						data.target.callback.call(null, data.result);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					break;
				case MantenedoresEvent.MODIFICAR_PROBLEMAS:
					opt = 'PROBLEMAS';
					if(data.result.hasOwnProperty(objTipificacion[opt]['id'])){
						Alert.show("Registro modificado con éxito", "Información");
						data.target.callback.call(null, data.result, ModelApp.PROBLEMA);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					break;
				case MantenedoresEvent.ELIMINAR_PROBLEMAS:
					opt = 'PROBLEMAS';
					if(data.result == data.target.item['obj'][objTipificacion[opt]['id']]){
						Alert.show("Registro eliminado con éxito", "Información");
						data.target.callback.call(null, data.result, ModelApp.PROBLEMA);	
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
		
		
		private static function fnDictTiemposolucion(item:*, index:int, arr:Array):void{
			modelApp.objTiempoSolucion[item.idTiempoSolucion + ''] = item;
		}
		
		private static function fnDictFormaAtencion(item:*, index:int, arr:Array):void{
			modelApp.objFormaAtencion[item.idFormaAtencion + ''] = item;
		}
		
		public static function fault(info:Object):void
		{
		}
	}
}