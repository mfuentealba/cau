package vo
{
	import model.ModelApp;

	[RemoteClass(alias="Weborb.cau.cau.ClienteVO")]
	[Bindable] 
	dynamic public class ClienteVO
	{
		public var id:String;
		public var nombres:String;
		public var apellidos:String;
		public var rut:String;
		public var telefono:String;
		public var anexo:String;
		public var email:String;
		private var _sucursal:int;
		public var unidad:String;
		public var rotulo:String;
		public var dir_ip:String;
		public var gerencia:String;
		public var password:String;
		public var empresa:String;
		public var sucursalVO:SucursalVO;
		
		private var modelApp:ModelApp = ModelApp.getInstance();
		
		
		
		public function get sucursal():int
		{
			return _sucursal;
		}

		public function set sucursal(value:int):void
		{
			_sucursal = value;
			sucursalVO = modelApp.objSucursales[value];
		}

	}
}