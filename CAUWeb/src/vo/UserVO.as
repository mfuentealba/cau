package vo
{
	import flash.geom.PerspectiveProjection;
	
	import model.ModelApp;

	[RemoteClass(alias="Weborb.cau.UserVO")]
	[Bindable] 
	public class UserVO
	{
		public var id:String;
		private var _perfil:int;
		public var perfilVO:PerfilVO;
		public var username:String;
		public var email:String;
		public var password:String;
		public var nombre_completo:String;
		public var tema:String;
		private var _tipoUsuario:String;
		public var tipoUsuarioVO:Object;
		private var _idGrupoResolutor:String;
		public var grupoResolutorVO:GrupoResolutorVO;
		public var estado:String;
		
		
		private var modelApp:ModelApp = ModelApp.getInstance();
		
		
		
		

		public function get perfil():int
		{
			return _perfil;
		}

		public function set perfil(value:int):void
		{
			_perfil = value;
			perfilVO = modelApp.objPerfiles[value];
		}

		public function get idGrupoResolutor():String
		{
			return _idGrupoResolutor;
		}

		public function set idGrupoResolutor(value:String):void
		{
			_idGrupoResolutor = value;
			grupoResolutorVO = modelApp.objGrupoResolutor[value];
		}

		public function get tipoUsuario():String
		{
			return _tipoUsuario;
		}

		public function set tipoUsuario(value:String):void
		{
			_tipoUsuario = value;
			tipoUsuarioVO = modelApp.objTipoUsuario[value];
		}

	}
}