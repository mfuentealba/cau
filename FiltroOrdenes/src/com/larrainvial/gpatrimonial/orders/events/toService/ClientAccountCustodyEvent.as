package com.larrainvial.gpatrimonial.orders.events.toService
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	
	public class ClientAccountCustodyEvent extends CairngormEvent
	{
		public var callback:Function;
		
		public function ClientAccountCustodyEvent(xmlString:String)
		{
			super(Controller.EVENT_CLIENT_ACCOUNT_CUSTODY);		
			this.data = xmlString;
		}
	}
}
