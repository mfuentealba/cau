package components
{
	import mx.states.SetStyle;
	
	import spark.components.BorderContainer;
	import spark.components.Panel;
	
	public class CustomPanelSpark extends Panel
	{
		[Bindable][Embed(source="assets/icons/menu.png")] public var imgSrc:Class;
		[Bindable] public var imgBl:Boolean = false;
		[SkinPart] public var bcElementos:BorderContainer;
		
		public function CustomPanelSpark()
		{
			super();
			
		}
	}
}
