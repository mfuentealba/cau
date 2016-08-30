package com.larrainvial.gpatrimonial.orders.events.inApp
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	
	public class ChangeSetBooksEvent extends CairngormEvent
	{
		
		public function ChangeSetBooksEvent()
		{
			super(Controller.EVENT_CHANGE_SET_BOOKS);
			
		}
	}
}