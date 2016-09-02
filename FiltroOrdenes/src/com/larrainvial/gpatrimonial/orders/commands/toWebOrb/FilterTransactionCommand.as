package com.larrainvial.gpatrimonial.orders.commands.toWebOrb
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.events.toWebOrb.FilterTransactionEvent;
	import com.larrainvial.gpatrimonial.orders.model.ModelLocator;
	
	import flash.net.Responder;
	
	import mx.controls.Alert;
	
	import spark.components.DataGrid;
	import spark.events.TextOperationEvent;
	
	public class FilterTransactionCommand implements ICommand
	{
		public var evento:FilterTransactionEvent;
		public function execute(ev:CairngormEvent):void
		{
			evento = FilterTransactionEvent(ev);
			var responder:Responder = new Responder(fnRespuestaOperacion, fault);
			ModelLocator.serverConnectionOC.call("filterTransaction",responder, evento.operacion, evento.tipo, evento.valor);
		}
		
		private function fnRespuestaOperacion(str:String):void{
			if(evento.obj is DataGrid){
				switch(evento.tipo){
					case ModelLocator.TIPO_RUT:
						//Alert.show("El registro fue eliminado con éxito", "Información");
						ModelLocator.arrRut.removeItemAt(ModelLocator.arrRut.getItemIndex(evento.obj.selectedItem));
						break;
					case ModelLocator.TIPO_AGENTE:
						//Alert.show("El registro fue eliminado con éxito", "Información");
						ModelLocator.arrAgente.removeItemAt(ModelLocator.arrAgente.getItemIndex(evento.obj.selectedItem));
						break;
					case ModelLocator.TIPO_NEMO:
						//Alert.show("El registro fue eliminado con éxito", "Información");
						ModelLocator.arrNemos.removeItemAt(ModelLocator.arrNemos.getItemIndex(evento.obj.selectedItem));
						break;
				}	
			} else {
				switch(evento.tipo){
					case ModelLocator.TIPO_MONTO:
						//Alert.show("El monto fue actualizado con éxito", "Información");
						ModelLocator.monto = int(evento.valor + '');
						ModelLocator.warning = false;
						break;
					case ModelLocator.TIPO_RUT:
						//Alert.show("Registro ingresado con éxito", "Información");
						var str:String = evento.valor + '';
						ModelLocator.arrRut.addItem({valor: evento.valor + '', tipo: ModelLocator.TIPO_RUT});
						evento.obj.text = '';
						evento.obj.dispatchEvent(new TextOperationEvent(TextOperationEvent.CHANGE));
						ModelLocator.arrRut.refresh();
						break;
					case ModelLocator.TIPO_AGENTE:
						//Alert.show("Registro ingresado con éxito", "Información");
						ModelLocator.arrAgente.addItem({valor: evento.valor + '', tipo: ModelLocator.TIPO_AGENTE});
						evento.obj.text = '';
						evento.obj.dispatchEvent(new TextOperationEvent(TextOperationEvent.CHANGE));
						ModelLocator.arrAgente.refresh();
						break;
					case ModelLocator.TIPO_NEMO:
						//Alert.show("Registro ingresado con éxito", "Información");
						ModelLocator.arrNemos.addItem({valor: evento.valor + '', tipo: ModelLocator.TIPO_NEMO});
						evento.obj.text = '';
						evento.obj.dispatchEvent(new TextOperationEvent(TextOperationEvent.CHANGE));
						ModelLocator.arrNemos.refresh();
						break;
				}	
			}
				
			
			
			Alert.show(str, "Información");
		}
		
		private function fault(str:* = null):void{
			Alert.show("Error al operar en server");
			
		}
	}
}