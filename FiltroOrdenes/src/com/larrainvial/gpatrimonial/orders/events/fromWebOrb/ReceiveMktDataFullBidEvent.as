package com.larrainvial.gpatrimonial.orders.events.fromWebOrb
{
import com.adobe.cairngorm.control.CairngormEvent;
import com.larrainvial.gpatrimonial.orders.controller.Controller;

import flash.events.Event;

import mx.collections.ArrayCollection;

public class ReceiveMktDataFullBidEvent extends CairngormEvent	
	{
		public var BidCollections:ArrayCollection;
		
		public function ReceiveMktDataFullBidEvent(bidCollection:ArrayCollection)
		{
			this.BidCollections = bidCollection;
			super(Controller.EVENT_MKT_DATA_FULL_BID);
		}
	}
}