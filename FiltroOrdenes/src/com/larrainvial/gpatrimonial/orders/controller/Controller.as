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
		public static const EVENT_CONSULTAR_SALDOS_CLIENTE:String = UIDUtil.createUID(); 
		public static const EVENT_CLIENT_ACCOUNT_CUSTODY:String = UIDUtil.createUID();
		public static const EVENT_UF:String = UIDUtil.createUID();
		public static const EVENT_NEMOSRF:String = UIDUtil.createUID();
		public static const EVENT_T24_METHOD:String = UIDUtil.createUID();
		public static const EVENT_CLIENT_ACCOUNT_PRELOAD:String = UIDUtil.createUID();
		public static const EVENT_LOGIN_USUARIO:String = UIDUtil.createUID();
		public static const EVENT_EJECUTIVO_SUPERVISADO:String = UIDUtil.createUID();
		public static const EVENT_ACCOUNT_REFRESH_SYMBOL:String = UIDUtil.createUID();
		public static const EVENT_SEND_ORDER_STATUS:String = UIDUtil.createUID();
		public static const EVENT_CONSULTAR_MACEL_CLIENTE:String = UIDUtil.createUID();
		public static const EVENT_FERIADOS:String = UIDUtil.createUID();
		
		
		//WebOrb Events
		public static const EVENT_REQUEST_CONFIG:String = UIDUtil.createUID();
		public static const EVENT_NEW_ORDER_SINGLE:String = UIDUtil.createUID(); 
		public static const EVENT_NEW_EXECRPT:String = UIDUtil.createUID();
		public static const EVENT_REPLACE_ORDER:String = UIDUtil.createUID();
		public static const EVENT_CANCEL_ORDER:String = UIDUtil.createUID();
		public static const EVENT_BUST_TRADE:String = UIDUtil.createUID();
		public static const EVENT_RECEIVE_ORD_CXL_REJECT:String = UIDUtil.createUID();
		public static const EVENT_RECEIVE_CLOSING_PRICE:String = UIDUtil.createUID();
		public static const EVENT_MKT_DATA_INC_OFFER:String = UIDUtil.createUID();
		public static const EVENT_MKT_DATA_INC_BID:String = UIDUtil.createUID();
		public static const EVENT_MKT_DATA_FULL_OFFER:String = UIDUtil.createUID();
		public static const EVENT_MKT_DATA_FULL_BID:String = UIDUtil.createUID();
		public static const EVENT_UPDATE_OPEN:String = UIDUtil.createUID();
		public static const EVENT_DELETE_SYMBOL_REJECT:String = UIDUtil.createUID();
		public static const EVENT_RECEIVE_EXECID:String = UIDUtil.createUID();
		public static const EVENT_CTA_VC:String = UIDUtil.createUID();
		public static const EVENT_SIM_ORDERS:String = UIDUtil.createUID();
		public static const EVENT_RECEIVE_SAVED_SIM_ORDER:String = UIDUtil.createUID();
		public static const EVENT_REQUEST_SIM_ORDERS:String = UIDUtil.createUID();
		public static const EVENT_SAVE_SIM_ORDER:String = UIDUtil.createUID();
		public static const EVENT_REQUEST_CONNECTION_STATUS:String = UIDUtil.createUID();
		public static const EVENT_ACCESS_LOADED:String = UIDUtil.createUID();
		
		//WebOrb Books Events 
		public static const EVENT_RECEIVE_BOOKS:String = UIDUtil.createUID();
		public static const EVENT_RECEIVE_SAVED_BOOK:String = UIDUtil.createUID();
		public static const EVENT_RECEIVE_UPDATE_BOOK:String = UIDUtil.createUID();
		public static const EVENT_NEW_ORDER_BOOK:String = UIDUtil.createUID();
		public static const EVENT_RECEIVE_SIDES_BOOK:String = UIDUtil.createUID();
		public static const EVENT_RECEIVE_MARKET:String = UIDUtil.createUID();
		public static const EVENT_RECEIVE_QTY_AMOUNT:String = UIDUtil.createUID();
		public static const EVENT_RECEIVE_SYMBOLS:String = UIDUtil.createUID();
		public static const EVENT_RECEIVE_HANDLINST:String = UIDUtil.createUID();
		public static const EVENT_RECEIVE_SETTLTYPE:String = UIDUtil.createUID();
		public static const EVENT_DELETE_ORDER_BOOK:String = UIDUtil.createUID();
		public static const EVENT_UPDATE_ORDER_BOOK:String = UIDUtil.createUID();
		public static const EVENT_BOOK_ORDER_BLOTTER:String = UIDUtil.createUID();
		public static const EVENT_RECEIVE_BOOK:String = UIDUtil.createUID();
		public static const EVENT_REQUEST_BOOK_REFRESH:String = UIDUtil.createUID();
		public static const EVENT_RECEIVE_BOOK_STATE:String = UIDUtil.createUID();
		
		//WebOrb Simultanea Events
		public static const EVENT_NEW_ORDER_SIM:String = UIDUtil.createUID();
		
		
		
		//InApp Events
		public static const EVENT_SET_CLIENT_ACCOUNT:String = UIDUtil.createUID();
		public static const EVENT_REFRESH_TOTALS:String = UIDUtil.createUID();
		public static const EVENT_NEW_TRADE:String = UIDUtil.createUID();
		public static const EVENT_NEW_BUST:String = UIDUtil.createUID();
		public static const EVENT_GENERIC_ALERT:String = UIDUtil.createUID();
		public static const EVENT_ACCOUNT_ORDER_WORKING:String = UIDUtil.createUID();
		public static const EVENT_ACCOUNT_ORDER_WORKING_BUST:String = UIDUtil.createUID();
		public static const RE_ORDER_ACCOUNTS:String = UIDUtil.createUID();
		public static const EVENT_SET_CLIENT_VIEW:String = UIDUtil.createUID();
		public static const EVENT_STAGGING_EXCEL:String = UIDUtil.createUID();
		public static const EVENT_TRADES_EXCEL:String = UIDUtil.createUID();
		public static const EVENT_POSITIONS_EXCEL:String = UIDUtil.createUID();
		public static const EVENT_SHUT_DOWN_APP:String = UIDUtil.createUID();
		public static const EVENT_CHANGE_SELECTED_SYMBOL:String = UIDUtil.createUID();
		public static const EVENT_EXECUTIONS_EXCEL:String = UIDUtil.createUID();
		public static const EVENT_CHANGE_CLSPX:String = UIDUtil.createUID();
		public static const EVENT_CHANGE_BOOKORDER:String = UIDUtil.createUID();
		public static const EVENT_CHANGE_PX_VC:String = UIDUtil.createUID();
		public static const EVENT_CHANGE_BOOK:String = UIDUtil.createUID();
		public static const EVENT_CHANGE_SET_BOOKS:String = UIDUtil.createUID();

		public static const EVENT_ADD_LOAD:String = UIDUtil.createUID();
		public static const EVENT_REMOVE_LOAD:String = UIDUtil.createUID();

		
		public static const EVENT_GETFILTROS:String = UIDUtil.createUID();
		public static const EVENT_INGRESO_FILTROS:String = UIDUtil.createUID();
		public static const EVENT_ELIMINA_FILTRO:String = UIDUtil.createUID();
		
		
		

        public function Controller()
        {		
			//WS Events
			addCommand(Controller.EVENT_LOGIN_USUARIO, Login_AgenteCommand);
			addCommand(Controller.EVENT_GETFILTROS, GetFiltrosCommand);
			addCommand(Controller.EVENT_INGRESO_FILTROS, IngresoFiltrosCommand);
			addCommand(Controller.EVENT_ELIMINA_FILTRO, EliminaFiltrosCommand);
			
			
			//WebOrb Events
			
       	}
    }
}


