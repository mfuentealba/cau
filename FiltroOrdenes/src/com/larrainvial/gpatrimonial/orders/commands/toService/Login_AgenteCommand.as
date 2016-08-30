package com.larrainvial.gpatrimonial.orders.commands.toService
{
	
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
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
	
	public class Login_AgenteCommand implements ICommand, IResponder
	{		
		[Bindable]
		private var NTDelegate:ValidaNTDelegate = new ValidaNTDelegate(this as IResponder);
		public var model:ModelLocator = ModelLocator.getInstance();
		//****************************************************************************************************
		public function execute(event:CairngormEvent):void
		{
			NTDelegate.s_Login_Agente();
		}
		//****************************************************************************************************
		public function result(data:Object):void
		{
			try
			{
				var userFlag:Boolean = false;
				
				for each(var item:Object in  XML(data.result)..row.(@id_unidad == 2))
				{
					if(StringUtil.trim(item.@codigo))
					{
						
					}
					
					userFlag = true;
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