package services
{
	import mx.rpc.remoting.RemoteObject;
	
	public class CustomRemoteObject extends RemoteObject
	{
		public function CustomRemoteObject(destination:String=null)
		{
			super(destination);
		}
	}
}