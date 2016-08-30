package com.larrainvial.gpatrimonial.orders.events.toService
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	
	import mx.collections.ArrayCollection;
	
	public class Lista_EjecutivoSupervisadoEvent extends CairngormEvent
	{
		
		public function Lista_EjecutivoSupervisadoEvent(arrParam :ArrayCollection)
		{
			super(Controller.EVENT_EJECUTIVO_SUPERVISADO);
			this.data = new Object();
			this.data = arrParam;
		}
		
	}
}
