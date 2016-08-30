package com.larrainvial.trading.blotter.commands
{
import com.adobe.cairngorm.commands.ICommand;
import com.adobe.cairngorm.control.CairngormEvent;
import com.larrainvial.trading.blotter.controller.Controller;
import com.larrainvial.trading.blotter.events.UpdateClosingEvent;
import com.larrainvial.trading.blotter.events.UpdateOpeningEvent;
import com.larrainvial.trading.blotter.model.ModelLocator;

	public class UpdateOpeningCommand implements ICommand
	{
		public function execute(ev:CairngormEvent):void
		{
			var event:UpdateOpeningEvent = UpdateOpeningEvent(ev);
			var i:int = ModelLocator.symDictionary[event.symbol.toUpperCase() + "||" + event.market.toUpperCase()].Position;
			ModelLocator.allSymbols.source[i].Open = event.opening;
			ModelLocator.allSymbols.refresh();
		}
	}
}