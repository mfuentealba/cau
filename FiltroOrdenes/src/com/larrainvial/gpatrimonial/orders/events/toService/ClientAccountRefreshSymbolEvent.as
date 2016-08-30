package com.larrainvial.gpatrimonial.orders.events.toService
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	
	public class ClientAccountRefreshSymbolEvent extends CairngormEvent
	{
		public function ClientAccountRefreshSymbolEvent(xmlString:String)
		{
			super(Controller.EVENT_ACCOUNT_REFRESH_SYMBOL);		
			this.data = xmlString;
		}
	}
}
