package justGraphix.color;
import justGraphix.color.ColorHelp;
class ColorHelp {
    // String return
    public var htmlRGBA_:( r_: Float, g_: Float, b_: Float, a_: Float ) -> String = htmlRGBA;
    public var stringColor_:( col: Int, ?alpha: Float ) -> String = stringColor;
    public var stringHashARGB_:( col: Int ) -> String = stringHashARGB;
    public var htmlHex_:( r: Float, g: Float, b: Float ) -> String = htmlHex;
    // Int return 
    public var rgbInt_: ( c: Int ) -> Int = rgbInt;
    public var colorAlpha_: ( color: Int, alpha: Float ) -> Int = colorAlpha;
    public var from_argb_: ( a: Float, r: Float, g: Float, b: Float ) -> Int = from_argb;
    public var toHexInt_: ( c: Float ) -> Int = toHexInt;
    public var argbInt_:( a: Int, r: Int, g: Int, b: Int ) -> Int = argbInt;
    public var argbIntAvg_:( c0: Int, c1: Int ) -> Int = argbIntAvg;
    public var luminosityGrey_:( color: Int, useAlpha: Bool ) -> Int = luminosityGrey;
    public var sepia_:( color: Int ) -> Int = sepia;
    // Float return
    public var alphaChannel_: ( int: Int ) -> Float = alphaChannel;
    public var redChannel_: ( int: Int ) -> Float = redChannel;
    public var greenChannel_: ( int: Int ) -> Float = greenChannel;
    public var blueChannel_: ( int: Int ) -> Float = blueChannel;
    public var alphaAvg_:( a: Int, b: Int  ) -> Float = alphaAvg;
    public var redAvg_:( a: Int, b: Int  ) -> Float = redAvg;
    public var greenAvg_:( a: Int, b: Int  ) -> Float = greenAvg;
    public var blueAvg_:( a: Int, b: Int  ) -> Float = blueAvg;
    public var clampClosed01_:( v: Float ) -> Float = clampClosed01;
}
// String return
inline
function htmlRGBA( r_: Float, g_: Float, b_: Float, a_: Float ): String {
    var r = r_;
    var g = g_;
    var b = b_;
    var a = a_;
    return 'rgba($r,$g,$b,$a)';
}
inline
function stringColor( col: Int, ?alpha: Float ): String {
    return if( alpha != null && alpha != 1.0 ){
        var r = (col >> 16) & 0xFF;
        var g = (col >> 8) & 0xFF;
        var b = (col) & 0xFF;
        'rgba($r,$g,$b,$alpha)';
    } else {
        '#' + StringTools.hex( col, 6 );
    }
}
inline
function stringHashARGB( col: Int ): String
    return '#' + StringTools.hex( col, 8 );
inline
function htmlHex( r: Float, g: Float, b: Float ): String
    return '#' + StringTools.hex( from_rgb( r, g, b ), 6 );
// Int return

inline
function from_rgb( r: Float, g: Float, b: Float ): Int
             return ( toHexInt( r ) << 16 ) 
                  | ( toHexInt( g ) << 8 ) 
                  |   toHexInt( b );

inline
function alphaChannel( int: Int ) : Float
    return ((int >> 24) & 255) / 255;
inline
function redChannel( int: Int ) : Float
    return ((int >> 16) & 255) / 255;
inline
function greenChannel( int: Int ) : Float
    return ((int >> 8) & 255) / 255;
inline
function blueChannel( int: Int ) : Float
    return (int & 255) / 255;
inline
function AplusRGB( col: Int, alpha: Int ): Int
    return alpha << 24 | col;
inline
function argbInt( a: Int, r: Int, g: Int, b: Int ): Int
    return ( a << 24 ) | ( r << 16 ) | ( g << 8 ) | b;
inline
function avg( p: Float, q: Float ): Float 
    return ( p + q )/2;
inline
function between( a: Float, b: Float, t: Float = 0.5 ): Float 
    return t*a + (1.-t)*b;
inline 
function alphaAvg( a: Int, b: Int  ): Float
    return avg( alphaChannel( a ),alphaChannel( b ) );
inline
function alphaBetween( a: Int, b: Int, t: Float = 0.5 ): Float
    return between( alphaChannel( a ), alphaChannel( b ), t );
inline 
function redAvg( a: Int, b: Int  ): Float
    return avg( redChannel( a ), redChannel( b ) );
inline
function redBetween( a: Int, b: Int, t: Float = 0.5 ): Float
    return between( redChannel( a ), redChannel( b ), t );
inline 
function greenAvg( a: Int, b: Int  ): Float
    return avg( greenChannel( a ), greenChannel( b ) );
inline
function greenBetween( a: Int, b: Int, t: Float = 0.5 ): Float
    return between( greenChannel( a ), greenChannel( b ), t );
inline 
function blueAvg( a: Int, b: Int  ): Float
    return avg( blueChannel( a ), blueChannel( b ) );
inline
function blueBetween( a: Int, b: Int, t: Float = 0.5 ): Float
    return between( blueChannel( a ), blueChannel( b ), t );
inline
function from_argb( a: Float, r: Float, g: Float, b: Float ): Int
    return ( toHexInt( a ) << 24 ) 
         | ( toHexInt( r ) << 16 ) 
         | ( toHexInt( g ) << 8 ) 
         |   toHexInt( b );
inline
function argbIntAvg( a: Int, b: Int ): Int
    return from_argb( alphaAvg( a, b )
                    , redAvg( a, b )
                    , greenAvg( a, b )
                    , blueAvg( a, b ) );
inline
function argbIntBetween( a: Int, b: Int, t: Float = 0.5 ): Int
     return from_argb( alphaBetween( a, b, t )
                     , redBetween(   a, b, t )
                     , greenBetween( a, b, t )
                     , blueBetween(  a, b, t ) );
inline
function getBlack( r: Float, g: Float, b: Float ): Float {
     return 1. - Math.max( Math.max( r, b ), g );
}
inline
function hexToARGB( int: Int ):{ a: Float, r: Float, g: Float, b: Float }{
     var a = ((int >> 24) & 255) / 255;
     var r = ((int >> 16) & 255) / 255;
     var g = ((int >> 8) & 255) / 255;
     var b = (int & 255) / 255;
     return { a: a, r: r, g: g, b: b };
 }
inline
function toHexInt( c: Float ): Int
    return Math.round( c * 255 );
inline
function rgbInt( c: Int ): Int
    return ( c << 8 ) >> 8;
// hack of -0.000000000000001; to make 0xFF alpha work in browser
inline
function getAlpha( c: Float ): Float
    return ((Std.int(c) >> 24) & 255 )/255 - 0.000000000000001;
inline
function alpha1(): Float
    return 1. - 0.000000000000001;
inline
function getColor( c: Float ): Int
    return rgbInt( Std.int( c ) );
        
// throws aways alpha on c and uses the new a value.
inline
function colorAlpha( color: Int, alpha: Float ): Int
    return ( toHexInt( alpha ) << 24 ) | rgbInt( color );

inline
function colorIntAlpha( color: Int, alpha: Int ): Int
    return ( alpha << 24 ) | rgbInt( color );
    
// assumes ARGB in and out
inline
function luminosityGrey( color: Int, useAlpha: Bool = true ): Int{
    var c = hexToARGB( color );
    var l: Float = 0.;
    var v: Int = 0;
    return if( useAlpha ){
        l = c.a * ( 0.21*c.r + 0.72*c.g + 0.07*c.b );
        v = Math.round( l*0xFF );
        ( 0xFF << 24 | v << 16 | v << 8 | v );
    } else {
        l = ( 0.21*c.r + 0.72*c.g + 0.07*c.b );
        v = Math.round( l*0xFF );
        ( Math.round(c.a*0xFF) << 24 | v << 16 | v << 8 | v );
    }
}
inline
function sepia( color: Int ): Int {
    var c = hexToARGB( color );
    var r = clampClosed01(( c.r * .393) + ( c.g *.769) + ( c.b * .189));
    var g = clampClosed01(( c.r * .349) + ( c.g *.686) + ( c.b * .168));
    var b = clampClosed01(( c.r * .272) + ( c.g *.534) + ( c.b * .131));
    return from_argb( c.a, c.r, c.g, c.b );
}
inline
function clampClosed01( v: Float ): Float {
    return if( v <= 0. ) 0.
        else if (v >= 1. ) 1.
        else v;
}

