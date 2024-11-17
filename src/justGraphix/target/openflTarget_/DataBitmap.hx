package justGraphix.target.openflTarget_;
import justGraphix.pixel.Pixel32;
import justGraphix.image.Pixelimage;
// DO NOT USE yet..
#if( nme || openfl )
typedef FlashBitmapData = #if openfl openfl.display.BitmapData; #else nme.display.BitmapData; #end
#end
@:forward
@:transient
abstract DataBitmap( Pixelimage ) from Pixelimage to Pixelimage {

    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    #if ( nme || openfl )
    @:to
    public inline
    function to(): FlashBitmapData {
        #if ( openfl && !nme )
            return  pi_xy.formats.OpenFLbitmapData.toOpenflBitmapData_( this );
        #else
            return pi_xy.formats.NMEbitmapData.toNmeBitmapData_( this );
        #end
    }
    public static inline
    function createPixelImage( bm: FlashBitmapData ) {
        #if ( openfl && !nme )
            return pi_xy.formats.OpenFLbitmapData.fromOpenflBitmapData_( bm );
        #else
            return pi_xy.formats.NMEbitmapData.fromNmeBitmapData_( bm );
        #end
    }
    #end
}