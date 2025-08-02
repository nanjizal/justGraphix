package justGraphix.rose;
import justGraphix.rose.PolarRose;
import justGraphix.rose.ComplexNum;
/** 
   { r, i }
**/
@:structInit
class ComplexNum_ {
    public var r = 0.; 
    public var i = 0.;
    function new( r: Float, i: Float ){
        this.r = r; 
        this.i = i;
    }
    @:keep
    @:to
    public inline
    function toString(){
        return r + ' ' + i;
    }
    public function clone(): ComplexNum_ {
        return { r: this.r, i: this.i };
    }
}
/**
   ComplexNum - A Complex Float Type.  
   { r, i }
   
   For Convinence you can declare in several ways eg:  
   var c0: ComplexNum = '1 + 2i';  
   var c1: ComplexNum = { real: 1., imaginary: 2. };  
   var c2: ComplexNum = { r: 1., i: 2. };  
   var c3: ComplexNum = new ComplexNum({ r: 1., i: 2. });  
   
   You can use normal operations  
   var c4 = c0 * c1;  
   var c5 = c0 + c1;  
   
   You can extract either part  
   var real = c0.real;  
   var imaginary = c0.i;  
   
   You can trace it.
   trace( ComplexNum.fromString( c0 ) ); // '1. + 2. i' 
  
**/
@:transient
@:forward
abstract ComplexNum( ComplexNum_ ) from ComplexNum_ to ComplexNum_ {
    /**
     * <pre><code>
     * >>> ({ 
     * ... var c0: ComplexNum = '1 + 2i';
     * ... var c1 = new ComplexNum({ r: 1., i: 2. });
     * ... c1 == c0; }) == true
     * </code></pre>
     */
    @:from
    static public inline
    function fromString( s: String ): ComplexNum {
        var removeI = s.substr(0,s.length-1);
        var split = removeI.split('+');
        var c = ComplexNum.zero;
        c.real = Std.parseFloat( split[0] );
        c.i = Std.parseFloat( split[1] );
        return c;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var c0: ComplexNum = { real: 1., imaginary: 2. };
     * ... var c1 = new ComplexNum({ x: 1., y: 2. });
     * ... c1 == c0; }) == true
     * </code></pre>
     */
    @:from
    static public inline
    function fromRealImaginary( c:{ real: Float, imaginary: Float } ): ComplexNum {
        return new ComplexNum({ r: c.real, i: c.imaginary });
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var c0: ComplexNum = { r: 1., i: 2. };
     * ... var c1 = new ComplexNum({ r: 1., i: 2. });
     * ... c1 == c0; }) == true
     * </code></pre>
     */
    @:from
    static public inline
    function fromRi( c:{ r: Float, i: Float } ): ComplexNum {
        return new ComplexNum({ r: c.r, i: c.i });
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var c0: ComplexNum = { real: 1., i: 2. };
     * ... var c1 = new ComplexNum({ r: 1., i: 2. });
     * ... c1 == c0; }) == true
     * </code></pre>
     */
    @:from
    static public inline
    function fromRealI( c:{ real: Float, i: Float } ): ComplexNum {
        return new ComplexNum({ r: c.real, i: c.i });
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var c: ComplexNum = { r: 1., i: 2. };
     * ... var s: String = c;
     * ... // js seems to remove the .'s from the numbers not sure on other targets
     * ... s == '1. + 2. i' || s == '1 + 2 i'; }) == true
     * </code></pre>
     */
    @:to
    public inline
    function toString(): String{
        var r: Float = real;
        var i: Float = i;
        return '$r + $i i'; 
    }
    public inline
    function new( m: ComplexNum_ ){ this = m; }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.zero == new ComplexNum({r:0.
     * ...                            , i:0.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var zero( get, null ): ComplexNum;
    static inline
    function get_zero(): ComplexNum {
        return new ComplexNum( { r: 0., i: 0. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.one == new ComplexNum({x:1.
     * ...                           , y:0.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var one( get, null ): ComplexNum;
    static inline
    function get_one(): ComplexNum {
        return new ComplexNum( { r: 1., i: 0. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.minus1 == new ComplexNum({r: -1.
     * ...                              , i: 0.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var minus1( get, null ): ComplexNum;
    static inline
    function get_minus1(): ComplexNum {
        return new ComplexNum( { r: -1., i: 0. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.unit == new ComplexNum({x: 1.
     * ...                            , y: 1.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var unit( get, null ): ComplexNum;
    static inline
    function get_unit(): ComplexNum {
        return new ComplexNum( { r: 1., i: 1. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.i1 == new ComplexNum({r: 0.
     * ...                          , i: 1.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var i1( get, null ): ComplexNum;
    static inline
    function get_i1(): ComplexNum {
        return new ComplexNum( { r: 0., i: 1. } );
    }    
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.iMinus1 == new ComplexNum({r: 0.
     * ...                               , i: -1.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var iMinus1( get, null ): ComplexNum;
    static inline
    function get_iMinus1(): ComplexNum {
        return new ComplexNum( { r: 0., i: -1. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.minusUnit == new ComplexNum({r: -1.
     * ...                                 , i: -1.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var minusUnit( get, null ): ComplexNum;
    static inline
    function get_minusUnit(): ComplexNum {
        return new ComplexNum( { r: -1., i: -1. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.unitInfinity == new ComplexNum({r:Math.POSITIVE_INFINITY
     * ...                                    , i:Math.POSITIVE_INFINITY}); 
     * ... }) == true
     * </code></pre>
     */
    public static var unitInfinity( get, null ): ComplexNum;
    static inline
    function get_unitInfinity(): ComplexNum {
        return new ComplexNum( { r: Math.POSITIVE_INFINITY, i: Math.POSITIVE_INFINITY } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.unitMinusInfinity == new ComplexNum({x:Math.NEGATIVE_INFINITY
     * ...                                         , y:Math.NEGATIVE_INFINITY}); 
     * ... }) == true
     */
    public static var unitMinusInfinity( get, null ): ComplexNum;
    static inline
    function get_unitMinusInfinity(): ComplexNum {
        return new ComplexNum( { r: Math.NEGATIVE_INFINITY, i: Math.NEGATIVE_INFINITY} );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.realInfinity == new Complex({r:Math.POSITIVE_INFINITY
     * ...                                    , i:0.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var realInfinity( get, null ): ComplexNum;
    static inline
    function get_realInfinity(): ComplexNum {
        return new ComplexNum( { r: Math.POSITIVE_INFINITY, i:  0. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.minusInfinity == new Complex({x:Math.NEGATIVE_INFINITY
     * ...                                         , y:0.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var minusInfinity( get, null ): ComplexNum;
    static inline
    function get_minusInfinity(): ComplexNum {
        return new ComplexNum( { r: Math.NEGATIVE_INFINITY, i:  0. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.iInfinity == new ComplexNum({r:0.
     * ...                                 , i:Math.POSITIVE_INFINITY}); 
     * ... }) == true
     * </code></pre>
     */
    public static var iInfinity( get, null ): ComplexNum;
    static inline
    function get_iInfinity(): ComplexNum {
        return new ComplexNum( { r: 0., i:  Math.POSITIVE_INFINITY } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.iMinusInfinity == new ComplexNum({r:0.
     * ...                                      , i:Math.NEGATIVE_INFINITY}); 
     * ... }) == true
     * </code></pre>
     */
    public static var iMinusInfinity( get, null ): ComplexNum;
    static inline
    function get_iMinusInfinity(): ComplexNum {
        return new ComplexNum( { r: 0., i:  Math.NEGATIVE_INFINITY } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.posNegInfinity == new ComplexNum({r:Math.POSITIVE_INFINITY
     * ...                                      , i:Math.NEGATIVE_INFINITY}); 
     * ... }) == true
     * </code></pre>
     */
    public static var posNegInfinity( get, null ): ComplexNum;
    static inline
    function get_posNegInfinity(): ComplexNum {
        return new ComplexNum( { r: Math.POSITIVE_INFINITY, i:  Math.NEGATIVE_INFINITY } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.negPosInfinity == new ComplexNum({r:Math.NEGATIVE_INFINITY
     * ...                                      , i:Math.POSITIVE_INFINITY}); 
     * ... }) == true
     * </code></pre>
     */
    public static var negPosInfinity( get, null ): ComplexNum;
    static inline
    function get_negPosInfinity(): ComplexNum {
        return new ComplexNum( { r: Math.NEGATIVE_INFINITY, i:  Math.POSITIVE_INFINITY } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.realPi == new ComplexNum({r:(Math.PI)
     * ...                               , i:0.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var realPi( get, null ): ComplexNum;
    static inline
    function get_realPi(): ComplexNum {
        return new ComplexNum( { r: (Math.PI), i: 0. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.iPi == new ComplexNum({r:0.
     * ...                            , i:(Math.PI)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var iPi( get, null ): ComplexNum;
    static inline
    function get_iPi(): ComplexNum {
        return new ComplexNum( { r: 0., i: (Math.PI) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.unitPi == new ComplexNum({r:(Math.PI)
     * ...                               , i:(Math.PI)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var unitPi( get, null ): ComplexNum;
    static inline
    function get_unitPi(): ComplexNum {
        return new ComplexNum( { r: (Math.PI), i: (Math.PI) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.unitMinusPi == new ComplexNum({r:(-Math.PI)
     * ...                                    , i:(-Math.PI)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var unitMinusPi( get, null ): ComplexNum;
    static inline
    function get_unitMinusPi(): ComplexNum {
        return new ComplexNum( { r: (-Math.PI), i: (-Math.PI) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.iMinusPi == new ComplexNum({r:0.
     * ...                                 , i:(-Math.PI)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var iMinusPi( get, null ): ComplexNum;
    static inline
    function get_iMinusPi(): ComplexNum {
        return new ComplexNum( { r: 0., i: (-Math.PI) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.minusPi == new ComplexNum({r:(-Math.PI)
     * ...                                , i:0.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var minusPi( get, null ): ComplexNum;
    static inline
    function get_minusPi(): ComplexNum {
        return new ComplexNum( { r: (-Math.PI), i: 0. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.posNegPi == new ComplexNum({x:(Math.PI)
     * ...                                , y:(-Math.PI)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var posNegPi( get, null ): ComplexNum;
    static inline
    function get_posNegPi(): ComplexNum {
        return new ComplexNum( { r: (Math.PI), i: (-Math.PI) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.negPosPi == new ComplexNum({r:(-Math.PI)
     * ...                                 , i:(Math.PI)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var negPosPi( get, null ): ComplexNum;
    static inline
    function get_negPosPi(): ComplexNum {
        return new ComplexNum( { r: (-Math.PI), i: (Math.PI) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.realTau == new ComplexNum({r:(Math.PI*2)
     * ...                               , i:0.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var realTau( get, null ): ComplexNum;
    static inline
    function get_realTau(): ComplexNum {
        return new ComplexNum( { r: (Math.PI*2), i: 0. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.iTau == new Complex({r:0.
     * ...                            , i:(Math.PI*2)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var iTau( get, null ): ComplexNum;
    static inline
    function get_iTau(): ComplexNum {
        return new ComplexNum( { r: 0., i: (Math.PI*2) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.unitTau == new ComplexNum({r:(Math.PI*2)
     * ...                               , i:(Math.PI*2)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var unitTau( get, null ): ComplexNum;
    static inline
    function get_unitTau(): ComplexNum {
        return new ComplexNum( { r: (Math.PI*2), i: (Math.PI*2) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.unitMinusTau == new ComplexNum({r:(-Math.PI*2)
     * ...                                    , i:(-Math.PI*2)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var unitMinusTau( get, null ): ComplexNum;
    static inline
    function get_unitMinusTau(): ComplexNum {
        return new ComplexNum( { r: (-Math.PI*2), i: (-Math.PI*2) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.iMinusTau == new ComplexNum({r:0.
     * ...                                 , i:(-Math.PI*2)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var iMinusTau( get, null ): ComplexNum;
    static inline
    function get_iMinusTau(): ComplexNum {
        return new ComplexNum( { r: 0., i: (-Math.PI*2) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.minusTau == new ComplexNum{r:(-Math.PI*2)
     * ...                                , i:0.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var minusTau( get, null ): ComplexNum;
    static inline
    function get_minusTau(): ComplexNum {
        return new ComplexNum( { r: (-Math.PI*2), i: 0. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.posNegTau == new ComplexNum({r:(Math.PI*2)
     * ...                                 , i:(-Math.PI*2)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var posNegTau( get, null ): ComplexNum;
    static inline
    function get_posNegTau(): ComplexNum {
        return new ComplexNum( { r: (Math.PI*2), i: (-Math.PI*2) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... ComplexNum.negPosTau == new ComplexNum({x:(-Math.PI*2)
     * ...                                 , y:(Math.PI*2)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var negPosTau( get, null ): ComplexNum;
    static inline
    function get_negPosTau(): ComplexNum {
        return new ComplexNum( { r: (-Math.PI*2), i: (Math.PI*2) } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new ComplexNum({ r: 1., i: 2. });
     * ... a.i == 2.; }) == true
     * </code></pre>
     */
    public var i( get, set ): Float;
    inline
    function get_i(): Float {
       return this.i;
    }
    inline
    function set_i( v: Float ): Float {
        this.i = v;
        return v;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new ComplexNum({ r: 1., i: 2. });
     * ... a.real == 1.; }) == true
     * </code></pre>
     */
    public var real( get, set ): Float;
    inline function get_real(): Float {
        return this.r;
    }
    inline function set_real( v: Float ): Float {
        this.r = v;
        return v;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new ComplexNum({ r: 1., i: 2. });
     * ... a.clone() == a; }) == true
     * </code></pre>
     */
    public inline
    function clone():ComplexNum {
        return new ComplexNum( { r: this.r, i: this.i } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new ComplexNum({ r: 1., i: 2. });
     * ... var b = new ComplexNum({ r: 2., i: 1. });
     * ... a.swap() == b; }) == true
     * </code></pre>
     */
    public inline
    function swap():ComplexNum {
        return new ComplexNum( { r: this.i, i: this.r } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new ComplexNum({ r: 1., i: 2. });
     * ... var b = new ComplexNum({ r: 1., i: 2. });
     * ... a == b; }) == true
     * </code></pre>
     */
    @:op( A == B ) public static inline
    function equal( a: ComplexNum, b: ComplexNum ): Bool {
        var delta = 0.0000001;
        return !(
               Math.abs(a.r - b.r) >= delta
            || Math.abs(a.i - b.i) >= delta
        );
    }
     /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new ComplexNum({ x: 1., y: 2. });
     * ... var b = new ComplexNum({ x: 1., y: 1. });
     * ... a != b; }) == true
     * </code></pre>
     */
    @:op(A != B) public static inline
    function notEqual( a: ComplexNum, b:ComplexNum ): Bool {
        return !equal( a, b );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = ComplexNum.unit;
     * ... a + a == new ComplexNum({ r: 2., i: 2. }); 
     * ... }) == true
     * </code></pre>
     */
    @:op(A + B) public static inline
    function add( a: ComplexNum, b: ComplexNum ): ComplexNum {
      	return new ComplexNum({ r: a.r + b.r, i: a.i + b.i });
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = ComplexNum.unit;
     * ... a - a == ComplexNum.zero; 
     * ... }) == true
     * </code></pre>
     */
    @:op(A - B) public static inline
    function subtract( a: ComplexNum, b: ComplexNum ): ComplexNum {
        return new ComplexNum({ r: a.r - b.r, i: a.i - b.i });
    }
    /* <pre><code>
     * >>> ({ 
     * ... var a = 10.;
     * ... var b = new ComplexNum({ r: 1., i: 7. });
     * ... a * b == new ComplexNum({ r: 10, i: 70. });
     * ... }) == true
     * </code></pre>    
    */    
    @:op(A * B) public static inline
    function scale( a: Float, b: ComplexNum ):ComplexNum {
        return new ComplexNum({ r: a * b.r , i: a * b.i });    
    }     
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new ComplexNum({ r: 3., i: 2. });
     * ... var b = new ComplexNum({ r: 1., i: 7. });
     * ... a * b == new ComplexNum({ r: -11., i: 23. });
     * ... }) == true
     * </code></pre>
     */    
    @:op(A * B) public static inline
    function multiply( a: ComplexNum, b: ComplexNum ):ComplexNum {
        return new ComplexNum({ r: ( a.r * b.r ) - ( a.i * b.i ), i: (a.r * b.i) + (a.i * b.r) });    
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new ComplexNum({ r: 3., i: 2. });
     * ... a.addExponents() == 5;
     * ... }) == true
     * </code></pre>
     */   
    public inline
    function addExponents(){
        return real + i;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new ComplexNum({ r: 1., i: 2. });
     * ... var b = ~a;
     * ... b == new ComplexNum({ r: 1., i: -2. }); }) == true
     * </code></pre>
     */
    @:op(~A) public static inline
    function conjugate( a: ComplexNum ): ComplexNum {
        return new ComplexNum( { r: a.r, i: -a.i } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new ComplexNum({ r: 1., i: -3. });
     * ... var b = new ComplexNum({ r: 1., i: 2. });
     * ... a / b == new ComplexNum({ r:-1, i: -1 });
     * ... }) == true
     * </code></pre>
     */
     /* 
    Need to see which approach is fastest.
    @:op(A / B) public static inline
    function divide( c1: ComplexNum, c2: ComplexNum ): ComplexNum {
        // There maybe a more optimal approach using conjugate
        var a = c1.real;
        var b = c1.i;
        var c = c2.real;
        var d = c2.i;
        var real_numr = a*c + b*d;
        var i_numr = b*c - a*d;
        var denominator = c*c + d*d;
        return new Complex( { r: real_numr/denominator, i: i_numr/denominator } );
    }
    */
    @:op(A / B) public static inline
    function divide( c1: ComplexNum, c2: ComplexNum ): ComplexNum {
        var conj = ~c2; 
        var numr = c1 * conj;
        var demr = c2 * conj;    
        var dval = demr.real + demr.i; 
        return new ComplexNum({ r: numr.real/dval, i: numr.i/dval } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new ComplexNum({ r: 1., i: 2. });
     * ... var b = -a;
     * ... b == new ComplexNum({ r: -1., i: -2. }); }) == true
     * </code></pre>
     */
    @:op(-A) public static inline
    function negate( a: ComplexNum ):ComplexNum {
        return new ComplexNum( { r: -a.r, i: -a.i } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new ComplexNum({ r: 2., i: 4. });
     * ... a.magnitudeSquared() == 4. + 16.; }) == true
     * </code></pre>
     */
    public inline 
    function magnitudeSquared(): Float {
        return this.r * this.r + this.i * this.i;
    }
    // 3,4,5 basic pythag triple easy way to test
    /** 
     * <pre><code>
     * >>> ({ 
     * ... var a = new ComplexNum({ r: 3, i: 4});
     * ... a.magnitude == 5.; }) == true
     * </code></pre>
     */
    public var magnitude( get, set ): Float;
    private inline
    function get_magnitude(): Float {
        return Math.sqrt( magnitudeSquared() );
    }
    private inline
    function set_magnitude( length: Float ): Float {
        var currentLength = get_magnitude();
        return if( currentLength == 0. ){ 
            0.;
        } else {
            var mul = length / currentLength;
            this.r *= mul;
            this.i *= mul;
            magnitude;
        }
    }
    public inline
    function phase(): Float {
        return Math.atan2( i, real );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Complex.one;
     * ... a.isReal() == true; }) == true
     * </code></pre>
     */
    public inline
    function isReal(): Bool {
        return i == 0;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = ComplexNum.i1;
     * ... a.isImaginary() == true; }) == true
     * </code></pre>
     */
    public inline
    function isImaginary(): Bool {
        return real == 0;
    }
    /** 
     * <pre><code>
     * >>> ({ 
     * ... var r = 12;
     * ... var theta = Math.PI/4;
     * ... var cis = ComplexNum.cis;
     * ... var square = ComplexNum.square;
     * ... square(r*cis( theta )) == r*r*cis( 2*theta ); }) == true
     * </code></pre>
     */
    public static inline 
    function cis( angle: Float ): ComplexNum {
       return new ComplexNum({ r: Math.cos( angle ), i: Math.sin( angle ) });
    }
    // TODO: reconsider naming
    /** 
     * <pre><code>
     * >>> ({ 
     * ... var r = 12;
     * ... var theta = Math.PI/4;
     * ... var cis = ComplexNum.cis;
     * ... var square = ComplexNum.square;
     * ... var fromCircle = ComplexNum.fromCircle;
     * ... square(fromCircle(r,theta)) == fromCircle( r*r, 2*theta ); }) == true
     * </code></pre>
     */
    public static inline // ofPolar
    function fromCircle( r: Float , angle: Float ): ComplexNum {
        return r* cis( angle ); 
    }
    /** 
     * <pre><code>
     * >>> ({ 
     * ... var r = 12;
     * ... var theta = Math.PI/4;
     * ... var cis = ComplexNum.cis;
     * ... var square = ComplexNum.square;
     * ... var fromCircle = ComplexNum.fromCircle;
     * ... square(fromCircle(r,theta)) == fromCircle( r*r, 2*theta ); }) == true
     * </code></pre>
     */
    public static inline
    function square( c: ComplexNum ): ComplexNum {
       return if( c.isReal() == true ){
            new ComplexNum({ r: c.real*c.real, i: 0 });
       } else {
            //return magnitude * cis( theta );
            var here = new ComplexNum({ r: c.r, i: c.i });
            here*here;
       }
    }
    // Eulars Formula
    /** 
     * <pre><code>
     * >>> ({ 
     * ... var r = 12;
     * ... var theta = Math.PI/4;
     * ... var cis = ComplexNum.cis;
     * ... var fromCircle = ComplexNum.fromCircle;
     * ... var exp = ComplexNum.exp;
     * ... fromCircle(r,theta) == r*exp( new ComplexNum({ r: 0, i: theta }) ); }) == true
     * </code></pre>
     */
    public static inline
    function exp( c: ComplexNum ): ComplexNum {
       return if( c.isReal() == true ){
            new ComplexNum({ r: Math.exp( c.real ), i: 0 });
       } else {
            new ComplexNum({ r: Math.exp(c.real) * Math.cos(c.i), i:Math.exp(c.real) * Math.sin(c.i) });
       }
    }
    /** 
     * <pre><code>
     * >>> ({ 
     * ... var a = new ComplexNum({ r: 3, i: 4});
     * ... var b = new ComplexNum({ r: 6, i: 8});
     * ... var ln = ComplexNum.ln;
     * ... ln( a*b ) == ln( a ) + ln( b ); }) == true
     * </code></pre>
     */
    public static inline
    function ln( c: ComplexNum ): ComplexNum {
        return if( c.isReal() == true ){
            new ComplexNum({ r: Math.log( c.real ), i: 0 });
        } else {
            new ComplexNum({ r: 0.5*Math.log( c.magnitudeSquared() ), i: arg( c ) });
        }
    }
    // see phase?
    /** 
     * <pre><code>
     * >>> ({ 
     * ... var a = new ComplexNum({ r: 3, i: 4});
     * ... var b = new ComplexNum({ r: 6, i: 8});
     * ... var arg = ComplexNum.arg;
     * ... arg( a*b ) == arg( a ) + arg( b ); }) == true
     * </code></pre>
     */
    public static inline
    function arg( c: ComplexNum ): Float {
        return if( c.real > 0. ){
            Math.atan( c.i/c.real );
        } else if( c.real < 0. && c.i >= 0. ){
            Math.atan( c.i/c.real ) + Math.PI;
        } else if( c.real < 0. && c.i < 0. ){
            Math.atan( c.i/c.real ) - Math.PI;
        } else if( c.real == 0. && c.i > 0. ){
            Math.PI/2;
        } else if( c.real == 0. && c.i < 0. ){
            -Math.PI/2;
        } else {
            throw 'Complex.zero does not have arg?';
        }
    }
    
    public inline
    function reciprocal(): ComplexNum {
        var scale = real*real + i*i;
        return new ComplexNum({ r: real / scale, i: -i / scale });
    }
    // pow using DeMoivre's Theorem
    public static inline
    function pow( c: ComplexNum, n: Float ): ComplexNum {
        return if( c.isReal() == true ){
            new ComplexNum({r: Math.pow( c.real, n ), i: 0 });
        } else {
            Math.pow( c.magnitude , n )*cis( n*c.phase() );
        }
    }
    /**
     * squareRoot see pow
     */
    public static inline
    function squareRoot( c: ComplexNum ): ComplexNum {
        return pow( c, 0.5 );
    }
    /**
     * root2 see pow
     */
    public inline
    function root2(): ComplexNum {
        return squareRoot( this );
    }
    /**
     * to Polar
     */
    @:to
    public inline
    function toPolar(): PolarRose {
       var polar: PolarRose = new PolarRose( phase(), magnitude );
       return polar;
    }
    /**
     * from Polar
     */
    @:from
    public static inline
    function fromPolar( polar: PolarRose ) {
      return new ComplexNum({ r: polar.magnitude * Math.cos( polar.phase ), i: polar.magnitude * Math.sin( polar.phase ) } );
    }
}
inline 
function sin( c: ComplexNum ): ComplexNum {
   return if( c.isReal() == true ){
         new ComplexNum({ r: Math.sin( c.real ), i: 0 });
   } else { 
         new ComplexNum({ r: Math.sin(c.real) * Hyperbolic.cosh(c.i)
                     , i: Math.cos(c.real) * Hyperbolic.sinh(c.i) });
   }
}
inline
function cos( c: ComplexNum ):ComplexNum {
    return if( c.isReal() == true ){
        new ComplexNum({ r: Math.cos( c.real ), i: 0 } );
    } else {
        new ComplexNum({ r: Math.cos(c.real) * Hyperbolic.cosh(c.i)
                       , i: -Math.sin(c.real) * Hyperbolic.sinh(c.i) });
    }
}
inline 
function tan( c: ComplexNum ): ComplexNum {
    return if( c.isReal() == true ){
        new ComplexNum({ r: Math.tan( c.real ), i: 0 });
    } else {
        return sin(c)/cos(c);
    }
}
inline
function sinh( c: ComplexNum ): ComplexNum {
    return if( c.isReal() == true ){
        new ComplexNum({ r: Hyperbolic.sinh( c.real ), i: 0 });
    } else { 
        new ComplexNum({ r: Hyperbolic.sinh(c.real) * Math.cos(c.i)
                       , i: Hyperbolic.cosh(c.real) * Math.sin(c.i) });
    }
}
inline
function cosh( c: ComplexNum ): ComplexNum {
    return if( c.isReal() == true ){
        new ComplexNum({ r: Hyperbolic.cosh( c.real ), i: 0 });
    } else { 
        new ComplexNum({ r: Hyperbolic.cosh(c.real) * Math.cos(c.i)
                       , i: Hyperbolic.sinh(c.real) * Math.sin(c.i) });
    }
}
inline
function tanh( c: ComplexNum ): ComplexNum {
    return if( c.isReal() == true ){
        new ComplexNum({ r: Hyperbolic.tanh( c.real ), i: 0 });
    } else { 
        var hx = Hyperbolic.tanh( c.real );
        var ty = Math.tan( c.i );
        var n = new ComplexNum({ r: hx, i: ty });
        var d = new ComplexNum({ r: 1,  i: hx * ty });
        n/d;
    }
}
