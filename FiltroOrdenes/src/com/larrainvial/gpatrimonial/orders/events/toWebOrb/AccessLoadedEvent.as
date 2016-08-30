package com.larrainvial.gpatrimonial.orders.events.toWebOrb
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;

	public class AccessLoadedEvent extends CairngormEvent 
	{
	    public function AccessLoadedEvent() {
	        			
	        super(Controller.EVENT_ACCESS_LOADED);
	    }
	}
}