package justGraphix.geom.structs;
import justGraphix.geom.structs.*;
import justGraphix.geom.structs.Mat1x2;
/** 
   { x, y }
**/
typedef Tpoint = {
    public var x: Float;
    public var y: Float;
}

/** 
   { x, y }
**/
@:structInit
class Mat1x2 {
    public var x = 0.; 
    public var y = 0.;
    public
    function new( x: Float, y: Float ){
        this.x = x; 
        this.y = y;
    }
    // for rough debug, perhaps remove later.
    public function values(){
        return x + ' ' + y;
    }
    public function clone(): Mat1x2 {
        return { x: this.x, y: this.y };
    }
}
@:access( justGraphix.geom.structs.Mat1x2 )
class ConvertMat1x2 {
    public static inline
    function tpoint( m: Mat1x2 ): Tpoint {
        var tPoint: Tpoint = { x: m.x, y: m.y };
        return tPoint;
    }
    public static inline
    function fromTpoint( tPoint: Tpoint ): Mat1x2 {
        return new Mat1x2( tPoint.x, tPoint.y );
    }
}