package code {
	
	import flash.display.MovieClip;
	
	
	public class Platform extends MovieClip {
		
		public var collider:AABB;
		
		public function Platform() {
			collider = new AABB(width/2, height/2);
			collider.calcEdges(x, y);
		}
	}
	
}
