package vo
{
	[RemoteClass(alias="Weborb.cau.DescripcionVO")]
	[Bindable] 
	public class DescripcionVO
	{
		public var idDescripcion:int;
		public var nombreDescripcion:String;
		public var idFormaAtencion:int;
		public var idTiempoSolucion:int;
		public var asociada:String;
		
		public function DescripcionVO()
		{
			
		}

	}
}