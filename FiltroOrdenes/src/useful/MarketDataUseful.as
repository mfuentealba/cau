package useful
{

import com.larrainvial.gpatrimonial.orders.components.NumberDeformatterLV;
import com.larrainvial.gpatrimonial.orders.vo.DatagridIndexVo;

import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

import mx.collections.ArrayCollection;
import mx.controls.DataGrid;
import mx.utils.ObjectUtil;

    public class MarketDataUseful
    {
		private static var df0:NumberDeformatterLV = new NumberDeformatterLV(0);
		private static var df1:NumberDeformatterLV = new NumberDeformatterLV(1);
		private static var df2:NumberDeformatterLV = new NumberDeformatterLV(2);
		private static var df3:NumberDeformatterLV = new NumberDeformatterLV(3);
		private static var df4:NumberDeformatterLV = new NumberDeformatterLV(4);
		
		public static const CALL_POP_GRID:String = "LLAMADO_DESDE_GRILLA";
		public static const CALL_POP_FORM:String = "LLAMADO_DESDE_FORMULARIO";

        [Bindable] public static var statusCollection:ArrayCollection = new ArrayCollection([{IdStatus: "0", Description: "All"},
            {IdStatus: "1", Description: "Pending Only"},
            {IdStatus: "2", Description: "Pending/Live"}, {IdStatus: "3", Description: "Live Only"},
            {IdStatus: "4", Description: "Live/Trades"}, {IdStatus: "5", Description: "Trades"},
            {IdStatus: "6", Description: "Aborted"}]);

        public static function saveFileDisk(strFile:String, strUrlFileLocate:String):void
        {
            var saveStr:String = strFile;
            var file:File = new File(strUrlFileLocate);
            var fs:FileStream = new FileStream();
            fs.open(file, FileMode.WRITE);
            fs.writeUTFBytes(saveStr);
            fs.close();
        }

        public static function objectEquality (objEquality:*,objDataContainer:*):void
        {
            try
            {
                if (ObjectUtil.isSimple(objDataContainer))
                {
                    objEquality = objDataContainer;
                }
                else
                {
                    for each (var item:QName in ObjectUtil.getClassInfo(objDataContainer).properties)
                    {
                        objEquality[item.localName] = objDataContainer[item.localName]
                    }
                }
            }
            catch(err:Error)
            {
                //TODO: VERIFY TYPE ERROR DISPATCH
            }
        }

        public static function verifyArrColDuplicates (arrParam:ArrayCollection,strNameQ:String,strCompare:String):Boolean
        {
            var bReturn:Boolean = false;

            for each(var itemAux:Object in arrParam)
            {
                if(itemAux[strNameQ] == strCompare)
                {
                    bReturn = true;
                    break;
                }
            }

            return bReturn
        }

        public static function savePositionIndexDataGrid(dataGridParam:DataGrid):DatagridIndexVo
        {
            var objIndex:DatagridIndexVo = new DatagridIndexVo();
            objIndex.dgIndex = new int(dataGridParam.selectedIndex);
            objIndex.dgVerticalPosition = new int(dataGridParam.verticalScrollPosition);

            //TODO: PARA QUE CALCULE EL ALTO DE LA GRILLA DINAMICAMENTE  (VALIDAR DIVISION SOBRE 0)
            var vScroll:int = Math.ceil((dataGridParam.verticalScrollPosition /dataGridParam.maxVerticalScrollPosition)*dataGridParam.rowHeight);

            return objIndex;
        }

        public static function loadPositionIndexDataGrid(dataGridParam:DataGrid,objIndex:DatagridIndexVo):void
        {
            //TODO: ADD VALIDATE DATA INDEX

            dataGridParam.validateNow();

            dataGridParam.selectedIndex = objIndex.dgIndex;
            dataGridParam.verticalScrollPosition = objIndex.dgVerticalPosition;
        }

		
		public static function formateadorDecimal(valor:String,precision:int = 0):Number
		{
			switch (precision)
			{
				case 0: return roundToPrecision(Number(df0.format(valor)),precision); break;
				case 1: return roundToPrecision(Number(df1.format(valor)),precision); break;
				case 2: return roundToPrecision(Number(df2.format(valor)),precision); break;
				case 3: return roundToPrecision(Number(df3.format(valor)),precision); break;
				case 4: return roundToPrecision(Number(df4.format(valor)),precision); break;

			}
 			return roundToPrecision(Number(df2.format(valor)),2);
		}
		
		public static function roundToPrecision(numberVal:Number, precision:int = 0):Number
		{
			var decimalPlaces:Number = Math.pow(10, precision);
			return Math.round(decimalPlaces * numberVal) / decimalPlaces;
		}

    }
}
