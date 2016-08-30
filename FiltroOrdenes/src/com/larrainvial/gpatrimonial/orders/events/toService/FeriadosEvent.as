package com.larrainvial.gpatrimonial.orders.events.toService
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	import com.larrainvial.gpatrimonial.orders.vo.ClientAccountVo;
	
	public class FeriadosEvent extends CairngormEvent
	{
		public function FeriadosEvent()
		{
			super(Controller.EVENT_FERIADOS);		
		}
	}
}
