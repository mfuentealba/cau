package com.larrainvial.gpatrimonial.orders.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.larrainvial.gpatrimonial.orders.model.ModelLocator;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	[Bindable]
	public class OrdenesDelegate
	{
		
		private var responder : IResponder;
		private var service : Object;
		private var model : ModelLocator = ModelLocator.getInstance();
		private var resultHandler:Function;
		
		//*****************************************************************************************************
		public function OrdenesDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService("WSOrderCapture");
			this.responder = responder;
		}
		
		//*****************************************************************************************************
			
		public function Met_IngresoFiltros(xmlString:String):void
		{
			try
			{				
				var token : AsyncToken;				
				token = service.Met_IngresoFiltros(xmlString);	
				token.addResponder(responder);
			}
			catch (err:Error)
			{
				Alert.show(err.getStackTrace());
				//Utiles.PopAlertaCustomError(Utiles.ALERTA_ERROR,Utiles.ERROR_WS,err.getStackTrace());
			}
		}	
		//*****************************************************************************************************
		
		public function Met_EliminaFiltros(xmlString:String):void
		{
			try
			{				
				var token : AsyncToken;				
				token = service.Met_EliminaFiltros(xmlString);	
				token.addResponder(responder);
			}
			catch (err:Error)
			{
				Alert.show(err.getStackTrace());
				//Utiles.PopAlertaCustomError(Utiles.ALERTA_ERROR,Utiles.ERROR_WS,err.getStackTrace());
			}
		}	
		//*****************************************************************************************************
		
		public function Met_GetFiltros():void
		{
			try
			{				
				var token : AsyncToken;				
				token = service.Met_GetFiltros();	
				token.addResponder(responder);
			}
			catch (err:Error)
			{
				Alert.show(err.getStackTrace());
				//Utiles.PopAlertaCustomError(Utiles.ALERTA_ERROR,Utiles.ERROR_WS,err.getStackTrace());
			}
		}	
		//*****************************************************************************************************
		
	}
}