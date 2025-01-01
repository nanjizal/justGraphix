package justGraphix.geom.structs;
import justGraphix.geom.UV;
@:structInit
class TriangleUV {
    public var a: UV;
    public var b: UV;
    public var c: UV;
    function new( a: UV, b: UV, c: UV ){
        this.a = a;
        this.b = b;
        this.c = c;
    }
}