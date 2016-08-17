package event
{
	import flash.events.Event;
	
	import vo.UserVO;
	
	public class UsuarioEvent extends BaseEvent
	{
		public static const LISTAR:String = 'getAllUsers';
		public static const CREAR:String = 'createUsers';
		public static const MODIFICAR:String = 'updateUsers';
		public static const ELIMINAR:String = 'deleteUsers';
		public static const LOGIN:String = 'login';
		
		
		 
		public var userVO:UserVO;
		
		public function UsuarioEvent(type:String, _userVO:UserVO = null, _callback:Function = null)
		{
			super(type, bubbles, cancelable);
			clase = "ClientesEvent";
			userVO = _userVO;
			callback = _callback;
		}
	}
}