package justGraphix.contour3D.drawing;

import justGraphix.geom.structs.TriInt;
import justGraphix.geom.structs.TriangleUV;
import justGraphix.geom.structs.Triangle3D;
import justGraphix.geom.Matrix4x3;
import justGraphix.iterMagix.IteratorRange;

typedef PaintType = {
    var triangle: ( ax_: Float, ay_: Float, az_: Float
                  , bx_: Float, by_: Float, bz_: Float
                  , cx_: Float, cy_: Float, cz_: Float ) -> Bool;
    var ?triangleUV: ( uA_: Float, vA_: Float
                     , uB_: Float, vB_: Float
                     , uC_: Float, vC_: Float
                     , ?windAdjust_: Null<Bool> ) -> Bool;
    var cornerColors: ( colorA: Int, colorB: Int, colorC: Int ) -> Void;
    var colorTriangles: ( color: Int, times: Int ) -> Void;
    var getTriInt:()->TriInt;
    var getTriangle3D:()->Triangle3D;
    var ?getTriangleUV:()->TriangleUV;
    var transform: ( Matrix4x3 ) -> Void;
    var transformRange: ( m: Matrix4x3, startEnd: IteratorRange ) -> Void;
    var next: ()->Float;
    var hasNext: ()->Bool;
    var ?triangleCurrent:   TriangleAbstract;
    var ?triangleCurrentUV: TriangleAbstractUV;
    public function get_pos(): Float;
    public function set_pos( v: Float ): Float;
    public function get_size(): Int;
    public function set_size( v: Int ): Int;
    public function toStart( v: Int, len: Int ): Bool;
    public function toEnd( v: Int, len: Int ): Bool;
    public function swap( v0: Int, v1: Int, len: Int ): Bool;
    // Only relevant when using interleave array structures
    var ?color3current: Color3Abstract;
}