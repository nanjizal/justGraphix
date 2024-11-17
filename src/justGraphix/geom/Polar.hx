package justGraphix.geom;
import justGraphix.geom.structs.PolarStruct;
/** 
   { phase, magnitude }
**/
@:forward
@:transitive
@:access( justGraphix.geom.structs.PolarStruct )
abstract Polar( PolarStruct ) to PolarStruct from PolarStruct {
    public inline function new( polar: PolarStruct ){
        this = polar;
    }
    /*public inline 
    function clone(): Polar {
        var cloned = this.clone();
        return new Polar( cloned.phase, cloned.magnitude );
    }*/
}