package nl.funkymonkey.utils.io.playlist {	import nl.funkymonkey.firelog.core.Logger;	import nl.funkymonkey.utils.io.playlist.events.ParseEvent;
	import flash.filesystem.File;		/*	 * PlaylistReaderTest -- Unit test for playlist reader	 * 	 * @description: Unit test for playlist reader, kindof	 * 	 * @author sidneydekoning	 */	public class PlaylistReaderTest {
		function PlaylistReaderTest() {						build( );		}
		
		private function build():void {						// make a reference to a file on the desktop			var plsFile:File = File.desktopDirectory.resolvePath( "default.pls" );	  			// instanciate new PlayListReader object with file reference			var pls:PlaylistReader = new PlaylistReader( );			pls.addEventListener( ParseEvent.FILE_PARSED , parsedPLS , false , 0 , true );			pls.source = plsFile;						Logger.info( "====== PLS# " + plsFile + " ======" );		}
		
		private function parsedPLS( evt:ParseEvent):void {			var plsFile:Array = evt.fileData as Array;			//Logger.info("====== PLS# " +evt.toString()+ " ======");			//Logger.info("====== PLS FILE   " +plsFile.toString()+ " ======");				//for (var i:int = 0; i< plsFile.length; ++i) {			//			//		Logger.info("====== PLS Item no# " + i + " of "+ plsFile.length + " ======");			//		Logger.info("** file  :" + plsFile[i].file);			//		Logger.info("** title  :" + plsFile[i].title);			//		Logger.info("** length :" + plsFile[i].length);			//		Logger.info("=============================================================");			//}		}	}}