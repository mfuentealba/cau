package event
{
	import flash.events.Event;
	
	import vo.TicketVO;
	
	public class TicketEvent extends BaseEvent
	{
		public static const LISTAR:String = 'getAllTickets';
		public static const CREAR:String = 'createTicket';
		public static const MODIFICAR:String = 'updateTickets';
		public static const ELIMINAR:String = 'deleteTickets';
		public static const TOTAL_PAGINAS:String = 'count';
		public static const LISTAR_PAGINA:String = 'getTickets_paged';
		public static const LISTAR_COMENTARIOS:String = 'getAllComentarios';
		public static const GUARDAR_COMENTARIOS:String = 'saveComentarios';
		public static const REASIGNAR_TICKET:String = 'reasignarTicket';
		
		
		
		public var ticketVO:TicketVO;
		public var objAdicional:*;
		
		public function TicketEvent(type:String, _TicketVO:TicketVO = null, _callback:Function = null, _objAdicional:* = null)
		{
			super(type, bubbles, cancelable);
			clase = "TicketsEvent";
			ticketVO = _TicketVO;
			callback = _callback;
			objAdicional = _objAdicional;
		}
	}
}