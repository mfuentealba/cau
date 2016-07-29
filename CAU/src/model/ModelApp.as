package model
{
	import mx.collections.ArrayCollection;
	import mx.rpc.remoting.RemoteObject;

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
		//public var fnGrupoResolutorFilter:Function;
		public var arrTipoUsuario:ArrayCollection;
		
		public var objTipoUsuario:Object = {};
		public var objGrupoResolutor:Object = {};
		public var objPerfiles:Object = {};
		
		public var arrUsuarios:ArrayCollection;
		public var objUsuarios:Object = {};
		public var fnUsuariosFilter:Function;
		public var usuarioFilter:String;
		//public var grupoResolutorFilter:String;
		
		
		
		
		
		
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