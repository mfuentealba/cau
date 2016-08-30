package useful
{
	import com.larrainvial.gpatrimonial.orders.components.PanelError;
	
	import mx.collections.ArrayCollection;
	import mx.utils.UIDUtil;
	
	public class UtilT24
	{
		/***************************** INICIO VARIABLES ***********************************/
		private static var df:DateFormatterT24 = new DateFormatterT24();
		/***************************** INICIO VARIABLES ***********************************/
		
		/***************************** INICIO CABECERAS OFS ***********************************/
		private static const _CabeceraInputTransactionOFS:String = "LV.INTRANET.XML,SERVICE/I/PROCESS,DMUSER.1/bonafont1/CL0010002,,STRING::=";
		private static const _CabeceraInputEnquiryOFS:String = "ENQUIRY.SELECT,,DMUSER.1/bonafont1,E.XML.TO.T24,XML.IN:EQ="
		/***************************** FIN CABECERAS OFS ***********************************/
		
		/***************************** INICIO LOGICA XML NODOS ***********************************/
		private static const constXMLNodeLengthResponseEnquiryClose:int = 15;
		private static const constXMLNodeNameResponseEnquiryOpen:String = "<XMLRespuesta>";
		private static const constXMLNodeNameResponseEnquiryClose:String = "</XMLRespuesta>";
		
		private static const constXMLNodeLengthResponseTransactionClose:int = 6;
		private static const constXMLNodeNameResponseTransactionOpen:String = "<T24>";
		private static const constXMLNodeNameResponseTransactionClose:String = "</T24>";
		
		
		/***************************** FIN LOGICA XML NODOS ***********************************/
		
		/***************************** INICIO CONDICIONES DE FILTRO ENQUIRY ***********************************/
		public static const CONDICION_NUMERO_FECHA_MAYOR_IGUAL:String = "[GE]VALOR";
		public static const CONDICION_NUMERO_FECHA_MENOR_IGUAL:String = "[LE]VALOR";
		public static const CONDICION_NUMERO_FECHA_MAYOR_QUE:String = "[GT]VALOR";
		public static const CONDICION_NUMERO_FECHA_MENOR_QUE:String = "[LT]VALOR";
		public static const CONDICION_NUMERO_FECHA_BETWEEN:String = "[RG]VALOR";
		
		public static const CONDICION_NUMERO_TEXTO_IGUAL:String = "[EQ]VALOR";
		public static const CONDICION_NUMERO_TEXTO_DISTINTO:String = "[NE]VALOR";
		public static const CONDICION_TEXTO_LIKE_COMIENZA:String = "[LK]VALOR...";
		public static const CONDICION_TEXTO_LIKE_CONTIENE:String = "[LK]...VALOR...";
		public static const CONDICION_TEXTO_LIKE_TERMINA:String = "[LK]...VALOR";
		public static const CONDICION_TEXTO_UNLIKE_COMIENZA:String = "[UL]VALOR...";
		public static const CONDICION_TEXTO_UNLIKE_CONTIENE:String = "[UL]...VALOR...";
		public static const CONDICION_TEXTO_UNLIKE_TERMINA:String = "[UL]...VALOR";
		
		
		
		
		/***************************** FIN CONDICIONES DE FILTRO ENQUIRY ***********************************/
		
		/**
		 *  Funcion que permite retornar el Mensaje Entrada Transaccion OFS XML a enviar hacia T24
		 **/		
		public static function returnMessageInputTransactionOFS (strServicio:String,strMetodo:String,arrValores:ArrayCollection):String
		{
			return _CabeceraInputTransactionOFS +  callServiceT24Transaccion(strServicio,strMetodo,arrValores);
		}
		
		/**
		 *  Funcion que permite retornar el Mensaje Entrada Enquiry OFS XML a enviar hacia T24
		 **/		
		public static function returnMessageInputEnquiryOFS (strServicio:String,strMetodo:String,arrValores:ArrayCollection):String
		{
			return _CabeceraInputEnquiryOFS +  callServiceT24Enquiry(strServicio,strMetodo,arrValores);
		}		
		
		
		/**
		 *  Funcion que permite armar ArrayCollection con la data de parametros a enviar en callServiceT24
		 **/		
		public static function addParamWebMethod(strNameNodo:String, strValorNodo:String, arrValores:ArrayCollection):void
		{
			var objParam:ParamWebStruct = new ParamWebStruct();
			objParam.NameNodo = strNameNodo;
			objParam.ValorNodo = strValorNodo;
			arrValores.addItem(objParam);
		}
		
		/**
		 *  Funcion que permite armar ArrayCollection con la data de parametros a enviar en callServiceT24
		 **/		
		public static function addParamWebMethodEnquiry(strNameNodo:String, strValorNodo:String, arrValores:ArrayCollection,strCondicionFiltro:String = ""):void
		{
			var objParam:ParamWebStruct = new ParamWebStruct();
			if(strValorNodo != "")
			{
				objParam.NameNodo = strNameNodo;
				objParam.ValorNodo = generarCondicionEnquiry(strValorNodo,strCondicionFiltro);
				arrValores.addItem(objParam);	
			}
		}		
		
		/**
		 *  Funcion que permite armar los parametros para llamada del servicio.
		 **/
		private static function callServiceT24Transaccion(strServicio:String,strMetodo:String,arrValores:ArrayCollection):String
		{
			var strRetorno:String = "<T24>" + 
				"<Servicio>" + strServicio +  "</Servicio>" + 
				"<Metodo>" + strMetodo +  "</Metodo>" +
				"<IdUnico>" + UIDUtil.createUID() +  "</IdUnico>" +
				"<Parametros>";
			
			for each (var obj:ParamWebStruct in arrValores)
			{
				strRetorno = strRetorno + "<" + obj.NameNodo + ">" + obj.ValorNodo + "</" + obj.NameNodo + ">" ;
			}
			
			strRetorno = strRetorno + "</Parametros></T24>";
			
			trace(strRetorno);
			return caracteresOFS(strRetorno);
		}	
		
		/**
		 *  Funcion que permite armar los parametros para llamada del servicio.
		 **/
		private static function callServiceT24Enquiry(strServicio:String,strMetodo:String,arrValores:ArrayCollection):String
		{
			var strRetorno:String = "<T24>" + 
				"<Servicio>" + strServicio +  "</Servicio>" + 
				"<Metodo>" + strMetodo +  "</Metodo>" +
				"<IdUnico>" + UIDUtil.createUID() +  "</IdUnico>" +
				"<Parametros>";
			
			for each (var obj:ParamWebStruct in arrValores)
			{
				if(obj.ValorNodo != "")
					strRetorno = strRetorno + "<" + obj.NameNodo + ">" + obj.ValorNodo + "</" + obj.NameNodo + ">" ;
			}
			
			strRetorno = strRetorno + "</Parametros></T24>";
			
			trace(strRetorno);
			return caracteresOFS(strRetorno);
		}	
		
		
		/**
		 *  Funcion que permite recuperar el XML de la respuesta XML-OFS Transaccion.
		 **/
		public static function returnMessageOutputTransactionOFS (strDataT24:String = ""):String 
		{
			var strRetorno:String = "";  
			
			try
			{
				var xmlDatos:XMLList = XMLList(strDataT24);
				
				if(strDataT24.search(constXMLNodeNameResponseTransactionOpen) != -1)		
				{
					strRetorno +=  "<XMLRespuesta><XMLDatos>" + returnMessageOutputTrasactionInternalOFS(String(xmlDatos.children()[0])) + "</XMLDatos>";
					strRetorno += "<Error><Estado>" + returnIsError(String(xmlDatos.children()[1]))  + "</Estado><Desc>" + xmlDatos.children()[1] + "</Desc></Error>"; 
					strRetorno += "</XMLRespuesta>" ;	
				}
				else
				{
					strRetorno = "<XMLRespuesta><XMLDatos/><Error><Estado>-1</Estado><Desc>Error al intentar parsear XML de T24 (Verificar si la transaccion fue realizada ok)</Desc></Error></XMLRespuesta>"
				}
				
			}
			catch(e:Error)
			{
				strRetorno = "<XMLRespuesta><XMLDatos/><Error><Estado>-1</Estado><Desc><![CDATA[Error al intentar parsear XML de T24\n\n" + strDataT24 + "]]></Desc></Error></XMLRespuesta>"
			}
			
			trace(strRetorno);
			return strRetorno;
			
		}

		
		private static function returnIsError(strReqResponse:String):String
		{
		//	if(strReqResponse.search(constXMLNodeNameResponseTransactionOpen) != -1)
				return (strReqResponse.search("/-1/") != -1 ? "-1" : "1");
			
			//SALIDA ERROR POR DEFECTO
			//return "-1" 
		}

		
		/**
		 *  Funcion que permite recuperar el XML de la respuesta XML-OFS Transaccion INTERNO
		 **/
		private static function returnMessageOutputTrasactionInternalOFS (strDataT24:String = ""):String 
		{
			return strDataT24.substring(strDataT24.search(constXMLNodeNameResponseTransactionOpen),strDataT24.search(constXMLNodeNameResponseTransactionClose) + constXMLNodeLengthResponseTransactionClose);
			
		}
		
		/**
		 *  Funcion que permite recuperar el XML de la respuesta XML-OFS Enquiry
		 **/
		public static function returnMessageOutputEnquiryOFS (strDataT24:String = ""):String 
		{
			if(strDataT24.search(constXMLNodeNameResponseEnquiryOpen) != -1)
				return strDataT24.substring(strDataT24.search(constXMLNodeNameResponseEnquiryOpen),strDataT24.search(constXMLNodeNameResponseEnquiryClose) + constXMLNodeLengthResponseEnquiryClose);
			
			//SALIDA POR DEFECTO
			return "<XMLRespuesta></XMLDatos><Error><Estado>-1</Estado><Desc>Error al intentar parsear XML de T24</Desc></Error></XMLRespuesta>";
			
			
			
		}
		
		/**
		 * Reemplaza caracteres OFS especiales
		 */
		private static function caracteresOFS(strCadena:String):String
		{
			var strRetorno:String = strCadena;
			strRetorno = strRetorno.split(",").join("?");	
			strRetorno = strRetorno.split('"').join("|");	
			strRetorno = strRetorno.split("/").join("^");			 			 	
			
			return strRetorno;
		}
		
		/**		* Genera formato para Portafolio de Cliente
		 */
		public static function generarPortafolioCliente(strRut:String, strCuenta:String):String
		{
			return strRut.split("-")[0] == "" ? "0" : strRut.split("-")[0] + "-" + String(int(strCuenta)+100) ; 
		}
		
		
		/**
		 * Genera Condicion de Filtros Enquiry
		 */
		public static function generarCondicionEnquiry(strValorFiltro:String, strCondicionFiltro:String = "" ):String
		{
			return strCondicionFiltro == "" ? CONDICION_NUMERO_TEXTO_IGUAL.replace("VALOR",strValorFiltro): strCondicionFiltro.replace("VALOR",strValorFiltro);
		}
		
		/**
		 * Retorna Fecha en Formato T24
		 */
		public static function formatoFechaT24 (dFecha:Date):String
		{
			return df.format(dFecha)
		}
		
		
		/**
		 * Retorna Fecha en Formato T24. El input es un string dd-mm-yyyy
		 */
		public static function formatoFechaStringT24 (dFecha:String):String
		{
			var arr:Array = dFecha.split("-");
			var date:Date = new Date();
			date.date = int(arr[0]);
			date.month = int(arr[1]) - 1;
			date.fullYear = int(arr[2]);
			
			
			return df.format(date)
		}
		
		
		/**
		 * Transforma Fecha en Formato T24 a un string dd-mm-yyyy
		 */
		public static function transFecT24aFecSis (dFecha:String):String
		{
			return dFecha.substr(6, 2) + '-' + dFecha.substr(4, 2)  + '-' + dFecha.substr(0, 4);
		}
		
	}
}