package com.larrainvial.gpatrimonial.orders.events.toWebOrb
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	import com.larrainvial.gpatrimonial.orders.vo.BookOrderVO;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class BookOrdersBlotterEvent extends CairngormEvent
	{		
		
		
		public function BookOrdersBlotterEvent()
		{			
			
			super(Controller.EVENT_BOOK_ORDER_BLOTTER);
			
		}
	}
}