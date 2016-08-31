package components
{
	import mx.binding.utils.BindingUtils;
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.core.mx_internal;
	import mx.states.SetStyle;
	
	import spark.components.BorderContainer;
	import spark.components.Panel;
	
	public class CustomPanelSpark extends Panel
	{
		[Bindable][Embed(source="assets/icons/menu.png")] public var imgSrcMenu:Class;
		[Bindable][Embed(source="assets/icons/add2.png")] public var imgSrcSave:Class;
		[Bindable][Embed(source="assets/icons/edit.png")] public var imgSrcEdit:Class;
		[Bindable][Embed(source="assets/icons/remove2.png")] public var imgSrcDelete:Class;
		[Bindable][Embed(source="assets/icons/menu2.png")] public var imgSrcMenu2:Class;
		[Bindable] public var imgBl:Boolean = false;
		[SkinPart] public var bcElementos:BorderContainer;
		private var _arrContenido:ArrayCollection = new ArrayCollection();
		[Bindable] public var minBl:Boolean;
		[Bindable] public var opBl:Boolean;
		[Bindable] public var closeBl:Boolean;
		public var fnCallback:Function;
		
		public function CustomPanelSpark()
		{
			
			super();
			
		}
		
		
		public function get arrContenido():ArrayCollection
		{
			return _arrContenido;
		}

		public function set arrContenido(value:ArrayCollection):void
		{
			_arrContenido = value;
			/*if(value && value.length > 0){
				imgBl = true;
				for each(var obj:* in value){
					bcElementos.addElement(obj);	
				}
				
			} else {
				imgBl = false;
			}*/
		}

		
	}
}
