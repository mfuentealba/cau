package com.larrainvial.gpatrimonial.orders.events.inApp
{
import com.adobe.cairngorm.control.CairngormEvent;
import com.larrainvial.gpatrimonial.orders.controller.Controller;
import com.larrainvial.gpatrimonial.orders.vo.SymVO;

import flash.events.Event;

public class ChangeSymbolEvent extends CairngormEvent
	{
		public var Sym:SymVO;
        
		public function ChangeSymbolEvent(sym:SymVO)
		{
			this.Sym = sym;   
			super(Controller.EVENT_CHANGE_SELECTED_SYMBOL);
		}
	}
}