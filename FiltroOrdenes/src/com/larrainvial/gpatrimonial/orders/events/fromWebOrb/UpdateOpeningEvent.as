package com.larrainvial.gpatrimonial.orders.events.fromWebOrb
{
import com.adobe.cairngorm.control.CairngormEvent;
import com.larrainvial.gpatrimonial.orders.controller.Controller;

import flash.events.Event;

    public class UpdateOpeningEvent extends CairngormEvent
    {
		public var symbol:String = "";
		public var market:String = "";
        public var opening:Number = 0;
        
        public function UpdateOpeningEvent(s:String, m:String, o:Number)
        {
			this.symbol = s;
			this.market = m;
            this.opening = o;            
            super(Controller.EVENT_UPDATE_OPEN);
        }
    }
}