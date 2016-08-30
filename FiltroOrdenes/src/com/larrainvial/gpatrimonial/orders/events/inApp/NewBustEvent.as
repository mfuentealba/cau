package com.larrainvial.gpatrimonial.orders.events.inApp
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.gpatrimonial.orders.controller.Controller;
	import com.larrainvial.gpatrimonial.orders.vo.ExecRptVo;
	
	import flash.events.Event;
	
	public class NewBustEvent extends CairngormEvent 
	{
	    public var ExecRpt:ExecRptVo;
	
	    public function NewBustEvent(execRpt:ExecRptVo) 
		{
	        this.ExecRpt = execRpt;
	        super(Controller.EVENT_NEW_BUST);
	    }
	}
}