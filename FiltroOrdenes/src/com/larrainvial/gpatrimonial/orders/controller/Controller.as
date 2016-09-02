package com.larrainvial.gpatrimonial.orders.controller
{

    import com.adobe.cairngorm.control.FrontController;
    import com.larrainvial.gpatrimonial.orders.commands.fromWebOrb.*;
    import com.larrainvial.gpatrimonial.orders.commands.toService.*;
    import com.larrainvial.gpatrimonial.orders.commands.toWebOrb.*;
    
    import mx.core.FlexGlobals;
    import mx.utils.UIDUtil;

	public class Controller extends FrontController
    {	
		//WS Events

		
		public static const EVENT_GETFILTROS:String = UIDUtil.createUID();
		public static const EVENT_INGRESO_FILTROS:String = UIDUtil.createUID();
		public static const EVENT_ELIMINA_FILTRO:String = UIDUtil.createUID();
		public static const EVENT_FILTER_TRANSACTION:String = UIDUtil.createUID();
		public static const EVENT_LOGIN_USUARIO:String = UIDUtil.createUID();
		
		
		

        public function Controller()
        {		
			//WS Events
			addCommand(Controller.EVENT_LOGIN_USUARIO, Login_AgenteCommand);
			addCommand(Controller.EVENT_GETFILTROS, GetFiltrosCommand);
			addCommand(Controller.EVENT_INGRESO_FILTROS, IngresoFiltrosCommand);
			addCommand(Controller.EVENT_ELIMINA_FILTRO, EliminaFiltrosCommand);
			addCommand(Controller.EVENT_FILTER_TRANSACTION, FilterTransactionCommand);
			
			
			//WebOrb Events
			
       	}
    }
}


