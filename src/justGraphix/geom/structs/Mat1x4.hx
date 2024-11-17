package justGraphix.geom.structs;
import justGraphix.geom.structs.Mat1x4;
import justGraphix.geom.structs.Mat1x3;
/** 
   { x, y, z, w }
**/
@:structInit
class Mat1x4 {
    public var x = 0.; 
    public var y = 0.;
    public var z = 0.; 
    @:optional public var w = 1.;
    public
    function new( x: Float, y: Float, z: Float, w: Float = 1. ){
        this.x = x; 
        this.y = y;
        this.z = z;
        this.w = w;
    }
    // for rough debug, perhaps remove later.
    public function values(){
        return x + ' ' + y + ' ' + z + ' ' + w;
    }
    public function clone(): Mat1x4 {
        return { x: this.x, y: this.y, z: this.z, w: this.w };
    }
}
@:access( justGraphix.geom.structs.Mat1x4 )
class ConvertMat1x4 {
    public static inline
    function toTypedef( m: Mat1x4 ): Tmatrix1x4 {
        var t: Tmatrix1x4 = { x: m.x, y: m.y, z: m.z, w: m.w };
        return t;
    }
    public static inline
    function fromTypedef( t:Tmatrix1x4 ): Mat1x4 {
        return new Mat1x4( t.x, t.y, t.z, t.w );
    }
}

/** 
   { x, y, z }
**/
typedef Tmatrix1x4 = {
    > Tmatrix1x3,
    public var w: Float;
}