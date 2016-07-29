package listeners
{
	import com.adobe.serialization.json.JSON;
	
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
					var s:String = com.adobe.serialization.json.JSON.encode(param['evento'].userVO);
					rmtObjUsuarios.createUsers(param['evento'].userVO);
					
					break;
				case UsuarioEvent.MODIFICAR:
					rmtObjUsuarios.updateUsers(param['evento'].userVO);
					
					break;
				case UsuarioEvent.ELIMINAR:
					rmtObjUsuarios.deleteUsers(param['evento'].userVO.id);
					
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
			}
		}
		
		public static function fault(info:Object):void
		{
		}
	}
}