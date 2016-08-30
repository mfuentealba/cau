package com.larrainvial.gpatrimonial.orders.events.fromWebOrb
{
import com.adobe.cairngorm.control.CairngormEvent;
import com.larrainvial.gpatrimonial.orders.controller.Controller;

import flash.events.Event;

import mx.collections.ArrayCollection;

	public class SimOrderCompleteEvent extends CairngormEvent
	{
		public var arr:ArrayCollection
		public function SimOrderCompleteEvent(_arr:ArrayCollection)
		{	
			super(Controller.EVENT_SIM_ORDERS);
			this.arr = _arr
			
		}
	}
}