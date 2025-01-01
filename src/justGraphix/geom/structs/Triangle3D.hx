package justGraphix.geom.structs;
import justGraphix.geom.Matrix1x4; 
@:structInit
class Triangle3D {
    public var a: Matrix1x4;
    public var b: Matrix1x4;
    public var c: Matrix1x4;
    function new( a: Matrix1x4, b: Matrix1x4, c: Matrix1x4 ){
        this.a = a;
        this.b = b;
        this.c = c;
    }
    public function clone(): Triangle3D {
        return { a: this.a.clone(), b: this.b.clone(), c: this.c.clone() };
    }
}