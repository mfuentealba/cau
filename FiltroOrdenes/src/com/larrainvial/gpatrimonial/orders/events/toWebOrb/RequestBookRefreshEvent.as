package com.larrainvial.gpatrimonial.orders.events.toWebOrb
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;

	public class RequestBookRefreshEvent extends CairngormEvent
	{
		
		public var idBook:String;
		
		public function RequestBookRefreshEvent(_idBook:String)
		{
			idBook = _idBook;
			super(Controller.EVENT_REQUEST_BOOK_REFRESH);
		}
	}
}