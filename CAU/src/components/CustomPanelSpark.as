package components
{
	import mx.states.SetStyle;
	
	import spark.components.Panel;
	
	public class CustomPanelSpark extends Panel
	{
		[Bindable][Embed(source="assets/icons/menu.png")] public var imgSrc:Class;
		[Bindable] public var imgBl:Boolean = false;
		
		[Bindable] public var minBl:Boolean = false;
		[Bindable] public var closeBl:Boolean = false;
		[Bindable] public var opBl:Boolean = false;
		
		public function CustomPanelSpark()
		{
			super();
			
		}
	}
}
