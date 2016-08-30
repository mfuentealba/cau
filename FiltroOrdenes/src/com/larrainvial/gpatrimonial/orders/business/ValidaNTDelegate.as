package com.larrainvial.gpatrimonial.orders.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	[Bindable]
	public class ValidaNTDelegate
	{
		
		private var responder : IResponder;
		private var service : Object;
		private var resultHandler:Function;
		
		//*****************************************************************************************************
		public function ValidaNTDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService("WSValidaNT");
			this.responder = responder;
		}
		//*****************************************************************************************************	
		public function s_Login_Agente():void
		{
			try
			{				
				var token : AsyncToken;
				trace("PARAMETROS s_Login_Agente");				
				token = service.s_Login_Agente();	
				token.addResponder(responder);
			}
			catch (err:Error)
			{
				//Utiles.PopAlertaCustomError(Utiles.ALERTA_ERROR,Utiles.ERROR_WS,err.getStackTrace());
			}
		}			
		//*****************************************************************************************************
	}
}