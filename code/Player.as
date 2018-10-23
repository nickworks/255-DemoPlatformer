package code {
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	
	public class Player extends MovieClip {
		
		private var gravity:Point = new Point(0,100);
		private var velocity:Point = new Point(1, 5);
		
		
		public function Player() {
			// constructor code
		} // ends constructor
		
		public function update():void {
			
			
			doPhysics();
			
			detectGround();
			
		}
		private function doPhysics():void {
			// apply gravity to velocity:
			velocity.x += gravity.x * Time.dt;
			velocity.y += gravity.y * Time.dt;
			
			// apply velocity to position:
			x += velocity.x * Time.dt;
			y += velocity.y * Time.dt;
		}
		private function detectGround():void {
			// look at y position
			var ground:Number = 350;
			if(y > ground) {
				y = ground; // clamp
				velocity.y = 0;
			}
		}
		
		
	} // ends Player class
	
} // ends package
