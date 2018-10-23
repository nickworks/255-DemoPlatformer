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
			
			
			KeyboardInput.update();
		} // ends gameLoop()
		
		
	} // ends Game class
	
} // ends package
