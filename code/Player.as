package code {
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import fl.motion.easing.Back;
	
	
	public class Player extends MovieClip {
		
		private var gravity:Point = new Point(0,1000);
		private var maxSpeed:Number = 200;
		private var velocity:Point = new Point(1, 5);
		
		private const HORIZONTAL_ACCELERATION:Number = 800;
		private const HORIZONTAL_DECELERATION:Number = 800;
		
		private var isGrounded = false;
		/**
		 * Whether or not the player is moving upward in a jump. This effects gravity.
		 */
		private var isJumping = false;
		private var airJumpsLeft:int = 1;		
		private var airJumpsMax:int = 1;
		
		private var jumpVelocity:Number = 400;
		
		public var collider:AABB;
		
		public function Player() {
			collider = new AABB(width/2, height/2);
			
		} // ends constructor
		
		public function update():void {
			
			handleJumping();
			handleWalking();
			doPhysics();			
			detectGround();
			
			collider.calcEdges(x, y);
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
		
		private function handleJumping():void {
			if(KeyboardInput.OnKeyDown(Keyboard.SPACE)){ // jump was pressed...
				if(isGrounded){ // we are on the ground...
					velocity.y = -jumpVelocity; // apply an impulse up
					isGrounded = false; // not on ground
					isJumping = true;
				} else { // in air, attempting a double-jump
					if(airJumpsLeft > 0){ // if we have air-jumps left:
						velocity.y = -jumpVelocity; // air jump
						airJumpsLeft--;
						isJumping = true;
					}
				}
			}
			
			
			if(!KeyboardInput.IsKeyDown(Keyboard.SPACE)) isJumping = false;
			if(velocity.y > 0) isJumping = false;
			
		}
		private function doPhysics():void {
			
			var gravityMultiplier:Number = 1;
			if(!isJumping) gravityMultiplier = 2;
			
			// apply gravity to velocity:
			//velocity.x += gravity.x * Time.dt * gravityMultiplier;
			velocity.y += gravity.y * Time.dt * gravityMultiplier;
			
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
				isGrounded = true;
				airJumpsLeft = airJumpsMax;
				y = ground; // clamp
				velocity.y = 0;
			}
		}
		
		
	} // ends Player class
	
} // ends package
