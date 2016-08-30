package useful
{
	import com.larrainvial.gpatrimonial.orders.components.PanelError;

	public class ManejoErrorT24
	{
		
		/**************************ALERTA ERROR T24*******************************************/
		public static const ALERTA_INFORMACION :String = 'alerta_informacion';                          
		public static const ALERTA_ERROR :String = 'alerta_error';          
		public static const ERROR_WS:String = 'error_ws';
		public static const ERROR_WS_FALLO:String = 'error_ws_fallo';                               
		public static const ERROR_GENERAL:String = 'error_general';
		public static const ERROR_TRANSACCION:String = 'error_trans';
		
		public static function ValidaError(strXMLRespuesta:XML):Boolean
		{
			try
			{
				var bBand:Boolean = false;
				var nroAuxError :String = strXMLRespuesta.Error.Estado;
				
				if (nroAuxError != "-1")
				{
					bBand = true;
				}
			}
			catch (err:Error)
			{
				//PopAlertaCustomError(UtilT24.ALERTA_INFORMACION,UtilT24.ERROR_GENERAL,"Fallo al intentar leer el nodo de Error del Servicio");
			}
			finally
			{
				return bBand;
			}		
		}
		
		public static function DetalleError(strXMLRespuesta:XML):String
		{
			try
			{
				var strAux:String = "";
				strAux = String(strXMLRespuesta.Error.Desc);
				if (strAux == "")
				{
					strAux = "No hay referencia al detalle del Error";
				}
			}
			catch (err:Error)
			{
				//CLASEUTILES.PopAlertaCustomError(UtilT24.ALERTA_INFORMACION,UtilT24.ERROR_GENERAL,"Fallo al intentar leer el nodo de Error del Servicio");
			}
			finally
			{
				return strAux;
			}		
		}		
		
		
		
		/**
		 * Levanta una alerta Personalizada
		 */
		public static function PopAlertaCustomError(tipo:String,name:String,strXmlError:String="No hay especificaciones técnicas", obj:* = null):void
		{
			if(obj == null){
				var popAlerta:* = new PanelError();	
			} else {
				popAlerta = obj;	
			}
			
			switch(tipo.toUpperCase())
			{
				case ALERTA_ERROR.toUpperCase() :                  
					popAlerta.strTitulo = "Falla en la Aplicación - Larrain Vial";
					popAlerta.strTipo = ALERTA_ERROR;
					break;
				case ALERTA_INFORMACION.toUpperCase() : 
					popAlerta.strTitulo = "Información - Larrain Vial";
					popAlerta.strTipo = ALERTA_INFORMACION;                                                 
					break;
				default : break;
			}
			
			switch(name.toUpperCase())
			{
				case ERROR_WS.toUpperCase() :                           
					popAlerta.strMensaje = "Los servicio Web no están disponibles.\n\nComuniquese con su Administrador";
					popAlerta.strAyuda = strXmlError; //AQUI FUNCION QUE TRATE EL XML
					break;
				case ERROR_WS_FALLO.toUpperCase() :            
					popAlerta.strMensaje = "Fallo al intentar ejecutar el servicio.\n\nComuniquese con su Administrador";
					popAlerta.strAyuda = strXmlError; //AQUI FUNCION QUE TRATE EL XML
					break;                                                                                                                                                                                              
				case ERROR_GENERAL.toUpperCase() :               
					popAlerta.strMensaje = "Se ha detectado un problema en la aplicación.\n\nComuniquese con su Administrador";
					popAlerta.strAyuda = strXmlError;
					break;
				case ERROR_TRANSACCION.toUpperCase() :               
					popAlerta.strMensaje = "Se ha detectado un problema en la transacción.\n\n";
					popAlerta.strAyuda = strXmlError;
					break;
				default : break;
			}                                             
			
			popAlerta.show();
		}              

		
	}
}