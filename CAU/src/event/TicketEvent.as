package event
{
	import flash.events.Event;
	
	import vo.TicketVO;
	
	public class TicketEvent extends BaseEvent
	{
		public static const LISTAR:String = 'getAllTickets';
		public static const CREAR:String = 'createTickets';
		public static const MODIFICAR:String = 'updateTickets';
		public static const ELIMINAR:String = 'deleteTickets';
		
		
		
		public var TicketVO:TicketVO;
		
		public function TicketEvent(type:String, _TicketVO:TicketVO = null, _callback:Function = null)
		{
			super(type, bubbles, cancelable);
			clase = "TicketsEvent";
			TicketVO = _TicketVO;
			callback = _callback;
		}
	}
}