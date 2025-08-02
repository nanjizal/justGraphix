package justGraphix.geom.structs;
import justGraphix.geom.structs.Mat4x4;
/**
   ![4x4](../../bootstrap/img/matrix4x4.png)
**/
@:structInit
class Mat4x4 {
    public var a = 0.; public var b = 0.; public var c = 0.; public var d = 0.;
    public var e = 0.; public var f = 0.; public var g = 0.; public var h = 0.;
    public var i = 0.; public var j = 0.; public var k = 0.; public var l = 0.;
    public var m = 0.; public var n = 0.; public var o = 0.; public var p = 0.;
    public
    function new( a: Float, b: Float, c: Float, d: Float
                , e: Float, f: Float, g: Float, h: Float
                , i: Float, j: Float, k: Float, l: Float
                , m: Float, n: Float, o: Float, p: Float ){
        this.a = a; this.b = b; this.c = c; this.d = d;
        this.e = e; this.f = f; this.g = g; this.h = h;
        this.i = i; this.j = j; this.k = k; this.l = l;
        this.m = m; this.n = n; this.o = o; this.p = p;
    }
    public inline
    function toTypedef(): Tmatrix4x4 {
        var t: Tmatrix4x4 = { a: this.a, b: this.b, c: this.c, d: this.d
                            , e: this.e, f: this.f, g: this.g, h: this.h
                            , i: this.i, j: this.j, k: this.k, l: this.l
                            , m: this.m, n: this.n, o: this.o, p: this.p };
        return t;
    }
    public static inline
    function fromTypedef( t:Tmatrix4x4 ): Mat4x4 {
        return new Mat4x4( t.a, t.b, t.c, t.d
                         , t.e, t.f, t.g, t.h
                         , t.i, t.j, t.k, t.l
                         , t.m, t.n, t.o, t.p );
    }
}
class ConvertMat4x4 {
    public inline
    function toTypedef( m: Matrix4x4 ): Tmatrix4x4 {
        var t: Tmatrix4x4 = { a: m.a, b: m.b, c: m.c, d: m.d
                            , e: m.e, f: m.f, g: m.g, h: m.h
                            , i: m.i, j: m.j, k: m.k, l: m.l
                            , m: m.m, n: m.n, o: m.o, p: m.p };
        return t;
    }
    public static inline
    function fromTypedef( t: Tmatrix4x4 ): Mat4x4 {
        return new Mat4x4( t.a, t.b, t.c, t.d
                         , t.e, t.f, t.g, t.h
                         , t.i, t.j, t.k, t.l
                         , t.m, t.n, t.o, t.p );
    }
    public static inline
    function toNumdef( m: Mat4x4 ): Tmatrix4x4numbered {
        var n: Tmatrix4x4numbered = { _00: m.a, _10: m.b, _20: m.c, _30: m.d
                                    , _01: m.e, _11: m.f, _21: m.g, _31: m.h
                                    , _02: m.i, _12: m.j, _22: m.k, _32: m.l
                                    , _03: m.m, _13: m.n, _23: m.o, _33: m.p };
        return n;
    }
    public static inline
    function fromNumdef( n:Tmatrix4x4numbered ): Mat4x4 {
        return new Mat4x4( n._00, n._10, n._20, n._30
                         , n._01, n._11, n._21, n._31
                         , n._02, n._12, n._22, n._32
                         , n._03, n._13, n._23, n._33 );
    }
    public static inline
    function toAltNumdef( m: Mat4x4 ): Alternate4x4numbered {
        var n: Alternate4x4numbered = { _00: m.a, _01: m.b, _02: m.c, _03: m.d
                                      , _10: m.e, _11: m.f, _12: m.g, _13: m.h
                                      , _20: m.i, _21: m.j, _22: m.k, _23: m.l
                                      , _30: m.l, _31: m.m, _32: m.n, _33: m.o };
        return n;
    }
    public static inline
    function fromAltNumdef( n:Alternate4x4numbered ): Mat4x4 {
        return new Mat4x4( n._00, n._01, n._02, n._03
                         , n._10, n._11, n._12, n._13
                         , n._20, n._21, n._22, n._23
                         , n._30, n._31, n._32, n._33 );
    }
}
typedef Tmatrix4x4 = {
    a: Float, b: Float, c: Float, d: Float,
    e: Float, f: Float, g: Float, h: Float,
    i: Float, j: Float, k: Float, l: Float,
    m: Float, n: Float, o: Float, p: Float
}
typedef Tmatrix4x4numbered = {
    _00: Float, _10: Float, _20: Float, _30: Float,
    _01: Float, _11: Float, _21: Float, _31: Float,
    _02: Float, _12: Float, _22: Float, _32: Float,
    _03: Float, _13: Float, _23: Float, _33: Float
}
typedef Alternate4x4numbered = {
    _00: Float, _01: Float, _02: Float, _03: Float,
    _10: Float, _11: Float, _12: Float, _13: Float,
    _20: Float, _21: Float, _22: Float, _23: Float,
    _30: Float, _31: Float, _32: Float, _33: Float
}