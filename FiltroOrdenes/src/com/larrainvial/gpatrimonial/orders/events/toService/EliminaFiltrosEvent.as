package com.larrainvial.gpatrimonial.orders.events.toService
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	
	import spark.components.DataGrid;
	
	public class EliminaFiltrosEvent extends CairngormEvent
	{
		public var xmlStr:String;
		public var tipo:String;
		public var dg:DataGrid;
		
		public function EliminaFiltrosEvent(_xmlStr:String, _tipo:String, _dg:DataGrid)
		{
			super(Controller.EVENT_ELIMINA_FILTRO);	
			this.xmlStr = _xmlStr;
			this.tipo = _tipo;
			this.dg = _dg;
		}
	}
}
