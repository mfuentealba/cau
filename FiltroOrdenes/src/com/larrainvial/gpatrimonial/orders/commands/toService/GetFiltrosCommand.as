package com.larrainvial.gpatrimonial.orders.commands.toService
{
	
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.larrainvial.gpatrimonial.orders.business.OrdenesDelegate;
	import com.larrainvial.gpatrimonial.orders.business.ValidaNTDelegate;
	import com.larrainvial.gpatrimonial.orders.events.toService.ClientAccountPreLoadEvent;
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
	
	public class GetFiltrosCommand implements ICommand, IResponder
	{		
		[Bindable]
		private var ocDelegate:OrdenesDelegate = new OrdenesDelegate(this as IResponder);
		public var model:ModelLocator = ModelLocator.getInstance();
		//****************************************************************************************************
		public function execute(event:CairngormEvent):void
		{
			ocDelegate.Met_GetFiltros();
		}
		//****************************************************************************************************
		public function result(data:Object):void
		{
			try
			{
				var userFlag:Boolean = false;
				
				ModelLocator.arrRut = new ArrayCollection();
				ModelLocator.arrAgente = new ArrayCollection();
				ModelLocator.arrNemos = new ArrayCollection();
				
				for each(var item:Object in  XML(data.result)..Filtros.(@tipo == 1))
				{
					//var obj:Object = {rut: item.@valor};
					var i:String = item.@valor;
					ModelLocator.monto = int(i);
				}
				
				for each(item in  XML(data.result)..Filtros.(@tipo == 2))
				{
					//var obj:Object = {rut: item.@valor};
					ModelLocator.arrRut.addItem({rut: item.@valor});
				}
				
				for each(item in  XML(data.result)..Filtros.(@tipo == 3))
				{
					//var obj:Object = {rut: item.@valor};
					ModelLocator.arrAgente.addItem({agente: item.@valor});
				}
				
				for each(item in  XML(data.result)..Filtros.(@tipo == 4))
				{
					//var obj:Object = {rut: item.@valor};
					ModelLocator.arrNemos.addItem({nemo: item.@valor});
				}
				
				
			}     		
			catch(e:Error)
			{
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