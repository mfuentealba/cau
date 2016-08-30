package com.larrainvial.gpatrimonial.orders.vo
{
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="com.larrainvial.gpatrimonial.lvordercapturer.vo.ConfigVo")]
	[Bindable]
	public class ConfigVo
	{		
		public var userName:String = "";
		
        public var sideVos:ArrayCollection = new ArrayCollection();
		public var symbolVos:ArrayCollection = new ArrayCollection();		
		public var repository:ArrayCollection = new ArrayCollection();
		public var accountVos:ArrayCollection = new ArrayCollection();
		public var settlTypeVos:ArrayCollection = new ArrayCollection();
		public var ordTypeVos:ArrayCollection = new ArrayCollection();
		public var ctaUser:ArrayCollection = new ArrayCollection();
	}	
}