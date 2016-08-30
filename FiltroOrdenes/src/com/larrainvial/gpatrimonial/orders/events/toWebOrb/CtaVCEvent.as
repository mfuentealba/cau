package com.larrainvial.gpatrimonial.orders.events.toWebOrb
{
import com.adobe.cairngorm.control.CairngormEvent;
import com.larrainvial.gpatrimonial.orders.controller.Controller;

import flash.events.Event;

	public class CtaVCEvent extends CairngormEvent
	{		
		public var rut:String;
		
		public var objCtaVC:Object;
		
		public function CtaVCEvent(_rut:String, _objCtaVC:Object)
		{			
			super(Controller.EVENT_CTA_VC);
			this.rut = _rut;
			this.objCtaVC = _objCtaVC;
		}
	}
}