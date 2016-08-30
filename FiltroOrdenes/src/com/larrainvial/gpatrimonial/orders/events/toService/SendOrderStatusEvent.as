package com.larrainvial.gpatrimonial.orders.events.toService
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	
	public class SendOrderStatusEvent extends CairngormEvent
	{
		public function SendOrderStatusEvent(xmlString:String)
		{
			super(Controller.EVENT_SEND_ORDER_STATUS);		
			this.data = xmlString;
		}
	}
}
