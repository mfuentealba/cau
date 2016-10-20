package components
{
	import flash.events.MouseEvent;
	
	import mx.collections.IList;
	
	import spark.components.CheckBox;
	import spark.components.DataGrid;
	
	public class CustomDataGridSpark extends DataGrid
	{
		public var arrSelectorTodo:Array = new Array();

		public function get chk():CheckBox
		{
			return _chk;
		}

		public function set chk(value:CheckBox):void
		{
			_chk = value;
			if(value != null && _fnEncabezado != null){				
				_chk.addEventListener(MouseEvent.CLICK, _fnEncabezado);				
			}
		}

		public function get fnEncabezado():Function
		{
			return _fnEncabezado;
		}

		public function set fnEncabezado(value:Function):void
		{
			_fnEncabezado = value;
			/*if(value != null){
				chk.addEventListener(MouseEvent.CLICK, _fnEncabezado);				
			}*/
			
		}

		private var _fnEncabezado:Function;
		private var _chk:CheckBox;
		
		
		override public function get columns():IList
		{
			// TODO Auto Generated method stub
			return super.columns;
		}
		
		override public function set columns(value:IList):void
		{
			// TODO Auto Generated method stub
			super.columns = value;
		}
		
		
		public function CustomDataGridSpark()
		{
			super();
		}
	}
}