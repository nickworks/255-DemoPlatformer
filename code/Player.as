package code {
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	
	public class Player extends MovieClip {
		
		private var gravity:Point = new Point(0,100);
		
		private var velocity:Point = new Point(1, 5);
		
		private const HORIZONTAL_ACCELERATION:Number = 100;
		private const HORIZONTAL_DECELERATION:Number = 100;
		
		
		public function Player() {
			// constructor code
		} // ends constructor
		
		public function update():void {
			
			
			if(KeyboardInput.keyLeft) velocity.x -= HORIZONTAL_ACCELERATION * Time.dt;
			if(KeyboardInput.keyRight) velocity.x += HORIZONTAL_ACCELERATION * Time.dt;
			
			if(!KeyboardInput.keyLeft && !KeyboardInput.keyRight){ // left and right not being pressed...
				if(velocity.x < 0){ // moving left
					velocity.x += HORIZONTAL_DECELERATION * Time.dt; // accelerate right
					if(velocity.x > 0) velocity.x = 0; // clamp at 0
				}
				if(velocity.x > 0){ // moving right
					velocity.x -= HORIZONTAL_DECELERATION * Time.dt; // accelerate left
					if(velocity.x < 0) velocity.x = 0; // clamp at 0
				}
			}
			
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
