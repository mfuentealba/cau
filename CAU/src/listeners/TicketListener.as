package listeners
{
	//import com.adobe.serialization.json.JSON;
	
	import event.TicketEvent;
	
	import flash.events.Event;
	import flash.net.Responder;
	
	import model.ModelApp;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import services.ServiceRO;
	
	import vo.UserVO;
	
	public class TicketListener //implements IBaseListener
	{
		private static var param:Object = {};		
		private static var modelApp:ModelApp = ModelApp.getInstance();
		
		
		
		public static function exec(_evento:Event):void{
			param['evento'] = TicketEvent(_evento);
			var rmtObjTickets:RemoteObject = ServiceRO.fnRmtObjTickets();
			rmtObjTickets.addEventListener(ResultEvent.RESULT, result);
			switch(param['evento'].type){
				case TicketEvent.LISTAR:
					rmtObjTickets.getAllUsers();
					
					break;
				case TicketEvent.CREAR:
					//var s:String = com.adobe.serialization.json.JSON.encode(param['evento'].userVO);
					rmtObjTickets.createUsers(param['evento'].userVO);
					
					break;
				case TicketEvent.MODIFICAR:
					rmtObjTickets.updateUsers(param['evento'].userVO);
					
					break;
				case TicketEvent.ELIMINAR:
					rmtObjTickets.deleteUsers(param['evento'].userVO.id);
					
					break;
					
			}
		}
		
		public static function result(data:ResultEvent):void
		{
			switch(data.token.message['operation']){
				case TicketEvent.LISTAR:
					modelApp.arrTickets = new ArrayCollection(data.result as Array);
					modelApp.arrTickets.filterFunction = modelApp.fnTicketsFilter;
					break;
				case TicketEvent.CREAR:
					
					if(data.result.hasOwnProperty('id')){
						modelApp.arrTickets.addItem(data.result);
						param['evento'].callback.call(null, data.result);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					break;
				case TicketEvent.MODIFICAR:
					if(data.result.hasOwnProperty('id')){
						param['evento'].callback.call(null, data.result);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					break;
				case TicketEvent.ELIMINAR:
					if(data.result == param['evento'].userVO.id){
						param['evento'].callback.call(null, data.result);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					break;
				
			}
		}
		
		public static function fault(info:Object):void
		{
		}
	}
}