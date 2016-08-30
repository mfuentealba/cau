package com.larrainvial.gpatrimonial.orders.utils
{
	import mx.utils.ObjectUtil;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import mx.collections.ArrayCollection;

	public class MyObjectUtil
	{
		public static function clonarObjeto (objClone:*):*
		{
			try
			{
				var objectOB:Object = new Object();
				var strTipoObjeto:String = getQualifiedClassName(objClone);
				var refClass:Class = getDefinitionByName(getQualifiedClassName(objClone)) as Class;
				var objRetorno : Object = new Object();

				if (strTipoObjeto == "int" || strTipoObjeto == "Number" || strTipoObjeto == "String")
				{
					objRetorno = objClone;
				}
				else
				{
					objRetorno = new refClass();
					
					for each (var item:QName in ObjectUtil.getClassInfo(objClone).properties)
					{
						objRetorno[item.localName] = objClone[item.localName]							
					}										
				}
			}
			catch(err:Error)
			{
				objRetorno = objClone; //VERIFICACION FUTURA PARA OBJETOS COMPLEJOS O PRIMARIOS
			}
			finally
			{
				return objRetorno
			}
		}
		
		public static function clonarObjetoArr (objClone:*):*
		{
			try
			{
				var objectOB:Object = new Object();
				var strTipoObjeto:String = getQualifiedClassName(objClone);
				var refClass:Class = getDefinitionByName(getQualifiedClassName(objClone)) as Class;
				var objRetorno : Object = new Object();

				objRetorno = new refClass();
					
				for each (var item:QName in ObjectUtil.getClassInfo(objClone,null,[false,null,true]).properties)
				{
					if(item.localName == "list")
					{
 						var objRetorno2:* = objClone['list'];
						 
						for each(var itemValue:* in objRetorno2['source'])			 
						{
							objRetorno['addItem'].apply(objRetorno, [clonarObjeto(itemValue)]);
						}
					}
					else
					{
						//NO COPIO EL SOURCE
						if(item.localName != "source")
						{
							objRetorno[item.localName] = objClone[item.localName]								
						}

					}
											
				}										
			}
			catch(err:Error)
			{
				objRetorno = objClone; //VERIFICACION FUTURA PARA OBJETOS COMPLEJOS 
			}
			finally
			{
				return objRetorno
			}
		}
		
	
	}
}