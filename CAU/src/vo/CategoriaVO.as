package vo
{
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="Weborb.cau.CategoriaVO")]
	[Bindable] 
	public class CategoriaVO
	{
		public var idCategoria:int;
		public var NombreCategoria:String;
		public var arrSubCategoriasIn:ArrayCollection = new ArrayCollection();
		public var arrSubCategoriasOut:ArrayCollection = new ArrayCollection();
		
		public function CategoriaVO()
		{
			
		}

	}
}