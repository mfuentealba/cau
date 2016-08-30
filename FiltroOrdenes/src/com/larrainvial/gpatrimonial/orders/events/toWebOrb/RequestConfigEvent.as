package com.larrainvial.gpatrimonial.orders.events.toWebOrb
{
import com.adobe.cairngorm.control.CairngormEvent;
import com.larrainvial.gpatrimonial.orders.controller.Controller;

import flash.events.Event;

	public class RequestConfigEvent extends CairngormEvent
	{		
		public var idClient:String;
		public var userName:String;
		public var arrAgentCode:Array;
		
		public function RequestConfigEvent(id:String, userName:String, arrAgentCode:Array)
		{			
			super(Controller.EVENT_REQUEST_CONFIG);
			
			this.idClient = id;
			this.userName = userName;
			this.arrAgentCode = arrAgentCode;
		}
	}
}