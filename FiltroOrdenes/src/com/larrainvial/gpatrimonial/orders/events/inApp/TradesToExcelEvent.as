package com.larrainvial.gpatrimonial.orders.events.inApp
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	
	import flash.events.Event;
	
	public class TradesToExcelEvent extends CairngormEvent
	{		
		public function TradesToExcelEvent():void
		{			
			super(Controller.EVENT_TRADES_EXCEL);
		}

	}
}