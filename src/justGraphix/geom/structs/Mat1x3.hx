package justGraphix.geom.structs;
import justGraphix.geom.structs.Mat1x2;
import justGraphix.geom.structs.Mat1x3;
/** 
   { x, y, z }
**/
@:structInit
class Mat1x3 {
    public var x = 0.; 
    public var y = 0.;
    public var z = 0.; 
    public
    function new( x: Float, y: Float, z: Float ){
        this.x = x; 
        this.y = y;
        this.z = z;
    }
    // for rough debug, perhaps remove later.
    public function values(){
        return x + ' ' + y + ' ' + z;
    }
    public function clone(): Mat1x3 {
        return { x: this.x, y: this.y, z: this.z };
    }
}
@:access( justGraphix.geom.structs.Mat1x3 )
class ConvertMat1x3 {
    public static inline
    function toTypedef( m: Mat1x3 ): Tmatrix1x3 {
        var t: Tmatrix1x3 = { x: m.x, y: m.y, z: m.z };
        return t;
    }
    public static inline
    function fromTypedef( t: Tmatrix1x3 ): Mat1x3 {
        return new Mat1x3( t.x, t.y, t.z );
    }
}
/** 
   { x, y, z }
**/
typedef Tmatrix1x3 = {
    > Tpoint,
    public var z: Float;
}