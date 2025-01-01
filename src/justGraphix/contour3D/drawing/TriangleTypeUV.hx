package justGraphix.contour3D.drawing; 
import justGraphix.geom.Matrix4x3;
import justGraphix.geom.structs.TriangleUV;
typedef TriangleTypeUV = {
    var moveDelta: ( dx: Float, dy: Float ) -> Void;
    public function get_u(): Float;
    public function set_u( u_: Float ): Float;
    public function get_v(): Float;
    public function set_v( v_: Float ): Float;
    public function get_bottomV(): Float;
    public function get_rightU():  Float;
    var getTriangleUV:()->TriangleUV;
    var triangleUV: ( au_: Float, av_: Float
                    , bu_: Float, bv_: Float
                    , cu_: Float, cv_: Float
                    , ?windAdjust_: Null<Bool> ) -> Bool;
}
