package vo
{
	import model.ModelApp;
	
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="Weborb.cau.TicketVO")]
	[Bindable] 
	public class TicketVO
	{
		public var id:String = '';
		public var tipo_solucion:String = '';
		public var problema:int = 0;
		public var sub_problema:int = 0;
		public var rotulo:String = '';
		public var dir_ip:String = '';
		private var _cliente_rut:String = '';
		public var fecha:int = 0;
		public var hora:String = '';
		public var soporte:String = '';
		public var estado:String = '';
		public var descripcion:String = '';
		public var hora_cierre:String = '';
		public var fecha_cierre:int = 0;
		public var asignado_por:String = '';
		public var comentario_cierre:String = '';
		public var problema_e:int = 0;
		public var sub_problema_e:String = '';
		public var solucion_dada_por:String = '';
		public var idClasificacion:int = 0;
		public var idDescripcion:int = 0;
		public var tiempoSolucion:int = 0;
		public var administracionRemota:int = 0;
		public var tipoNivel:int = 0;
		public var reporteSolucionado:int = 0;
		public var fechaSolucion:String = '';
		public var horaSolucion:String = '';
		public var solucionadoPor:String = '';
		public var clasificacionCierre:int = 0;
		public var categoriaCierre:int = 0;
		public var subcategoriaCierre:int = 0;
		public var descripcionCierre:int = 0;
		public var creadoPor:String = '';
		public var clienteVO:ClienteVO;
		public var arrComentarios:ArrayCollection;
		private var modelApp:ModelApp = ModelApp.getInstance();
		
		public function get cliente_rut():String
		{
			return _cliente_rut;
		}

		public function set cliente_rut(value:String):void
		{
			_cliente_rut = value;
			clienteVO = modelApp.objClientesRut[value]['obj'];
		}

	}
}