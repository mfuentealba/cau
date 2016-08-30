package com.larrainvial.gpatrimonial.orders.vo
{
	import com.adobe.cairngorm.vo.IValueObject;

	[Bindable]
	public class LoginVO extends ObjectFiller implements IValueObject
	{
	    public var id_empleado:String;
	    public var nombre_empleado:String;
	    public var apellido_paterno_empleado:String; 
	    public var apellido_materno_empleado:String;
	    public var id_unidad:String;
	    public var nombre_unidad:String;
	    public var id_funcion:String;
	    public var codigo_funcion:String;
	    public var codigo:String;
	    public var Area:String;
	    public var Concurso:String;
	    public var dominio:String;
	    public var userlog:String;
	}
}

