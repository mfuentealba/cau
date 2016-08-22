package model
{
	import mx.collections.ArrayCollection;
	import mx.rpc.remoting.RemoteObject;
	
	import vo.UserVO;

	[Bindable]
	public class ModelApp
	{
		private static var modelLocator:ModelApp;
		/*public var rmtObjSucursales:RemoteObject;
		public var rmtObjClientes:RemoteObject;
		public var rmtObjUsuarios:RemoteObject;*/
		//public var rmtObjMant:RemoteObject;
		
		public var arrSucursales:ArrayCollection;
		public var objSucursales:Object = {};
		public var arrSucursalesTodas:ArrayCollection;
		public var fnSucursalesFilter:Function;
		public var sucursalesFilter:String;
		
		public var arrClientes:ArrayCollection;
		public var objClientes:Object = {};
		public var fnClientesFilter:Function;
		public var clientesFilter:String;
		
		public var arrPerfiles:ArrayCollection;
		public var arrGrupoResolutor:ArrayCollection;
		public var arrTipoUsuario:ArrayCollection;
		public var arrClasificacion:ArrayCollection;
		public var arrCategoria:ArrayCollection;
		public var arrSubCategoria:ArrayCollection;
		public var arrDescripcion:ArrayCollection;
		
		public var objTipoUsuario:Object = {};
		public var objGrupoResolutor:Object = {};
		public var objPerfiles:Object = {};
		public var objClasificacion:Object = {};
		public var objCategoria:Object = {};
		public var objSubCategoria:Object = {};
		public var objDescripcion:Object = {};
		
		public var arrUsuarios:ArrayCollection;
		public var objUsuarios:Object = {};
		public var fnUsuariosFilter:Function;
		public var usuarioFilter:String;
		public var usuarioActivo:UserVO;
		//public var grupoResolutorFilter:String;
		
		public var arrFormaAtencion:ArrayCollection;
		public var arrTiemposolucion:ArrayCollection;
		
		
		
		
		public static function getInstance():ModelApp
		{
			if ( modelLocator == null ){
				modelLocator = new ModelApp();
			}
			
			return modelLocator;
		}
		
		public function ModelApp()
		{
			if(modelLocator){
				throw new Error("Singleton... use getInstance()");
			} 
			modelLocator = this;
		}
		
		
	}
}