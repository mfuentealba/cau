package com.larrainvial.gpatrimonial.orders.events.toService
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	
	public class GetFiltrosEvent extends CairngormEvent
	{
		public function GetFiltrosEvent()
		{
			super(Controller.EVENT_GETFILTROS);		
		}
	}
}
