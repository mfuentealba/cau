package com.larrainvial.gpatrimonial.orders.events.toWebOrb
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;

	public class RequestSimOrdersEvent extends CairngormEvent
	{
		
		public function RequestSimOrdersEvent()
		{
			super(Controller.EVENT_REQUEST_SIM_ORDERS);
		}
	}
}