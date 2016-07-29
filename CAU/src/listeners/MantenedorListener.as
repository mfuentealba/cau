package listeners
{
	import event.MantenedoresEvent;
	
	import flash.events.Event;
	import flash.net.Responder;
	
	import model.ModelApp;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import services.ServiceRO;
	
	import vo.GrupoResolutorVO;
	import vo.PerfilVO;
	
	public class MantenedorListener //implements IBaseListener
	{
		private static var evento:MantenedoresEvent;		
		private static var modelApp:ModelApp = ModelApp.getInstance();
		
		
		public static function exec(_evento:Event):void{
			evento = MantenedoresEvent(_evento);
			var rmtObj:RemoteObject = ServiceRO.fnRmtObjMantenedores(); 
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
					//modelApp.arrGrupoResolutor.filterFunction = modelApp.fnGrupoResolutorFilter;
					modelApp.arrGrupoResolutor.source.forEach(fnDictGrupoResolutor);
					trace("LISTAR_GRUPORESOLUTOR");
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
		
		
		public static function fault(info:Object):void
		{
		}
	}
}