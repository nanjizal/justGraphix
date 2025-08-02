package justGraphix.geom.structs;

/** 
   ![3x3](../../bootstrap/img/matrix3x3.png)
**/
@:structInit
class Mat3x3 {
    public var a = 0.; public var b = 0.; public var c = 0.;
    public var d = 0.; public var e = 0.; public var f = 0.;
    public var g = 0.; public var h = 0.; public var i = 0.;
    public 
    function new( a: Float, b: Float, c: Float
                , d: Float, e: Float, f: Float
                , g: Float, h: Float, i: Float ){
        this.a = a; this.b = b; this.c = c;
        this.d = d; this.e = e; this.f = f; 
        this.g = g; this.h = h; this.i = i;
    }
}
@:access( justGraphix.geom.stucts.Mat3x3 )
class ConvertM3x3 {
    public static inline
    function toTypedef( m: Mat3x3 ): Tmatrix3x3 {
        var t: Tmatrix3x3 = { a: m.a, b: m.b, c: m.c
                            , d: m.d, e: m.e, f: m.f
                            , g: m.g, h: m.h, i: m.i };
        return t;
    }
    public static inline
    function fromTypedef( t: Tmatrix3x3 ): Mat3x3 {
        return new Mat3x3( t.a, t.b, t.c
                         , t.d, t.e, t.f
                         , t.g, t.h, t.i );
    }
    public static inline
    function toNumdef( m: Mat3x3 ): Tmatrix3x3numbered {
        var n: Tmatrix3x3numbered = { _00: m.a, _10: m.b, _20: m.c
                                    , _01: m.d, _11: m.e, _21: m.f
                                    , _02: m.g, _12: m.h, _22: m.i };
        return n;
    }
    public static inline
    function fromNumdef( n:Tmatrix3x3numbered ): Mat3x3 {
        return new Mat3x3( n._00, n._10, n._20
                         , n._01, n._11, n._21
                         , n._02, n._12, n._22 );
    }
    public static inline
    function toAltNumdef( m: Mat3x3 ): Alternate3x3numbered {
        var n: Alternate3x3numbered = { _00: m.a, _01: m.b, _02: m.c
                                      , _10: m.d, _11: m.e, _12: m.f
                                      , _20: m.g, _21: m.h, _22: m.i };
        return n;
    }
    public static inline
    function fromAltNumdef( n:Alternate3x3numbered ): Mat3x3 {
        return new Mat3x3( n._00, n._01, n._02
                         , n._10, n._11, n._12
                         , n._20, n._21, n._22 );
    }
}
typedef Tmatrix3x3 = {
    a: Float, b: Float, c: Float,
    d: Float, e: Float, f: Float,
    g: Float, h: Float, i: Float
}
typedef Tmatrix3x3numbered = {
    _00: Float, _10: Float, _20: Float,
    _01: Float, _11: Float, _21: Float,
    _02: Float, _12: Float, _22: Float
}
typedef Alternate3x3numbered = {
    _00: Float, _01: Float, _02: Float,
    _10: Float, _11: Float, _12: Float,
    _20: Float, _21: Float, _22: Float
}