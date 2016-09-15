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
	
	import vo.ComentarioVO;
	import vo.UserVO;
	
	public class TicketListener //implements IBaseListener
	{
		private static var evento:TicketEvent;	
		private static var modelApp:ModelApp = ModelApp.getInstance();
		
		
		
		public static function exec(_evento:Event):void{
			evento = TicketEvent(_evento);
			var rmtObjTickets:RemoteObject = ServiceRO.fnRmtObjTickets();
			rmtObjTickets.addEventListener(ResultEvent.RESULT, result);
			switch(evento.type){
				case TicketEvent.LISTAR:
					rmtObjTickets.getAllTickets();
					
					break;
				case TicketEvent.CREAR:
					//var s:String = com.adobe.serialization.json.JSON.encode(evento.userVO);
					rmtObjTickets.createTicket(evento.ticketVO);
					
					break;
				case TicketEvent.MODIFICAR:
					rmtObjTickets.updateUsers(evento.ticketVO);
					
					break;
				case TicketEvent.ELIMINAR:
					rmtObjTickets.deleteUsers(evento.ticketVO.id);
					
					break;
				
				case TicketEvent.TOTAL_PAGINAS:
					rmtObjTickets.count(evento.objAdicional['idCla'], evento.objAdicional['propietario']);
					
					break;
				case TicketEvent.LISTAR_PAGINA:
					rmtObjTickets.getTickets_paged(evento.objAdicional['ini'], evento.objAdicional['fin'], evento.objAdicional['idCla'], evento.objAdicional['propietario']);
					
					break;
				
				case TicketEvent.LISTAR_COMENTARIOS:
					rmtObjTickets.getAllComentarios(evento.ticketVO.id);
					
					break;
				
				case TicketEvent.GUARDAR_COMENTARIOS:
					rmtObjTickets.saveComentarios(evento.objAdicional as ComentarioVO);
					
					break;
				case TicketEvent.REASIGNAR_TICKET:
					rmtObjTickets.reasignarTicket(evento.ticketVO.soporte, evento.ticketVO.id);	
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
						modelApp.arrTickets.addItemAt(data.result, 0);
						evento.callback.call(null, data.result);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					break;
				case TicketEvent.MODIFICAR:
					if(data.result.hasOwnProperty('id')){
						evento.callback.call(null, data.result);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					break;
				case TicketEvent.ELIMINAR:
					if(data.result == evento.ticketVO.id){
						evento.callback.call(null, data.result);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					break;
				case TicketEvent.TOTAL_PAGINAS:
					if(data.result){
						modelApp.totalPaginas = int(data.result.paginas);
						modelApp.totalRegistros = int(data.result.registros);
						evento.callback.call(null);
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					break;
				case TicketEvent.LISTAR_PAGINA:
					modelApp.arrTickets.removeAll();
					modelApp.arrTickets = new ArrayCollection(data.result as Array);
					modelApp.arrTickets.filterFunction = modelApp.fnTicketsFilter;
					break;
				
				case TicketEvent.LISTAR_COMENTARIOS:
					if(data.result as Array){
						evento.callback.call(null, data.result);
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					break;
				case TicketEvent.GUARDAR_COMENTARIOS:
					if(data.result.hasOwnProperty('id')){
						evento.ticketVO.arrComentarios.addItem(data.result);
							
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					
					break;
				case TicketEvent.REASIGNAR_TICKET:
					if(data.result.hasOwnProperty('id')){
						evento.callback.call(null, data.result);	
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