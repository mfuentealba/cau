package com.larrainvial.gpatrimonial.orders.model
{

import com.larrainvial.gpatrimonial.orders.vo.ConfigVo;

import flash.media.Sound;
import flash.net.NetConnection;
import flash.utils.Dictionary;

import mx.collections.ArrayCollection;
import mx.containers.Box;
import mx.containers.HBox;
import mx.containers.Panel;

import spark.components.Group;

	[Bindable]
	public class ModelLocator 
	{		 
		public static var arrRut:ArrayCollection;
		public static var arrAgente:ArrayCollection;
		public static var arrNemos:ArrayCollection;
		public static var monto:int;
		
		public var servicesCollection:ArrayCollection = new ArrayCollection();
		public static var user:ConfigVo = new ConfigVo();
		
		private static var model:com.larrainvial.gpatrimonial.orders.model.ModelLocator;
		
		//*****************************************************************************************************
		public static function getInstance(): com.larrainvial.gpatrimonial.orders.model.ModelLocator
		{
			if(model == null)
			{
				model = new com.larrainvial.gpatrimonial.orders.model.ModelLocator();
				
			}
			return model;
		}
		//*****************************************************************************************************
	}
}

