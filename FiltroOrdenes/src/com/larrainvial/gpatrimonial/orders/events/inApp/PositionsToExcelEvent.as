package com.larrainvial.gpatrimonial.orders.events.inApp
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	
	import flash.events.Event;
	
	public class PositionsToExcelEvent extends CairngormEvent
	{		
		public function PositionsToExcelEvent():void
		{			
			super(Controller.EVENT_POSITIONS_EXCEL);
		}

	}
}