package com.larrainvial.gpatrimonial.orders.commands.toService
{
	
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.larrainvial.gpatrimonial.orders.business.OrdenesDelegate;
	import com.larrainvial.gpatrimonial.orders.business.ValidaNTDelegate;
	import com.larrainvial.gpatrimonial.orders.events.toService.ClientAccountPreLoadEvent;
	import com.larrainvial.gpatrimonial.orders.events.toService.IngresoFiltrosEvent;
	import com.larrainvial.gpatrimonial.orders.events.toService.Lista_EjecutivoSupervisadoEvent;
	import com.larrainvial.gpatrimonial.orders.events.toWebOrb.AccessLoadedEvent;
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
					switch(evento.tipo){
						case ModelLocator.TIPO_MONTO:
							Alert.show("El monto fue actualizado con éxito", "Información");
							ModelLocator.monto = int(XML(data.result)..Filtros[0].@valor + '');
							ModelLocator.warning = false;
							break;
						case ModelLocator.TIPO_RUT:
							Alert.show("Registro ingresado con éxito", "Información");
							var str:String = XML(data.result)..Filtros[0].@valor + '';
							ModelLocator.arrRut.addItem({valor: XML(data.result)..Filtros[0].@valor + '', tipo: ModelLocator.TIPO_RUT});
							evento.txt.text = '';
							evento.txt.dispatchEvent(new TextOperationEvent(TextOperationEvent.CHANGE));
							ModelLocator.arrRut.refresh();
							break;
						case ModelLocator.TIPO_AGENTE:
							Alert.show("Registro ingresado con éxito", "Información");
							ModelLocator.arrAgente.addItem({valor: XML(data.result)..Filtros[0].@valor + '', tipo: ModelLocator.TIPO_AGENTE});
							evento.txt.text = '';
							evento.txt.dispatchEvent(new TextOperationEvent(TextOperationEvent.CHANGE));
							ModelLocator.arrAgente.refresh();
							break;
						case ModelLocator.TIPO_NEMO:
							Alert.show("Registro ingresado con éxito", "Información");
							ModelLocator.arrNemos.addItem({valor: XML(data.result)..Filtros[0].@valor + '', tipo: ModelLocator.TIPO_NEMO});
							evento.txt.text = '';
							evento.txt.dispatchEvent(new TextOperationEvent(TextOperationEvent.CHANGE));
							ModelLocator.arrNemos.refresh();
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