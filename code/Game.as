package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Game extends MovieClip {
		
		
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
			
			if(player.collider.checkOverlap(platform.collider)){
				platform.alpha = .5;
			} else {
				platform.alpha = 1;
			}
			
		}
		
	} // ends Game class
	
} // ends package
