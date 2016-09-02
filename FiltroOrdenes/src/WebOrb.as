// ActionScript file

import com.adobe.cairngorm.control.CairngormEventDispatcher;
import com.larrainvial.gpatrimonial.orders.components.ConfigUtil;
import com.larrainvial.gpatrimonial.orders.components.TrdProgressBar;
import com.larrainvial.gpatrimonial.orders.controller.Controller;
import com.larrainvial.gpatrimonial.orders.events.fromWebOrb.ReceiveBookStateEvent;
import com.larrainvial.gpatrimonial.orders.events.fromWebOrb.ReceiveBooksEvent;
import com.larrainvial.gpatrimonial.orders.events.fromWebOrb.ReceiveClosingPriceEvent;
import com.larrainvial.gpatrimonial.orders.events.fromWebOrb.ReceiveHandlInstEvent;
import com.larrainvial.gpatrimonial.orders.events.fromWebOrb.ReceiveMarketEvent;
import com.larrainvial.gpatrimonial.orders.events.fromWebOrb.ReceiveMktDataFullBidEvent;
import com.larrainvial.gpatrimonial.orders.events.fromWebOrb.ReceiveMktDataFullOfferEvent;
import com.larrainvial.gpatrimonial.orders.events.fromWebOrb.ReceiveQtyAmountEvent;
import com.larrainvial.gpatrimonial.orders.events.fromWebOrb.ReceiveSettlTypeEvent;
import com.larrainvial.gpatrimonial.orders.events.fromWebOrb.ReceiveSidesEvent;
import com.larrainvial.gpatrimonial.orders.events.fromWebOrb.ReceiveSymbolsEvent;
import com.larrainvial.gpatrimonial.orders.events.fromWebOrb.UpdateOpeningEvent;
import com.larrainvial.gpatrimonial.orders.events.toService.Login_AgenteEvent;
import com.larrainvial.gpatrimonial.orders.events.toWebOrb.RequestConfigEvent;
import com.larrainvial.gpatrimonial.orders.events.toWebOrb.RequestConnectionStatusEvent;
import com.larrainvial.gpatrimonial.orders.events.toWebOrb.RequestSimOrdersEvent;
import com.larrainvial.gpatrimonial.orders.model.ModelLocator;
import com.larrainvial.gpatrimonial.orders.vo.ConfigVo;

import flash.events.Event;
import flash.events.NetStatusEvent;
import flash.events.TimerEvent;
import flash.net.NetConnection;
import flash.net.ObjectEncoding;
import flash.net.SharedObject;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.utils.Dictionary;
import flash.utils.Timer;

import mx.collections.ArrayCollection;
import mx.controls.Alert;
import mx.core.FlexGlobals;
import mx.events.CloseEvent;
import mx.managers.CursorManager;
import mx.utils.ObjectUtil;
import mx.utils.StringUtil;

	private var timerReconnection:Timer = new Timer(3000);
	private var _timer:Timer = new Timer(1000);
	//*****************************************************************************************************
	public function connectWebOrb():void
	{			
		ModelLocator.serverConnectionOC = new NetConnection();
		ModelLocator.serverConnectionOC.objectEncoding = ObjectEncoding.AMF0;
		ModelLocator.serverConnectionOC.addEventListener(NetStatusEvent.NET_STATUS, handleStatusWebOrbConnectionsOC );
		ModelLocator.serverConnectionOC.client = this;
		
		ModelLocator.serverConnectionOC.connect(ModelLocator.rutaRTMPOC, "filtros");	
		
		
		
	}
	//*****************************************************************************************************
	private function handleStatusWebOrbConnectionsOC( evt:NetStatusEvent ):void
	{
	    switch(evt.info.code)
	    {
	        case "NetConnection.Connect.Success":
				ModelLocator.messageSend = false;
				
				//Produccion
				//ModelLocator.launcher.setWebOrbState(true);
				//ModelLocator.launcher.setServerState(true);

	            break;
	
	        case "NetConnection.Connect.Failed": 				
				ModelLocator.serverConnectionOC.close();
				
				if(!(ModelLocator.messageSend))
				{
					Alert.okLabel = "Close";
					
					Alert.show("Los servicios de la aplicación ha sido desactivado, por favor cierre esta instancia y abrir uno nuevo", "Servicio no disponible", Alert.OK, null, alertListenerServiceUnavailable, null, Alert.OK);
					//Alert.show("The services from the app has been turned off, please close this instance and open a new one");
					ModelLocator.messageSend = true;
					
				}
				
				/*ModelLocator.launcher.setWebOrbState(false);
				ModelLocator.launcher.setServerState(false);*/

	            break;
	
	        case "NetConnection.Connect.Closed":				
				ModelLocator.serverConnectionOC.close();
				
				if(!(ModelLocator.messageSend))
				{
					Alert.okLabel = "Close";
					
					Alert.show("Los servicios de la aplicación ha sido desactivado, por favor cierre esta instancia y abrir uno nuevo", "Servicio no disponible", Alert.OK, null, alertListenerServiceUnavailable, null, Alert.OK);					
					//Alert.show("The services from the app has been turned off, please close this instance and open a new one");
					ModelLocator.messageSend = true;
					
				}
				
				/*ModelLocator.launcher.setWebOrbState(false);
				ModelLocator.launcher.setServerState(false);*/

				break;				
	    }
	}

//************************************************************************
	private function alertListenerServiceUnavailable(eventObj:CloseEvent):void
	{
		if (eventObj.detail == Alert.OK) 
		{
			this.close();
		}
	}
	//*****************************************************************************************************
	public function receiveBusinessReject(text:String):void
	{
		//NotificationUseful.showPopMessage("Business Reject" + "\n" +text,NotificationUseful.ACTION_INFO,6)		
	}
	//*****************************************************************************************************
	public function dataDone():void
	{
	}
	//*****************************************************************************************************
	public function receiveIdClient(id:String):void
	{
		ModelLocator.idClientOC = id;
		
		CairngormEventDispatcher.getInstance().dispatchEvent(new Login_AgenteEvent());		
	}
	//*****************************************************************************************************
	public function receiveConf(conf:ConfigVo):void
	{
		ModelLocator.user = conf;	

		
	}

	//*****************************************************************************************************
	
	
	public function receiveLogOn():void{
		
	}
