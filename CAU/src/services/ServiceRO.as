package services
{
	import mx.rpc.events.FaultEvent;
	

	public class ServiceRO
	{
		public static function fnRmtObjMantenedores():CustomRemoteObject{
			var rmtObj:CustomRemoteObject = new CustomRemoteObject("MantenedorService");
			rmtObj.source = 'Weborb.cau.MantenedorService';
			rmtObj.showBusyCursor = true;
			return rmtObj;
		}
		
		public static function fnRmtObjUsuarios():CustomRemoteObject{
			var rmtObj:CustomRemoteObject = new CustomRemoteObject("UsuariosService");
			rmtObj.source = 'Weborb.cau.UsuariosService';
			rmtObj.showBusyCursor = true;
			return rmtObj;
		}
		
		public static function fnRmtObjClientes():CustomRemoteObject{
			var rmtObj:CustomRemoteObject = new CustomRemoteObject("ClientesService");
			rmtObj.source = 'Weborb.cau.ClientesService';
			rmtObj.showBusyCursor = true;
			return rmtObj;
		}
		
		public static function fnRmtObjSucursales():CustomRemoteObject{
			var rmtObj:CustomRemoteObject = new CustomRemoteObject("SucursalesService");
			rmtObj.source = 'Weborb.cau.SucursalesService';
			rmtObj.showBusyCursor = true;
			return rmtObj;
		}
		
		public static function fnRmtObjTickets():CustomRemoteObject{
			var rmtObj:CustomRemoteObject = new CustomRemoteObject("TicketService");
			rmtObj.source = 'Weborb.cau.TicketService';
			rmtObj.showBusyCursor = true;
			rmtObj.addEventListener(FaultEvent.FAULT, fnFault);
			return rmtObj;
		}
		
		public static function fnFault(ev:FaultEvent):void{
			
		}
		
	}
}