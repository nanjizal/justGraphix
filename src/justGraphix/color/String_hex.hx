package justGraphix.color;
import justGraphix.color.ColorHelp;
@:transitive
@:forward
abstract String_hex( String ) from String to String {
    public inline
    function new( s: String ){
        this = s;
    }
    public static inline 
    function Int_hex8( col: Int ): String_hex {
        return new String_hex( stringHashARGB( col ) );
    } 
    public static inline 
    function Float_hex6( r: Float, g: Float, b: Float ): String_hex {
        return new String_hex( htmlHex( r, g, b ) ); 
    }
}