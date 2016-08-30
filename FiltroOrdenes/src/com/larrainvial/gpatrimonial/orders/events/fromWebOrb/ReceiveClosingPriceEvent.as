package com.larrainvial.gpatrimonial.orders.events.fromWebOrb
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;

	public class ReceiveClosingPriceEvent extends CairngormEvent
	{
		public var Symbol:String;
		public var Market:String;
		public var Close:Number;
		
		public function ReceiveClosingPriceEvent(Symbol:String, Market:String, Close:Number)
		{
			this.Symbol = Symbol;
			this.Market = Market;
			this.Close = Close;
			
			super(Controller.EVENT_RECEIVE_CLOSING_PRICE);

		}
	}
}
