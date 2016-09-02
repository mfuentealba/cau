package com.larrainvial.gpatrimonial.orders.events.toWebOrb
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.DataGrid;
	
	public class FilterTransactionEvent extends CairngormEvent
	{		
		
		public var operacion:String, tipo:String, valor:String, obj:*;
		public function FilterTransactionEvent(_operacion:String, _tipo:String, _valor:String, _obj:* = null)
		{			
			
			super(Controller.EVENT_FILTER_TRANSACTION);
			this.operacion = _operacion;
			this.tipo = _tipo;
			this.valor = _valor;
			this.obj = _obj;
			
		}
	}
}