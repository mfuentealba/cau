package listeners
{
	//import com.adobe.serialization.json.JSON;
	
	import event.UsuarioEvent;
	
	import flash.events.Event;
	import flash.net.Responder;
	
	import model.ModelApp;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import services.ServiceRO;
	
	import vo.NotificacionVO;
	import vo.UserVO;
	
	public class UsuarioListener //implements IBaseListener
	{
		private static var param:Object = {};		
		private static var modelApp:ModelApp = ModelApp.getInstance();
		
		
		
		public static function exec(_evento:Event):void{
			param['evento'] = UsuarioEvent(_evento);
			var rmtObjUsuarios:RemoteObject = ServiceRO.fnRmtObjUsuarios();
			rmtObjUsuarios.addEventListener(ResultEvent.RESULT, result);
			switch(param['evento'].type){
				case UsuarioEvent.LISTAR:
					rmtObjUsuarios.getAllUsers();
					
					break;
				case UsuarioEvent.CREAR:
					//var s:String = com.adobe.serialization.json.JSON.encode(param['evento'].userVO);
					rmtObjUsuarios.createUsers(param['evento'].userVO);
					
					break;
				case UsuarioEvent.MODIFICAR:
					rmtObjUsuarios.updateUsers(param['evento'].userVO);
					
					break;
				case UsuarioEvent.ELIMINAR:
					rmtObjUsuarios.deleteUsers(param['evento'].userVO.id);
					
					break;
				case UsuarioEvent.LOGIN:
					rmtObjUsuarios.login(UsuarioEvent(param['evento']).userVO.username, UsuarioEvent(param['evento']).userVO.password);
					
					break;
				
				case UsuarioEvent.BUSCAR_NOTIFICACIONES:
					rmtObjUsuarios.getAllNotificaciones(UsuarioEvent(param['evento']).userVO.username);	
					break;
				
				
			}
		}
		
		public static function result(data:ResultEvent):void
		{
			switch(data.token.message['operation']){
				case UsuarioEvent.LISTAR:
					modelApp.arrUsuarios = new ArrayCollection(data.result as Array);
					modelApp.arrUsuarios.filterFunction = modelApp.fnUsuariosFilter;
					break;
				case UsuarioEvent.CREAR:
					
					if(data.result.hasOwnProperty('id')){
						modelApp.arrUsuarios.addItem(data.result);
						param['evento'].callback.call(null, data.result);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					break;
				case UsuarioEvent.MODIFICAR:
					if(data.result.hasOwnProperty('id')){
						param['evento'].callback.call(null, data.result);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					break;
				case UsuarioEvent.ELIMINAR:
					if(data.result == param['evento'].userVO.id){
						param['evento'].callback.call(null, data.result);	
					} else {
						Alert.show(data.result + "", 'Atencion');	
					}
					
					break;
				case UsuarioEvent.LOGIN:
					if(data.result is UserVO){
						modelApp.usuarioActivo = data.result as UserVO; 	
						param['evento'].callback.call(null);	
					} else {
						Alert.show(data.result + "" == 'null' ? "Usuario no encontrado" : data.result + "", 'Atencion');	
					}
					
					break;
				
				case UsuarioEvent.BUSCAR_NOTIFICACIONES:
					modelApp.arrNotificaciones = new ArrayCollection(data.result as Array);
					modelApp.arrNotificaciones.source.forEach(fnNot);
					modelApp.strNot = modelApp.arrNotificaciones.source.length == 0 ? '' : modelApp.arrNotificaciones.source.length + '';
					break;
			}
		}
		
		public static function fnNot(item:NotificacionVO, index:int, arr:Array):void{
			modelApp.objNotificaciones[item.id] = item;
			var arr:Array = item.fecha.split(' '); 
			var f:String = arr[0];
			item.fecha = f.substr(0, 4) + '-' + f.substr(2, 2) + '-' + f.substr(4, 2) + ' ' + arr[1];
		}
		
		public static function fault(info:Object):void
		{
		}
	}
}