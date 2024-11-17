package justGraphix.geom.structs;
import justGraphix.geom.Quaternion;

@:structInit
class DualQ {
    public var real: Quaternion; 
    public var dual: Quaternion;
    function new( real: Quaternion, dual: Quaternion ){
        this.real = real; 
        this.dual = dual;
    }
}
