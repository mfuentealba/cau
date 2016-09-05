package com.larrainvial.gpatrimonial.orders.commands.toService
{
	
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.larrainvial.gpatrimonial.orders.business.OrdenesDelegate;
	import com.larrainvial.gpatrimonial.orders.business.ValidaNTDelegate;
	import com.larrainvial.gpatrimonial.orders.events.toService.IngresoFiltrosEvent;
	import com.larrainvial.gpatrimonial.orders.events.toWebOrb.AccessLoadedEvent;
	import com.larrainvial.gpatrimonial.orders.events.toWebOrb.FilterTransactionEvent;
	import com.larrainvial.gpatrimonial.orders.model.ModelLocator;
	import com.larrainvial.gpatrimonial.orders.vo.LoginVO;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.utils.StringUtil;
	
	import spark.events.TextOperationEvent;
	
	//[Event(name="handlerClientesBloqueados", type="com.adobe.cairngorm.control.CairngormEvent")]
	
	public class IngresoFiltrosCommand implements ICommand, IResponder
	{		
		[Bindable]
		private var ocDelegate:OrdenesDelegate = new OrdenesDelegate(this as IResponder);
		public var model:ModelLocator = ModelLocator.getInstance();
		public var evento:IngresoFiltrosEvent;
		
		
		//****************************************************************************************************
		
		public function execute(event:CairngormEvent):void
		{
			evento = IngresoFiltrosEvent(event);
			ocDelegate.Met_IngresoFiltros(evento.xmlStr);
		}
		//****************************************************************************************************
		public function result(data:Object):void
		{
			try
			{
				
				if(XML(data.result).Error.@Status == "0"){
					
					var valor:String = XML(data.result)..Filtros[0].@valor + '';
					var filterTransactionEvent:FilterTransactionEvent = new FilterTransactionEvent("insert", evento.tipo, valor, evento.txt);
					filterTransactionEvent.dispatch();
				} else {
					Alert.show("Problemas en operación en DB", "Error");
				}
				
				
				
				
			}     		
			catch(e:Error)
			{
				trace(e);
			}  
		}
		//****************************************************************************************************
		public function fault(info:Object):void
		{
			Alert.show("Los Servicios no se encuentran Disponibles en éste momento.", "Server Error");
		}
		//****************************************************************************************************
	}
}