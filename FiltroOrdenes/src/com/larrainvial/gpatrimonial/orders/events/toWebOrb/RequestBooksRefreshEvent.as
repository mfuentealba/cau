package com.larrainvial.gpatrimonial.orders.events.toWebOrb
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	
	public class RequestBooksRefreshEvent extends CairngormEvent
	{
		public function RequestBooksRefreshEvent()
		{
			//super(Controller.EVENT_REQUEST_BOOKS_REFRESH);
		}
	}
}