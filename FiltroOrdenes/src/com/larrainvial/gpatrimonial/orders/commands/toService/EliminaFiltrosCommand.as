package com.larrainvial.gpatrimonial.orders.commands.toService
{
	
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.larrainvial.gpatrimonial.orders.business.OrdenesDelegate;
	import com.larrainvial.gpatrimonial.orders.business.ValidaNTDelegate;
	import com.larrainvial.gpatrimonial.orders.events.toService.EliminaFiltrosEvent;
	import com.larrainvial.gpatrimonial.orders.events.toWebOrb.AccessLoadedEvent;
	import com.larrainvial.gpatrimonial.orders.events.toWebOrb.FilterTransactionEvent;
	import com.larrainvial.gpatrimonial.orders.model.ModelLocator;
	import com.larrainvial.gpatrimonial.orders.vo.LoginVO;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.utils.StringUtil;
	
	//[Event(name="handlerClientesBloqueados", type="com.adobe.cairngorm.control.CairngormEvent")]
	
	public class EliminaFiltrosCommand implements ICommand, IResponder
	{		
		[Bindable]
		private var ocDelegate:OrdenesDelegate = new OrdenesDelegate(this as IResponder);
		public var model:ModelLocator = ModelLocator.getInstance();
		public var evento:EliminaFiltrosEvent;
		
		
		//****************************************************************************************************
		
		public function execute(event:CairngormEvent):void
		{
			evento = EliminaFiltrosEvent(event);
			ocDelegate.Met_EliminaFiltros(evento.xmlStr);
		}
		//****************************************************************************************************
		public function result(data:Object):void
		{
			try
			{
				
				if(XML(data.result).Error.@Status == "0"){
					
					var valor:String = XML(data.result)..Filtros[0].@valor + '';
					var filterTransactionEvent:FilterTransactionEvent = new FilterTransactionEvent("delete", evento.tipo, (evento.tipo == ModelLocator.TIPO_RUT ? valor.split("-")[0] : valor), evento.dg);
					filterTransactionEvent.dispatch();
				} else {
					Alert.show("Problemas en operación", "Error");
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