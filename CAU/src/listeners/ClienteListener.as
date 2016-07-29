package listeners
{
	import event.ClienteEvent;
	
	import flash.events.Event;
	import flash.net.Responder;
	
	import model.ModelApp;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class ClienteListener //implements IBaseListener
	{
		private static var evento:ClienteEvent;		
		private static var modelApp:ModelApp = ModelApp.getInstance();
		
		
		public static function exec(_evento:Event):void{
			modelApp.rmtObjClientes.addEventListener(ResultEvent.RESULT, result);
			evento = ClienteEvent(_evento);
			switch(evento.type){
				case ClienteEvent.LISTAR:
					modelApp.rmtObjClientes.getAllClientes();
					
					break;
				case ClienteEvent.CREAR:
					modelApp.rmtObjClientes.createClientes(evento.clienteVO);
					
					break;
				case ClienteEvent.MODIFICAR:
					modelApp.rmtObjClientes.updateClientes(evento.clienteVO);
					
					break;
				case ClienteEvent.ELIMINAR:
					modelApp.rmtObjClientes.deleteClientes(evento.clienteVO.id);
					
					break;
				
			}
		}
		
		public static function result(data:ResultEvent):void
		{
			switch(data.token.message['operation']){
				case ClienteEvent.LISTAR:
					modelApp.arrClientes = new ArrayCollection(data.result as Array);
					modelApp.arrClientes.filterFunction = modelApp.fnClientesFilter;
					break;
				case ClienteEvent.CREAR:
					modelApp.arrClientes.addItem(data.result);
					evento.callback.call(null, null);
					break;
				case ClienteEvent.MODIFICAR:
					evento.callback.call(null, data.result);
					break;
				case ClienteEvent.ELIMINAR:
					evento.callback.call(null, data.result);
					
					break;
			}
		}
		
		public static function fault(info:Object):void
		{
		}
	}
}