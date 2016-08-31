package com.larrainvial.gpatrimonial.orders.commands.toService
{
	
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.larrainvial.gpatrimonial.orders.business.OrdenesDelegate;
	import com.larrainvial.gpatrimonial.orders.business.ValidaNTDelegate;
	import com.larrainvial.gpatrimonial.orders.events.toService.ClientAccountPreLoadEvent;
	import com.larrainvial.gpatrimonial.orders.events.toService.EliminaFiltrosEvent;
	import com.larrainvial.gpatrimonial.orders.events.toService.Lista_EjecutivoSupervisadoEvent;
	import com.larrainvial.gpatrimonial.orders.events.toWebOrb.AccessLoadedEvent;
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
					switch(evento.tipo){
						case ModelLocator.TIPO_RUT:
							Alert.show("El registro fue eliminado con éxito", "Información");
							ModelLocator.arrRut.removeItemAt(ModelLocator.arrRut.getItemIndex(evento.dg.selectedItem));
							break;
						case ModelLocator.TIPO_AGENTE:
							Alert.show("El registro fue eliminado con éxito", "Información");
							ModelLocator.arrAgente.removeItemAt(ModelLocator.arrAgente.getItemIndex(evento.dg.selectedItem));
							break;
						case ModelLocator.TIPO_NEMO:
							Alert.show("El registro fue eliminado con éxito", "Información");
							ModelLocator.arrNemos.removeItemAt(ModelLocator.arrNemos.getItemIndex(evento.dg.selectedItem));
							break;
					}	
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