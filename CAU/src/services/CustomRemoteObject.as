package services
{
	import mx.rpc.remoting.RemoteObject;
	
	public dynamic class CustomRemoteObject extends RemoteObject
	{
		public var item:*;
		public var callback:Function;
		public function CustomRemoteObject(destination:String=null)
		{
			super(destination);
		}
	}
}