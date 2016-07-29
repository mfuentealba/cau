package services
{
	import mx.rpc.remoting.RemoteObject;

	public class ServiceRO
	{
		public static function fnRmtObjMantenedores():RemoteObject{
			var rmtObj:RemoteObject = new RemoteObject("MantenedorService");
			rmtObj.source = 'Weborb.cau.cau.MantenedorService';
			rmtObj.showBusyCursor = true;
			return rmtObj;
		}
		
		public static function fnRmtObjUsuarios():RemoteObject{
			var rmtObj:RemoteObject = new RemoteObject("UsuariosService");
			rmtObj.source = 'Weborb.cau.cau.UsuariosService';
			rmtObj.showBusyCursor = true;
			return rmtObj;
		}
		
		public static function fnRmtObjClientes():RemoteObject{
			var rmtObj:RemoteObject = new RemoteObject("ClientesService");
			rmtObj.source = 'Weborb.cau.cau.ClientesService';
			rmtObj.showBusyCursor = true;
			return rmtObj;
		}
		
		public static function fnRmtObjSucursales():RemoteObject{
			var rmtObj:RemoteObject = new RemoteObject("SucursalesService");
			rmtObj.source = 'Weborb.cau.cau.SucursalesService';
			rmtObj.showBusyCursor = true;
			return rmtObj;
		}
		
	}
}