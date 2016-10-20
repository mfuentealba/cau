package listeners
{
	import event.SucursalEvent;
	
	import flash.events.Event;
	import flash.net.Responder;
	
	import model.ModelApp;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import services.ServiceRO;
	
	import vo.SucursalVO;
	
	public class SucursalListener //implements IBaseListener
	{
		private static var evento:SucursalEvent;		
		private static var modelApp:ModelApp = ModelApp.getInstance();
		
		
		
		public static function exec(_evento:Event):void{
			var rmtObjSucursales:RemoteObject = ServiceRO.fnRmtObjSucursales();
			rmtObjSucursales.addEventListener(ResultEvent.RESULT, result);
			evento = SucursalEvent(_evento);
			switch(evento.type){
				case SucursalEvent.LISTAR:
					rmtObjSucursales.getAllSucursales();
					
					break;
				case SucursalEvent.CREAR:
					rmtObjSucursales.createSucursales(evento.sucursalVO);
					
					break;
				case SucursalEvent.MODIFICAR:
					rmtObjSucursales.updateSucursales(evento.sucursalVO);
					
					break;
				case SucursalEvent.ELIMINAR:
					rmtObjSucursales.deleteSucursales(evento.sucursalVO.id);
					
					break;
				
			}
		}
		
		public static function result(data:ResultEvent):void
		{
			switch(data.token.message['operation']){
				case SucursalEvent.LISTAR:
					modelApp.arrSucursales = new ArrayCollection(data.result as Array);
					modelApp.arrSucursalesTodas = new ArrayCollection(data.result as Array);
					modelApp.arrSucursales.filterFunction = modelApp.fnSucursalesFilter;
					//var obj:Object = data.result;
					modelApp.arrSucursalesTodas.source.forEach(fnDict);
					evento.callback.call(null);
					break;
				case SucursalEvent.CREAR:
					modelApp.arrSucursales.addItem(data.result);
					evento.callback.call(null, null);
					break;
				case SucursalEvent.MODIFICAR:
					evento.callback.call(null, data.result);
					break;
				case SucursalEvent.ELIMINAR:
					evento.callback.call(null, data.result);
					
					break;
			}
			//delete this;
		}
		
		private static function fnDict(item:SucursalVO, index:int, arr:Array):void{
			modelApp.objSucursales[item.id + ''] = item;
		}
		
		public static function fault(info:Object):void
		{
		}
	}
}