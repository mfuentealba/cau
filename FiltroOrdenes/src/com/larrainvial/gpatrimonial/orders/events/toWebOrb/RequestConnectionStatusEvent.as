package com.larrainvial.gpatrimonial.orders.events.toWebOrb
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;

	public class RequestConnectionStatusEvent extends CairngormEvent
	{
	
		
		public function RequestConnectionStatusEvent()
		{
			super(Controller.EVENT_REQUEST_CONNECTION_STATUS);
		}
	}
}