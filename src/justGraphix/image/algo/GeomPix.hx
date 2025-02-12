package justGraphix.image.algo;

import justGraphix.pixel.Pixel32;
import justGraphix.pixel.PixelChannel;

// Module GeomPix
@:structInit
class RectangleWindow{
    public var x: Float;
    public var y: Float;
    public var width: Float;
    public var height: Float;
    inline
    public function new( x: Float, y: Float, width: Float, height: Float ){
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }
    inline
    public static function minMax( x: Float, y: Float, maxX: Float, maxY: Float ): RectangleWindow {
        return new RectangleWindow( x, y, maxX-x, maxY-y );
    }
}
    // Ken Perlin smoothStep 
    inline 
    function smootherStep( t: Float ): Float {
        return t * t * t * (t * (t * 6.0 - 15.0) + 10.0);
    }
    inline 
    function lerp( a: Float, b: Float, t: Float ): Float
        return b + ( b - a ) * t;
    inline
    function lerp4Colors( colorhiA, colorhiB
                        , colorloC, colorloD
                        , u: Float, v: Float
                        , smooth: Bool = true ):Int {
        var hiColor = lerp2Colors( colorhiA, colorhiB, u, smooth );
        var loColor = lerp2Colors( colorloC, colorloD, u, smooth );
        return lerp2Colors( hiColor, loColor, v, smooth );
    }
    // HSL better, but this for initial test.
    inline
    function lerp2Colors( colA: Int, colB: Int, t: Float, smooth: Bool = true ): Int {
        var aA = ( colB >> 24 ) & 0xFF;
        var rA = ( colB >> 16 ) & 0xFF;
        var gA = ( colB >> 8 ) & 0xFF;
        var bA = colB & 0xFF;
        var aB = ( colA >> 24 ) & 0xFF;
        var rB = ( colA >> 16 ) & 0xFF;
        var gB = ( colA >> 8 ) & 0xFF;
        var bB = colA & 0xFF;
        var v = ( smooth )? smootherStep( t ): t;
        // check if values same.
        var af = lerp( aA/255, aB/255, v );
        var rf = lerp( rA/255, rB/255, v );
        var gf = lerp( gA/255, gB/255, v );
        var bf = lerp( bA/255, bB/255, v );
        return Pixel32.from_argb( af, rf, gf, bf );
    }

    inline
    function cross2d( ax: Float, ay: Float, bx: Float, by: Float ): Float
        return ax * by - ay * bx;
    inline
    function dot( ax: Float, ay: Float, bx: Float, by: Float ): Float
        return ax * bx + ay * by;
    inline
    function dotSame( ax: Float, ay: Float ): Float
        return dot( ax, ay, ax, ay );
    inline
    function distanceSquarePointToSegment( x:  Float, y: Float
                                         , x1: Float, y1:Float
                                         , x2: Float, y2:Float
                                         ): Float
    {
        var p1_p2_squareLength = (x2 - x1)*(x2 - x1) + (y2 - y1)*(y2 - y1);
        var dotProduct = ((x - x1)*(x2 - x1) + (y - y1)*(y2 - y1)) / p1_p2_squareLength;
        return if ( dotProduct < 0 ){
            return (x - x1)*(x - x1) + (y - y1)*(y - y1);
        } else if ( dotProduct <= 1 ){
            var p_p1_squareLength = (x1 - x)*(x1 - x) + (y1 - y)*(y1 - y);
            return p_p1_squareLength - dotProduct * dotProduct * p1_p2_squareLength;
        } else {
            return (x - x2)*(x - x2) + (y - y2)*(y - y2);
        }
    }
    inline
    function rotX( x: Float, y: Float, sin: Float, cos: Float ){
        return x * cos - y * sin;
    }
    inline
    function rotY( x: Float, y: Float, sin: Float, cos: Float ){
        return y * cos + x * sin;
    }

class GeomPix {
    /**
       <font color="LightPink" font-weight:"Bold">smoothStep</font> module level field
    **/
    public var _smootherStep:( t: Float ) -> Float = smootherStep;
    /**
       <font color="LightPink" font-weight:"Bold">lerp</font> module level field
    **/
    public var _lerp:( a: Float, b: Float, t: Float ) -> Float = lerp;
    /**
       <font color="LightPink" font-weight:"Bold">lerp4Colors</font> module level field
       @param smooth defaults to true
    **/
    public var _lerp4Colors:( colorhiA: Int, colorhiB: Int, colorloC: Int, colorloD: Int, u: Float, v: Float, smooth: Bool ) -> Int = lerp4Colors;
    /**
       <font color="LightPink" font-weight:"Bold">cross2d</font> module level field
    **/
    public var _cross2d:( ax: Float, ay: Float, bx: Float, by: Float ) -> Float = cross2d;
    /**
       <font color="LightPink" font-weight:"Bold">dot</font> module level field
    **/
    public var _dot:( ax: Float, ay: Float, bx: Float, by: Float ) -> Float = dot;
    /**
       <font color="LightPink" font-weight:"Bold">dotSame</font> module level field
    **/
    public var _dotSame:( ax: Float, ay: Float ) -> Float = dotSame;
    /**
       <font color="LightPink" font-weight:"Bold">distanceSquarePointToSegment</font> module level field
    **/
    public var _distanceSquarePointToSegment:( x:  Float, y: Float, x1: Float, y1: Float, x2: Float, y2:Float ) -> Float = distanceSquarePointToSegment;
    /**
       <font color="LightPink" font-weight:"Bold">rotX</font> module level field
    **/
    public var _rotX:( x: Float, y: Float, sin: Float, cos: Float ) -> Float = rotX;
    /**
       <font color="LightPink" font-weight:"Bold">rotY</font> module level field
    **/
    public var _rotY:( x: Float, y: Float, sin: Float, cos: Float ) -> Float = rotY;
}