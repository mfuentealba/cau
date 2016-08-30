package com.larrainvial.gpatrimonial.orders.events.toService
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	
	public class Login_AgenteEvent extends CairngormEvent
	{
		public function Login_AgenteEvent()
		{
			super(Controller.EVENT_LOGIN_USUARIO);
		}

	}
}
