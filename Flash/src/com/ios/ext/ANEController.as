package com.ios.ext
{
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	import flash.utils.getTimer;

	public class main extends EventDispatcher
	{
		private var _ec:ExtensionContext;
		/****/
		private static const extensionID:String = "com.ane.os.device.info";
		
		/**
		 * 初始化ANE物件, 監聽ANE回傳事件, ANE初始化
		 **/
		public function main()
		{
			_ec = ExtensionContext.createExtensionContext(extensionID, null);
			//extension ansyc event
			_ec.addEventListener(StatusEvent.STATUS, handleContextStatus);
			
			trace("[AS3] Initization Create Extension Context.");
		}
		
		protected function handleContextStatus(e:StatusEvent):void
		{
			trace("Event:" + e.code + ",Value:" + e.level);
		}
		
		public function get isSupported():Boolean
		{
			var bool:Boolean = false;
			bool = _ec.call("isSupported") as Boolean;
			return bool;
		}
	}
}