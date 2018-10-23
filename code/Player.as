package code {
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	
	public class Player extends MovieClip {
		
		private var gravity:Point = new Point(0,100);
		private var maxSpeed:Number = 200;
		private var velocity:Point = new Point(1, 5);
		
		private const HORIZONTAL_ACCELERATION:Number = 800;
		private const HORIZONTAL_DECELERATION:Number = 800;
		
		
		public function Player() {
			// constructor code
		} // ends constructor
		
		public function update():void {
			
			
			if(KeyboardInput.OnKeyDown(Keyboard.SPACE)){
				trace("jump");
			}
			
			
			handleWalking();
			doPhysics();			
			detectGround();
			
		}
		/**
		 * This function looks at the keyboard input in order to accelerate the player
		 * left or right. As a result, this function changes the player's velocity.
		 */
		private function handleWalking():void {
			if(KeyboardInput.IsKeyDown(Keyboard.LEFT)) velocity.x -= HORIZONTAL_ACCELERATION * Time.dt;
			if(KeyboardInput.IsKeyDown(Keyboard.RIGHT)) velocity.x += HORIZONTAL_ACCELERATION * Time.dt;
			
			if(!KeyboardInput.IsKeyDown(Keyboard.LEFT) && !KeyboardInput.IsKeyDown(Keyboard.RIGHT)){ // left and right not being pressed...
				if(velocity.x < 0){ // moving left
					velocity.x += HORIZONTAL_DECELERATION * Time.dt; // accelerate right
					if(velocity.x > 0) velocity.x = 0; // clamp at 0
				}
				if(velocity.x > 0){ // moving right
					velocity.x -= HORIZONTAL_DECELERATION * Time.dt; // accelerate left
					if(velocity.x < 0) velocity.x = 0; // clamp at 0
				}
			}
			
		}
		private function doPhysics():void {
			// apply gravity to velocity:
			velocity.x += gravity.x * Time.dt;
			velocity.y += gravity.y * Time.dt;
			
			// constrain to maxSpeed:
			if(velocity.x > maxSpeed) velocity.x = maxSpeed; // clamp going right
			if(velocity.x <-maxSpeed) velocity.x = -maxSpeed; // clamp going left
			
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
