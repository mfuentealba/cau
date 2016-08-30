package com.larrainvial.gpatrimonial.orders.vo
{
	import flash.xml.XMLDocument;
	import flash.xml.XMLNode;
	
	import mx.rpc.xml.SimpleXMLEncoder;

	public class ObjectFiller extends Object
	{
		public var assigned : Boolean = false;
		
		public function set fill(xml:XML):void
		{
		   for each (var i :XML in xml.elements())
		   {
		   		this[i.localName()] = i;
		   }
		}
		
		public function set fillAttributes(xml:XML):void
		{
		   for each (var i :XML in xml.attributes())
		   {
		   		this[i.localName()] = i;
		   }
		}
		
		public  function toXML(obj:Object, strRoot:String):XML 
		{
	       var qName:QName = new QName(strRoot);
           var xmlDocument:XMLDocument = new XMLDocument();
           var simpleXMLEncoder:SimpleXMLEncoder = new SimpleXMLEncoder(xmlDocument);
           var xmlNode:XMLNode = simpleXMLEncoder.encodeValue(obj, qName, xmlDocument);
           var xml:XML = new XML(xmlDocument.toString());
           return xml;
		}
	}
}