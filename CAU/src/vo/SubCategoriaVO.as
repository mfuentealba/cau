package vo
{
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="Weborb.cau.SubCategoriaVO")]
	[Bindable] 
	public class SubCategoriaVO
	{
		public var idSubCategoria:int;
		public var nombreSubCategoria:String;
		public var arrAsociadosIn:ArrayCollection = new ArrayCollection();
		public var arrAsociadosOut:ArrayCollection = new ArrayCollection();
		public var asociada:String;
		
		public function SubCategoriaVO()
		{
			
		}

	}
}