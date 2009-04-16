package nl.funkymonkey.utils.io.playlist.events 
{
	/**
		public static const BEGIN_FILE_PARSE:String = "ParseEvent.BEGIN_FILE_PARSE";
		private var _extension:String;
		private var _parsedFiles:Array;

		
		public function ParseEvent(eType:String, pParsedFile:Array, pExtension:String, pBubbles:Boolean = false, eCancelable:Boolean = false) {
			super( eType , pBubbles , eCancelable );
			
			_parsedFiles = pParsedFile;
			_extension = pExtension;
		}

		
		public function get fileData():Array {
			return _parsedFiles;
		}

		
		public function get extension():String {
			return _extension;
		}

		
		override public function clone():Event {
			return new ParseEvent( type , _parsedFiles , _extension , bubbles , cancelable );
		}
	}