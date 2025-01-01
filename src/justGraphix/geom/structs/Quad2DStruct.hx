package justGraphix.geom.structs;

import justGraphix.geom.structs.Mat1x2.XY;
@:structInit
class Quad2DStruct {
    public var a: XY;
    public var b: XY;
    public var c: XY;
    public var d: XY;
    public
    function new( a: XY, b: XY, c: XY, d: XY ){
        this.a = a;
        this.b = b;
        this.c = c;
        this.d = d;
    }
    public function clone(): Quad2DStruct {
        return { a: a, b: b, c: c, d: d };
    }
}