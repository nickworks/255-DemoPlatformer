package code {
	import flash.utils.getTimer;
	
	/**
	 * The class for handling all game time.
	 */
	public class Time {
		
		/**
		 * How much time has passed since the previous frame. Measured in seconds.
		 */
		public static var dt:Number = 0;
		/**
		 * A scaled version of deltaTime (dt). Uses Time.scale. Measured in seconds.
		 */
		public static var dtScaled:Number = 0;
		/**
		 * The current frame's timestamp. How many milliseconds have passed since the game began.
		 */
		public static var time:Number = 0;
		/**
		 * A scalar for dtScaled. Use this to create slow-mo effects or to pause the game.
		 */
		public static var scale:Number = 1;
		/**
		 * The timestamp of the previous frame, measured in milliseconds.
		 */
		private static var timePrev:Number = 0;
		/**
		 * This method calculates deltaTime. It should be called
		 * ONCE per frame, from the game-loop.
		 */
		public static function update():void {
			time = getTimer();
			dt = (time - timePrev) / 1000;
			dtScaled = dt * scale;
			timePrev = time; // cache for next frame
		}
	}
}
