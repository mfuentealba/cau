package vo
{
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="Weborb.cau.ClasificacionVO")]
	[Bindable] 
	public class ClasificacionVO
	{
		public var idClasificacion:int;
		public var NombreClasificacion:String;
		public var arrCategorias:ArrayCollection = new ArrayCollection();
		
		public function ClasificacionVO()
		{
			
		}

	}
}