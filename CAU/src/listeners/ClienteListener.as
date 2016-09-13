package listeners
{
	import event.ClienteEvent;
	
	import flash.events.Event;
	import flash.net.Responder;
	
	import model.ModelApp;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import services.ServiceRO;
	
	import vo.ClienteVO;
	
	public class ClienteListener //implements IBaseListener
	{
		private static var evento:ClienteEvent;		
		private static var modelApp:ModelApp = ModelApp.getInstance();
		
		
		public static function exec(_evento:Event):void{
			var rmtObjClientes:RemoteObject = ServiceRO.fnRmtObjClientes();
			rmtObjClientes.addEventListener(ResultEvent.RESULT, result);
			evento = ClienteEvent(_evento);
			switch(evento.type){
				case ClienteEvent.LISTAR:
					rmtObjClientes.getAllClientes();
					
					break;
				case ClienteEvent.CREAR:
					rmtObjClientes.createClientes(evento.clienteVO);
					
					break;
				case ClienteEvent.MODIFICAR:
					rmtObjClientes.updateClientes(evento.clienteVO);
					
					break;
				case ClienteEvent.ELIMINAR:
					rmtObjClientes.deleteClientes(evento.clienteVO.id);
					
					break;
				
			}
		}
		
		public static function result(data:ResultEvent):void
		{
			switch(data.token.message['operation']){
				case ClienteEvent.LISTAR:
					modelApp.arrClientes = new ArrayCollection(data.result as Array);
					modelApp.arrComboClientes = new ArrayCollection(data.result as Array);
					modelApp.arrClientes.source.forEach(fnDictCliente);
					modelApp.arrClientes.filterFunction = modelApp.fnClientesFilter;
					break;
				case ClienteEvent.CREAR:
					modelApp.arrClientes.addItem(data.result);
					modelApp.objClientesRut[data.result.rut] = data.result;
					//modelApp.arrComboClientes.refresh();
					evento.callback.call(null, data.result);
					break;
				case ClienteEvent.MODIFICAR:
					if(evento.callback){
						evento.callback.call(null, data.result);	
					}					
					modelApp.arrComboClientes.refresh();
					break;
				case ClienteEvent.ELIMINAR:
					evento.callback.call(null, data.result);
					modelApp.arrComboClientes.refresh();
					
					break;
			}
		}
		
		
		private static function fnDictCliente(item:ClienteVO, index:int, arr:Array):void{
			modelApp.objClientesRut[item.rut + ''] = item;
		}
		
		
		public static function fault(info:Object):void
		{
		}
	}
}