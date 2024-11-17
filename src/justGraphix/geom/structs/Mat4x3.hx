package justGraphix.geom.structs;
/**
   ![4x3](../../bootstrap/img/matrix4x3.png)
**/
@:structInit
class Mat4x3 {
    public var a = 0.; public var b = 0.; public var c = 0.; public var d = 0.;
    public var e = 0.; public var f = 0.; public var g = 0.; public var h = 0.;
    public var i = 0.; public var j = 0.; public var k = 0.; public var l = 0.;
    public
    function new( a: Float, b: Float, c: Float, d: Float
                , e: Float, f: Float, g: Float, h: Float
                , i: Float, j: Float, k: Float, l: Float ){
        this.a = a; this.b = b; this.c = c; this.d = d;
        this.e = e; this.f = f; this.g = g; this.h = h;
        this.i = i; this.j = j; this.k = k; this.l = l;
    }
    public inline
    function toTypedef(): Tmatrix4x3 {
        var t: Tmatrix4x3 = { a: this.a, b: this.b, c: this.c, d: this.d
                            , e: this.e, f: this.f, g: this.g, h: this.h
                            , i: this.i, j: this.j, k: this.k, l: this.l };
        return t;
    }
    public static inline
    function fromTypedef( t:Tmatrix4x3 ): Mat4x3 {
        return new Mat4x3( t.a, t.b, t.c, t.d
                         , t.e, t.f, t.g, t.h
                         , t.i, t.j, t.k, t.l );
    }
}
typedef Tmatrix4x3 = {
    a: Float, b: Float, c: Float, d: Float,
    e: Float, f: Float, g: Float, h: Float,
    i: Float, j: Float, k: Float, l: Float
}
typedef TAffineMatrix = {
    e0: Float, e4: Float, e8:  Float, e12: Float,
    e1: Float, e5: Float, e9:  Float, e13: Float,
    e2: Float, e6: Float, e10: Float, e14: Float
}