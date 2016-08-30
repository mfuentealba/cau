package com.larrainvial.gpatrimonial.orders.events.inApp
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	
	public class ChangeBookEvent extends CairngormEvent
	{
		
		public function ChangeBookEvent()
		{
			super(Controller.EVENT_CHANGE_BOOK);
			
		}
	}
}