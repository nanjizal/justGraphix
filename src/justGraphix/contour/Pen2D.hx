package justGraphix.contour;
import justGraphix.contour.io.Array2DTriangles;
class Pen2D implements IPen {
      public var arr = new Array2DTriangles();
      public function new( col: Int ){
          currentColor = col;
      }
      public var pos( get, set ): Float;
      inline function get_pos(): Float {
          return arr.pos;
       
      }
      inline function set_pos( val: Float ): Float {
          arr.pos = val;
          return val;
      }
      public var size( get, never ): Int;
      inline function get_size(): Int {
          var v = arr.size;
          return v;
      }
      public inline
      function triangle2DFill( ax: Float, ay: Float
                                  , bx: Float, by: Float
                                  , cx: Float, cy: Float
                                  , ?color: Null<Int> ): Int {
          if( color == null || color == -1 ) color = currentColor;
          arr.triangle2DFill( ax, ay, bx, by, cx, cy, color );
          arr.pos = arr.pos + 1;
          return 1;
      }
      // This is just to provide implementation for Pen2DGrad
      public function triangle2DGrad( ax: Float, ay: Float
                                    , bx: Float, by: Float
                                    , cx: Float, cy: Float
                                    , ?colorA: Null<Int>, ?colorB: Null<Int>, ?colorC: Null<Int> ): Int {
          if( colorA == null || colorA == -1 ) colorA = currentColor;
          arr.triangle2DFill( ax, ay, bx, by, cx, cy, colorA );
          arr.pos = arr.pos + 1;
          return 1;
      }
      /*
      // removed as lighter to do manually.
      public inline
      function applyFill( fill2D: ( Float, Float, Float, Float, Float, Float, Int )->Void ): Int {
          return arr.applyFill( fill2D );
      }
      */
      public var currentColor: Int;
      public var colorB: Int;
      public var colorC: Int;
}
