package com.larrainvial.gpatrimonial.orders.events.toService
{
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	public class ClientAccountPreLoadEvent extends CairngormEvent
	{
		public function ClientAccountPreLoadEvent(xmlString:String)
		{
			super(Controller.EVENT_CLIENT_ACCOUNT_PRELOAD);		
			this.data = xmlString;
		}
	}
}
