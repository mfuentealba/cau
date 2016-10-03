package vo
{
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="Weborb.cau.NotificacionVO")]
	[Bindable] 
	public class NotificacionVO
	{
		public var id:String;
		public var mensaje:String;
		public var tipo:String;
		public var fecha:String;
	}
}