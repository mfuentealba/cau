package com.larrainvial.gpatrimonial.orders.events.fromWebOrb
{
import com.adobe.cairngorm.control.CairngormEvent;
import com.larrainvial.gpatrimonial.orders.controller.Controller;

import flash.events.Event;

import mx.collections.ArrayCollection;

	public class ReceiveSymbolsEvent extends CairngormEvent
	{
		public var arr:ArrayCollection
		public function ReceiveSymbolsEvent(_arr:ArrayCollection)
		{
			this.arr = _arr
			super(Controller.EVENT_RECEIVE_SYMBOLS);
		}
	}
}