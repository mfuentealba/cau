package com.larrainvial.gpatrimonial.orders.events.inApp
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	
	public class ChangeClsPxEvent extends CairngormEvent
	{
		
		public function ChangeClsPxEvent()
		{
			super(Controller.EVENT_CHANGE_CLSPX);
			
		}
	}
}