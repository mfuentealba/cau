package useful
{
	import flash.events.Event;

	public class UtilEventBubbles extends Event
	{
		private var objParameters:Object;
		
		public function UtilEventBubbles(type:String,objParam:Object, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.objParameters = objParam;
		}
		
		public function getObjParam():Object
		{
			return this.objParameters;			
		}
		
	}
}
