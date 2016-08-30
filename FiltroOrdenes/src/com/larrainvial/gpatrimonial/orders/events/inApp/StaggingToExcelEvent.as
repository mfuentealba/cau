package com.larrainvial.gpatrimonial.orders.events.inApp
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	
	import flash.events.Event;
	
	public class StaggingToExcelEvent extends CairngormEvent
	{		
		public function StaggingToExcelEvent():void
		{			
			super(Controller.EVENT_STAGGING_EXCEL);
		}

	}
}