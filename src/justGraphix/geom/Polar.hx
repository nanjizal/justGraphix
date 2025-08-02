package justGraphix.geom;
import justGraphix.geom.structs.PolarStruct;
/** 
   { phase, magnitude }
**/
@:forward
@:transitive
@:access( cornerContour.shape.structs.PolarStruct )
abstract Polar( PolarStruct ) to PolarStruct from PolarStruct {
    public inline function new( polar: PolarStruct ){
        this = polar;
    }
    public inline 
    function clone(){
        var cloned = this.clone();
        return new Polar( new PolarStruct( cloned.phase, cloned.magnitude ) );
    }
}