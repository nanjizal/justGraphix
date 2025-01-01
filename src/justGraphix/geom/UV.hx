package justGraphix.geom;
import justGraphix.geom.structs.Mat1x2;
/** 
   { u, v }
**/
import justGraphix.geom.structs.Mat1x2;
@:forward
@:transitive
abstract UV( justGraphix.geom.structs.Mat1x2 ) from justGraphix.geom.structs.Mat1x2 to justGraphix.geom.structs.Mat1x2 {
    public inline
    function new( u_: Float, v_: Float ){
        this = { x: u_, y: v_ };
    }
    @:from
    static public function fromUV( uv:{ u: Float, v: Float } ): UV {
        return new UV( uv.u, uv.v );
    }
    public var u( get, set ): Float;
    inline
    function get_u(): Float {
        return this.x;
    }
    inline
    function set_u( x: Float ): Float {
        this.x = x;
        return x;
    }
    public var v( get, set ): Float;
    inline
    function get_v(): Float {
        return this.y;
    }
    inline
    function set_v( y: Float ): Float {
        this.y = y;
        return y;
    }
    inline
    public function values(){
        return this.x + ' ' + this.y;
    }
}

