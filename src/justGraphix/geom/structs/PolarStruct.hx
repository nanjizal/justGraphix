package justGraphix.geom.structs;
/** 
   { phase, magnitude }
**/
@:structInit
class PolarStruct {
    public var phase = 0.; 
    public var magnitude = 0.;
    public
    function new( phase: Float, magnitude: Float ){
        this.phase = phase; 
        this.magnitude = magnitude;
    }
    // for rough debug, perhaps remove later.
    public function values(){
        return phase + ' ' + magnitude;
    }
    public function clone(): PolarStruct {
        return { phase: this.phase, magnitude: this.magnitude };
    }
}
