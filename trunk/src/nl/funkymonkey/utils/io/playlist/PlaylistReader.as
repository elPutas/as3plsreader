package nl.funkymonkey.utils.io.playlist 
{
	import nl.funkymonkey.firelog.core.Logger;	
	import nl.funkymonkey.utils.io.playlist.events.ParseEvent;
	import nl.funkymonkey.utils.io.playlist.types.pls.PLSParser;

	import flash.filesystem.*;	
	/**
	 * PlaylistReader -- Reads in a PLS, M3U or XSPF
	 * 
	 * @description: Reads in playlist formats async manner
	 * 
	 * TODO: 
	 * 		- Add support for B4S  -- WinAmp3 XML Based playlist format
	 * 		- Add support for M3U  -- WinAmp3 XML Based playlist format
	 * 		- Add support for XSPF -- WinAmp3 XML Based playlist format
	 * 		- Maybee nice to return the user with a custom PLSFile Object containing file's size, type, name, location, 
	 * 		extension and duration (PLS extends File)
	 * 		- Check during parsing if loaded file is truly of input type -- else throw error
	 * 
	 * NOTES:
	 * 
	 * If you want to use the FireLog Logger, go to http://www.funky-monkey.nl/blog/
	 * 
	 * 
	 * FIXME:
	 * 
	 * USE:
	 * 
	 * // import appropriate files
	 * import nl.funkymonkey.utils.io.playlist.PlaylistReader;
	 * import flash.filesystem.*;
	 * 
	 * // make a reference to a file on the desktop
	 * var plsFile:File = File.desktopDirectory.resolvePath("default.pls");
	 * 
	 * // instanciate new PlayListReader object with file reference
	 * var pls:PlaylistReader = new PlaylistReader();
	 * pls.addEventListener(ParseEvent.FILE_PARSED, parsedPLS, false, 0, true);
	 * pls.source = plsFile;
	 * 
	 * private function parsedPLS( evt:ParseEvent):void {
	 * 		var plsFile:PLSFile = evt.target.fileData as PLSFile.
	 * 		
	 * }
	 * 
	 * 		
	 * @author Sidney de Koning, sidney@funky-monkey.nl
	 */
	public class PlaylistReader extends EventDispatcher {

		private static var VERSION:String = "1.0.1";
		private static var AUTHOR:String = "Sidney de Koning";
		//
		private var _file:File;
		private var _fileStream:FileStream;
		private var _fileData:String;
		//
		function PlaylistReader( ) {			
		}

			_file = value;
			
			switch(extension.toUpperCase( ))
			{
				case "PLS":
					// Handle loading of PLS files
					loadPLS( );
					break;
				case "M3U":
					// Handle loading of M3U files
					break;
				case "XSPF":
					// Handle loading of XSPF files
					break;
			}
		}

			
			// Open stream for string data
			_fileStream = new FileStream( );
			_fileStream.addEventListener( Event.COMPLETE , handleFileReadComplete );
			_fileStream.addEventListener( Event.OPEN , handleFileOpenComplete );
			_fileStream.addEventListener( ProgressEvent.PROGRESS , handleProgress );
			_fileStream.addEventListener( IOErrorEvent.IO_ERROR , handleIOError );
			//			
			_fileStream.openAsync( _file , FileMode.READ );
		}

			Logger.info( "Binary file loaded --> ASYNC" );

			doFileParse( );
		}

			
			_fileData = _fileStream.readMultiByte( _fileStream.bytesAvailable , File.systemCharset );
						
			var fileObj:Array;
			switch(extension.toUpperCase( ))
			{
				case "PLS":
					// Handle specific parsing of PLS files
					fileObj = PLSParser.parse( _fileData );
					break;
				case "M3U":
					// Handle specific parsing of M3U files
					fileObj = PLSParser.parse( _fileData );
					break;
				case "XSPF":
					// Handle specific parsing of XSPF files
					fileObj = PLSParser.parse( _fileData as XML );
					break;
			}
			
			Logger.info( "File parsed, now dispatch a ParseEvent.FILE_PARSED" );
			dispatchEvent( new ParseEvent( ParseEvent.FILE_PARSED , fileObj , extension ) );
		}

		}

			
			Logger.info( _fileStream.position + " :: " + _fileStream.bytesAvailable );
		}

			// POSSIBLE SCENARIOS:
			// The file does not exist; you do not have adequate permissions to open the file; 
			// you are opening a file for read access, and you do not have read permissions; 
			// or you are opening a file for write access, and you do not have write permissions.
		}

			return _file.extension;			
		}

			return VERSION;
		}

			return AUTHOR;
		}
	}
}