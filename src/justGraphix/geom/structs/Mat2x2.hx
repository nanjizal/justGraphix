package justGraphix.geom.structs;
import justGraphix.geom.structs.Mat2x2;
/** 
   ![2x2](../../bootstrap/img/matrix2x2.png)
**/
@:structInit
class Mat2x2 {
    public var a = 0.; public var b = 0.;
    public var c = 0.; public var d = 0.;
    public
    function new( a: Float, b: Float
                , c: Float, d: Float ){
        this.a = a; this.b = b;
        this.c = c; this.d = d;
    }
}
class ConvertMat2x2 {
    public static inline
    function toTypedef( m: Mat2x2 ): Tmatrix2x2 {
        var t: Tmatrix2x2 = { a: m.a, b: m.b
                            , c: m.c, d: m.d };
        return t;
    }
    public static inline
    function fromTypedef( t:Tmatrix2x2 ): Mat2x2 {
        return new Mat2x2( t.a, t.b
                         , t.c, t.d );
    }
    public static inline
    function toNumdef( m: Mat2x2 ): Alternate2x2numbered {
        var n: Alternate2x2numbered = { _00: m.a, _10: m.b
                                      , _01: m.c, _11: m.d };
        return n;
    }
    public static inline
    function fromNumdef( n:Alternate2x2numbered ): Mat2x2 {
        return new Mat2x2( n._00, n._10
                         , n._01, n._11 );
    }
    public static inline
    function toAltNumdef( m: Mat2x2 ): Alternate2x2numbered {
        var n: Alternate2x2numbered = { _00: m.a, _01: m.b
                                      , _10: m.c, _11: m.d };
        return n;
    }
    public static inline
    function fromAltNumdef( n:Alternate2x2numbered ): Mat2x2 {
        return new Mat2x2( n._00, n._01
                         , n._10, n._11 );
    }
}
typedef Tmatrix2x2 = {
    a: Float, b: Float,
    c: Float, d: Float
}
typedef Tmatrix2x2numbered = {
    _00: Float, _10: Float,
    _01: Float, _11: Float
}
typedef Alternate2x2numbered = {
    _00: Float, _01: Float,
    _10: Float, _11: Float
}