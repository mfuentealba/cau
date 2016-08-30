package com.larrainvial.gpatrimonial.orders.commands.toWebOrb
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.events.toWebOrb.UpdateOrderBookEvent;
	import com.larrainvial.gpatrimonial.orders.model.ModelLocator;
	
	public class BookOrdersBlotterCommand implements ICommand
	{
		public function execute(ev:CairngormEvent):void
		{
			var event:UpdateOrderBookEvent = UpdateOrderBookEvent(ev);
			
			ModelLocator.serverConnectionB.call("requestBookOrdersBlotter",null, event.bookOrder);
		}
	}
}