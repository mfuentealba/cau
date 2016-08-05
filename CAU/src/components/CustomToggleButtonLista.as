package components
{
	import spark.components.Image;
	import spark.components.ToggleButton;
	
	public class CustomToggleButtonLista extends ToggleButton
	{
		[SkinPart(required="true")] 
		public var imgReal:Image;
		[Bindable] public var img:String; 
		public function CustomToggleButtonLista()
		{
			super();
			
		}

		override protected function measure():void
		{
			// TODO Auto Generated method stub
			super.measure();
			imgReal.source = img;
		}
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			// Dispatch a partAdded event.
			// This event is an internal implementation detail subject to change.
			// The accessibility implementation classes listen for this to know
			// when to add their event listeners to skin parts being added.
			super.partAdded(partName, instance);
			/*var event:SkinPartEvent = new SkinPartEvent(SkinPartEvent.PART_ADDED);
			event.partName = partName;
			event.instance = instance;
			dispatchEvent(event);*/
		}
		
	}
}