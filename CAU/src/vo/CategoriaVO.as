package vo
{
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="Weborb.cau.CategoriaVO")]
	[Bindable] 
	public class CategoriaVO
	{
		public var idCategoria:int;
		public var NombreCategoria:String;
		public var arrAsociadosIn:ArrayCollection = new ArrayCollection();
		public var arrAsociadosOut:ArrayCollection = new ArrayCollection();
		
		public function CategoriaVO()
		{
			
		}

	}
}