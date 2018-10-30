package code {
	
	public class AABB {

		// ??
		private var halfWidth:Number;
		private var halfHeight:Number;
		
		public var xmin:Number;
		public var xmax:Number;
		public var ymin:Number;
		public var ymax:Number;
		
		public function AABB(halfWidth:Number, halfHeight:Number) {
			setSize(halfWidth, halfHeight);
		}
		public function setSize(halfWidth:Number, halfHeight:Number):void {
			this.halfWidth = halfWidth;
			this.halfHeight = halfHeight;
			// recalculate edges!!!
			calcEdges((xmin + xmax)/2, (ymin + ymax)/2);
		}
		/**
		 * Calculate the position of the 4 edges from the center (x,y) position.
		 */
		public function calcEdges(x:Number, y:Number):void {
			xmin = x - halfWidth;
			xmax = x + halfWidth;
			ymin = y - halfHeight;
			ymax = y + halfHeight;

		}
		/**
		 * This function checks to see if this AABB
		 * is overlapping another AABB.
		 * @param other	The other AABB to check this AABB against.
		 * @return Whether or not they are overlapping. If true, they are overlapping.
		 */
		public function checkOverlap(other:AABB):Boolean {
			
			if(this.xmax < other.xmin) return false; // gap to the right
			if(this.xmin > other.xmax) return false; // gap to the left
			if(this.ymax < other.ymin) return false; // gap below
			if(this.ymin > other.ymax) return false; // gap above
			
			return true;
		}
	}
	
}
