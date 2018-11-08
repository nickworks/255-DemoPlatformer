package code {
	import flash.geom.Point;
	
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
		/**
		 * This function calculates how far to move THIS box so that it no longer
		 * intersects another AABB.
		 * @param other	The other AABB.
		 * @return The "fix" vector - how far to move this box.
		 */
		public function findOverlapFix(other:AABB):Point {
			
			var moveL:Number = other.xmin - this.xmax;
			var moveR:Number = other.xmax - this.xmin;
			var moveU:Number = other.ymin - this.ymax;
			var moveD:Number = other.ymax - this.ymin;
			
			var fix:Point = new Point();
			
			fix.x = (Math.abs(moveL) < Math.abs(moveR)) ? moveL : moveR;
			fix.y = (Math.abs(moveU) < Math.abs(moveD)) ? moveU : moveD;
			
			if(Math.abs(fix.x) < Math.abs(fix.y)) fix.y = 0;
			else fix.x = 0;
			
			return fix;
		}
		
	}
	
}
