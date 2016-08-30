package com.larrainvial.gpatrimonial.orders.events.toT24
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	
	import mx.controls.Button;
	
	public class T24MethodEvent extends CairngormEvent
	{
		public var callback:Function;
		public var xmlString:String;
		public var oper:String;
		public var invocado:String;
		public var btnEnviar:*;
		public static const TRANS_OPER:String = 'Trans';
		public static const CONS_OPER:String = 'Cons';
		
		
		public function T24MethodEvent(_xmlString:String, _oper:String)
		{
			super(Controller.EVENT_T24_METHOD);		
			this.xmlString = _xmlString;
			this.oper = _oper;
		}
	}
}
