package code {
	import flash.events.KeyboardEvent;
	import flash.display.Stage;
	
	public class KeyboardInput {

		
		static public var keysState:Array = new Array();
		static public var keysPrevState:Array = new Array();
		
		static public function setup(stage:Stage) {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
		}
		/**
		 * This function's job is to cache all of the key values, for the NEXT frame.
		 */
		static public function update():void {
			keysPrevState = keysState.slice(); // in this context, slice() gives us a copy of the array
		}
		static private function updateKey(keyCode:int, isDown:Boolean):void {
			
			keysState[keyCode] = isDown;
		}
		static private function handleKeyDown(e:KeyboardEvent):void {
			//trace(e.keyCode);
			updateKey(e.keyCode, true);
		}
		static private function handleKeyUp(e:KeyboardEvent):void {
			
			updateKey(e.keyCode, false);
		}
		
		
		static public function IsKeyDown(keyCode:int):Boolean {
			
			if(keyCode < 0) return false;
			if(keyCode >= keysState.length) return false;
			
			return keysState[keyCode];
		}
		static public function OnKeyDown(keyCode:int):Boolean {
			if(keyCode < 0) return false;
			if(keyCode >= keysState.length) return false;
			
			if(keysState[keyCode] == false) return false;
			if(keysPrevState[keyCode] == true) return false;
			
			return true;
			//return (keyStates[keyCode] && !keysPrevState[keyCode]);
			
		}

	}
	
}
