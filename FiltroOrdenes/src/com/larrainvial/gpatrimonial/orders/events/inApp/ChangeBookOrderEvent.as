package com.larrainvial.gpatrimonial.orders.events.inApp
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	
	public class ChangeBookOrderEvent extends CairngormEvent
	{
		
		public function ChangeBookOrderEvent()
		{
			super(Controller.EVENT_CHANGE_BOOKORDER);
			
		}
	}
}