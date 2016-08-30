package com.larrainvial.gpatrimonial.orders.events.fromWebOrb
{
import com.adobe.cairngorm.control.CairngormEvent;
import com.larrainvial.gpatrimonial.orders.controller.Controller;

import flash.events.Event;

import mx.collections.ArrayCollection;

public class ReceiveMktDataFullOfferEvent extends CairngormEvent
	{
		public var OfferCollection:ArrayCollection;

		public function ReceiveMktDataFullOfferEvent(offers:ArrayCollection)
		{
			this.OfferCollection = offers;
			super(Controller.EVENT_MKT_DATA_FULL_OFFER);
		}
	}
}