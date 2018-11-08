package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	
	
	public class Game extends MovieClip {
		
		static public var platforms:Array = new Array();
		
		public function Game() {
			KeyboardInput.setup(stage);
			addEventListener(Event.ENTER_FRAME, gameLoop);
		}
		private function gameLoop(e:Event):void {
			Time.update();
			
			player.update();
			doCollisionDetection();
			
			
			KeyboardInput.update();
		} // ends gameLoop()
		
		
		private function doCollisionDetection():void {
			
			for(var i:int = 0; i < platforms.length; i++){
				if(player.collider.checkOverlap(platforms[i].collider)){ // if overlapping...
					// find the fix:
					var fix:Point = player.collider.findOverlapFix(platforms[i].collider);
					// apply the fix:
					player.applyFix(fix);
				}
			} // ends for
			
			
			
		} // ends doCollisionDetection()
		
	} // ends Game class
	
} // ends package
