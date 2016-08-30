package com.larrainvial.gpatrimonial.orders.events.inApp
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	
	public class ChangePxVCEvent extends CairngormEvent
	{
		
		public function ChangePxVCEvent()
		{
			super(Controller.EVENT_CHANGE_PX_VC);
			
		}
	}
}