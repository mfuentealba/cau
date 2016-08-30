package com.larrainvial.gpatrimonial.orders.commands.fromWebOrb
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.events.fromWebOrb.ReceiveBookStateEvent;
	import com.larrainvial.gpatrimonial.orders.events.fromWebOrb.ReceiveSavedBookEvent;
	import com.larrainvial.gpatrimonial.orders.events.fromWebOrb.ReceiveSavedSimOrderEvent;
	import com.larrainvial.gpatrimonial.orders.model.ModelLocator;
	import com.larrainvial.gpatrimonial.orders.vo.BookStateVO;
	
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.utils.ObjectUtil;
	
	public class ReceiveSimOrderCommand implements ICommand 
	{		
		
		public function execute(ev:CairngormEvent):void 
		{
			var event:ReceiveSavedSimOrderEvent = ReceiveSavedSimOrderEvent(ev);			
			ModelLocator.SimOrders[event.simOrderVO.idSim] = ModelLocator.arrSimOrders.source.push(event.simOrderVO);
		}
		
		
	}	
}
