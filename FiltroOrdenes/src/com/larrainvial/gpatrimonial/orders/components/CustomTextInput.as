package com.larrainvial.gpatrimonial.orders.components
{
	import spark.components.TextInput;
	
	public class CustomTextInput extends TextInput
	{
		public function CustomTextInput()
		{
			super();
		}
		
		override public function get selectionActivePosition():int
		{
			// TODO Auto Generated method stub
			return super.selectionActivePosition;
		}
		
		override public function get selectionAnchorPosition():int
		{
			// TODO Auto Generated method stub
			return super.selectionAnchorPosition;
		}
		
		override public function get selectionHighlighting():String
		{
			// TODO Auto Generated method stub
			return super.selectionHighlighting;
		}
		
		override public function set selectionHighlighting(value:String):void
		{
			// TODO Auto Generated method stub
			super.selectionHighlighting = value;
		}
		
		override public function drawFocus(isFocused:Boolean):void
		{
			// TODO Auto Generated method stub
			super.drawFocus(isFocused);
		}
		
	}
}