package components
{
	import mx.validators.StringValidator;
	import mx.validators.ValidationResult;
	
	public class RutValidacion extends StringValidator
	{
		public var rutError:String = 'Rut no válido';
		
		
		public function RutValidacion()
		{
			super();
		}
		
		override protected function doValidation(value:Object):Array
		{
			// TODO Auto Generated method stub
			var arr:Array = super.doValidation(value); 
			var valid:* = revisarDigito(value.toString());
			if(valid){
				arr.push(valid);
			}
			return arr;
		}
		
		
		/*private function revisarDigito(dvr:String):Boolean
		{	
			var dv:String = dvr + "";	
			if ( dv != '0' && dv != '1' && dv != '2' && dv != '3' && dv != '4' && dv != '5' && dv != '6' && dv != '7' && dv != '8' && dv != '9' && dv != 'k'  && dv != 'K')	
			{		
				return false;	
			}	
			return true;
		}*/
		
		private function revisarDigito(crut:String):ValidationResult
		{	
			var arr:Array = crut.split('-');
			
			if (arr.length < 2){		
				return new ValidationResult(true, "", "rutInvalido",
					rutError);  
			}
			
			var rut:String = arr[0];	
			var dv:String = arr[1];	
			//var digito = revisarDigito(dv);	
			
			
			
			var dvr:String = '0';	
			var suma:int = 0;	
			var mul:int  = 2;	
			var val:Boolean = false;
			for(var i:int = rut.length -1 ; i >= 0; i--)	
			{	
				suma = suma + int(rut.charAt(i)) * mul;		
				if (mul == 7)			
					mul = 2;		
				else    			
					mul++;
			}	
			var res:int = suma % 11;	
			if (res==1)		
				dvr = 'k';	
			else if (res==0)		
				dvr = '0';	
			else	
			{		
				var dvi:int = 11 - res;		
				dvr = dvi + "";	
			}
			
			if ( dvr != dv.toLowerCase() )	
			{		
				return new ValidationResult(true, "", "rutInvalido",
					rutError);  
			}
			
			return null;
			
		}
	}
}