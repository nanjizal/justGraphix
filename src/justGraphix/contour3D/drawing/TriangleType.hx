package justGraphix.contour3D.drawing;
import justGraphix.geom.structs.Triangle3D;
import justGraphix.geom.Matrix4x3;
typedef TriangleType = {
    var rotate: ( x: Float, y: Float, theta: Float ) -> Void;
    var moveDelta: ( dx: Float, dy: Float ) -> Void;
    var rotateTrig: ( x: Float, y: Float, cos: Float, sin: Float ) -> Void;
    #if trilateral_hitDebug var distHit: ( px: Float, py: Float ) -> Float; #end
    var fullHit: ( px: Float, py: Float ) -> Bool;
    var liteHit: ( px: Float, py: Float ) -> Bool;
    public function get_bottom(): Float;
    public function get_back():   Float;
    public function get_right():  Float;
    public function get_x(): Float;
    public function set_x( x: Float ): Float;
    public function get_y(): Float;
    public function set_y( y: Float ): Float;
    public function get_z(): Float;
    public function set_z( z: Float ): Float;
    var getTriangle3D:()->Triangle3D;
    var triangle: ( ax_: Float, ay_: Float, az_: Float
                  , bx_: Float, by_: Float, bz_: Float
                  , cx_: Float, cy_: Float, cz_: Float ) -> Bool;
    var transform: ( Matrix4x3 ) -> Void;
}