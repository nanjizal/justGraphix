package justGraphix.color;
import justGraphix.color.ColorHelp;
    /**
     * String_color is aimed at use within html
     * if no alpha then #FFFFFF format otherwise in 
     * rgba($r,$g,$b,$alpha) format
     */
@:transitive
@:forward
abstract String_color( String ) to String {
    inline
    function new( s: String ){
        this = s;
    }
    public static inline
    function float_rgba( r: Float, g: Float, b: Float, a: Float ): String_color {
        return new String_color( htmlRGBA( r, g, b, a ) );
    }
    public static inline 
    function int_rgba( col: Int, alpha: Float = 1. ): String_color {
        return new String_color( stringColor( col, alpha ) );
    }
    public inline function isHex(){
        return( this.charCodeAt(0) == '#'.code );
    }
    public inline
    function toInt(): Int {
        return if( isHex() ){
            var s = '0x'+this.substr( 1 );
            Std.parseInt( s );
        } else {
            var rgba = extractRGBA();
            from_argb( rgba.a, rgba.r, rgba.g, rgba.b );
        }
    }
    public inline 
    function toRGBA(): { r: Float, g: Float, b: Float, a: Float }{
        return if( isHex() ){
            hexToARGB( toInt() );
        } else {
            extractRGBA();
        }
    }
    inline
    function extractRGBA():{ r: Float, g: Float, b: Float, a: Float } {
        final startLen = 'rgba('.length;
        var rgba = this.substring( startLen, this.length-1 );
        var arr = rgba.split( ',' );
        var a: Float = 1;
        if( arr.length > 3 ) a = Std.parseFloat(arr[3]);
        return { r: Std.parseFloat(arr[0])
               , g: Std.parseFloat(arr[1])
               , b: Std.parseFloat(arr[2])
               , a: a };
    }
}