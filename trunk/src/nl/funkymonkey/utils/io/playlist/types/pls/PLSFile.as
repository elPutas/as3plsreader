package nl.funkymonkey.utils.io.playlist.types.pls 
{
	/**
	 * 
	 * PLS File - Same properties as one entry in a PLS playlist
	 * 
		private var _url:String;
		private var _title:String;

		
		public function PLSFile() {

		
		override public function set url(pValue:String):void {
			super.url = pValue;
			_url = pValue;
		}

		
		public function set title(pValue:String):void {
			_title = pValue;
		}

		
		public function set length(pValue:int):void {
			_length = pValue;
		}

		
		override public function get url():String {
			return _url;
		}

		
		public function get length():int {
			return _length;
		}

		
		public function get title():String {
			return _title;
		}
	}