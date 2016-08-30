package com.larrainvial.gpatrimonial.orders.events.toService
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	
	public class UFEvent extends CairngormEvent
	{
		public var callback:Function;
		
		public function UFEvent(xmlString:String)
		{
			super(Controller.EVENT_UF);		
			this.data = xmlString;
		}
	}
}
