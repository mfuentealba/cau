package com.larrainvial.gpatrimonial.orders.events.toService
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	
	public class NemosRFEvent extends CairngormEvent
	{
		public var callback:Function;
		
		public function NemosRFEvent()
		{
			super(Controller.EVENT_NEMOSRF);		
		}
	}
}
