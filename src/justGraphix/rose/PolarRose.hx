package justGraphix.rose;
import justGraphix.rose.Pi2pi;
import justGraphix.rose.TauRadian;
import justGraphix.rose.ComplexNum;

@:initStuct
class PolarRoseStruct {
    public var radius: Float;
    public var theta:  Pi2pi;
    public inline
    function new( radius: Float, theta: Pi2pi ){
        this.radius = radius;
        this.theta = theta;
    }
    public inline 
    function clone(){
        var cloned = this.clone();
        return new PolarRose( cloned.radius, cloned.theta );
    }
}

@:forward
@:transitive
@:access( justGraphix.rose.PolarRoseStruct )
abstract PolarRose( PolarRoseStruct ) from PolarRoseStruct to PolarRoseStruct {
    public inline
    function new( r: Float, t: Float ){
        if( r < 0. ){
            t = t-Math.PI;
            r = -r;
        }
        this = new PolarRoseStruct( r, tauLimit( t, false ) );
    }
    public var phase( get, set ): Float;
    inline function get_phase(): Float {
        var f: Float = this.theta;
        return f;
    }
    inline function set_phase( phi: Float ): Float {
        this.theta = tauLimit( phi, false );
        var f: Float = this.theta;
        return f;
    }
    public var magnitude( get, set ): Float;
    inline function get_magnitude(): Float {
        return this.radius;
    }
    inline function set_magnitude( mag: Float ): Float {
        if( mag < 0 ){
            phase = this.theta-Math.PI;
            mag = -mag;
        }
        this.radius = mag;
        return mag;
    }
    public var cartX( get, never ): Float;
    inline function get_cartX(): Float {
        return this.radius*Math.cos( this.theta );
    }
    public var cartY( get, never ): Float;
    inline function get_cartY(): Float {
        return this.radius*Math.sin( this.theta );
    }
    public static inline
    function fromCartesian( x: Float, y: Float ): PolarRose {
        return new PolarRose( distFromXY( x, y ), angleFromXY( x , y) );
    }
    private static inline
    function distFromXY( x: Float, y: Float ): Float {
        return Math.sqrt( (x * x) + (y * y) );
    }
    private static inline
    function angleFromXY( x: Float, y: Float ): Float {
        return if( x < 0 ){ 
            ( Math.atan2( y, x) - Math.PI  );
        } else {
            Math.atan2( y, x );
        }
    }
    @:to
	public inline
    function toComplexNum(): ComplexNum {
        //var no: ComplexNo = this.abstract;
        //return no;
        return ComplexNum.fromPolar( abstract );
    }
    @:from
    public static inline
    function fromComplex( no: ComplexNum ): PolarRose {
        return no.toPolar();
    }
    @:keep
    public inline
    function toString(): String {
		return "cartX:" + cartX + " cartY:" + cartY + " magnitude:" + this.radius + " phase:" + this.theta;
	}
}
