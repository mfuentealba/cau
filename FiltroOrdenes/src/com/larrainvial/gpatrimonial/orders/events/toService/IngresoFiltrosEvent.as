package com.larrainvial.gpatrimonial.orders.events.toService
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.components.CustomTextInput;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	
	import spark.components.TextInput;
	
	public class IngresoFiltrosEvent extends CairngormEvent
	{
		public var xmlStr:String;
		public var tipo:String;
		public var txt:CustomTextInput;
		
		public function IngresoFiltrosEvent(_xmlStr:String, _tipo:String, _txt:CustomTextInput)
		{
			super(Controller.EVENT_INGRESO_FILTROS);	
			this.xmlStr = _xmlStr;
			this.tipo = _tipo;
			this.txt = _txt;
		}
	}
}
