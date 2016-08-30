package com.larrainvial.gpatrimonial.orders.vo
{
	import com.adobe.cairngorm.vo.IValueObject;
	
	[Bindable]
	public class WebServicesVo extends ObjectFiller implements IValueObject
	{
		public var id :String;
		public var wsdl :String;
		public var uri :String;
	}
}