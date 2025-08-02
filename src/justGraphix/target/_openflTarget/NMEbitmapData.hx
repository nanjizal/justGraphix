package justGraphix.target._openflTarget;
#if( NME )
//#if !'doc-gen'
import nme.display.BitmapData;
import justGraphix.image.Pixelimage;
import justGraphix.pixel.Pixel32;
import haxe.io.UInt8Array;
import iterMagic.Img;

// module NMEbitmapData
class NMEbitmapData {
    @:keep
    public static var toNmeBitmapData_ = toNmeBitmapData;
    @:keep
    public static var fromNmeBitmapData_ = fromNmeBitmapData;
    public function new(){}
}
// untested!!
//@:dox(hide)
inline
function toNmeBitmapData( pixelImage: Pixelimage ): BitmapData {
    var lh = pixelImage.height; 
    var lw = pixelImage.width;
    //return BitmapData.loadFromHaxeBytes( dataRGB, dataA );
    var rect = new nme.geom.Rectangle( 0, 0, lw, lh );
    var bitmapData = new nme.display.BitmapData( lw, lh, true, 0xFFFFFFFF, nme.image.PixelFormat.pfBGRA );
    var argb = haxe.io.Bytes.alloc( lw * lh * 4 );
    var p = 0;
    for( y in 0...lh ) {
        for( x in 0...lw ) {
            var col: Pixel32 = new Pixel32( pixelImage.getARGB( x, y ) );
            var a: Int = col.c0;
            var r: Int = col.c1;
            var g: Int = col.c2;
            var b: Int = col.c3;
            argb.set( p++, a );
            argb.set( p++, r );
            argb.set( p++, g );
            argb.set( p++, b );
        }
    }
    bitmapData.setPixels( rect, nme.utils.ByteArray.fromBytes( argb ) );
    return bitmapData;
}
inline
function fromNmeBitmapData( bitmapData: BitmapData ): Pixelimage {
    var lh = bitmapData.height; 
    var lw = bitmapData.width;
    var rect = new nme.geom.Rectangle( 0, 0, lw, lh );
    var byteArray: nme.utils.ByteArray = bitmapData.getPixels( rect );
    var pixelImage = new Pixelimage( lw, lh );
    pixelImage.transparent = true;
    var p = 0;
    for( y in 0...lh ) {
        for( x in 0...lw ) {
            var a: Int = byteArray.__get( p++ );
            var r: Int = byteArray.__get( p++ );
            var g: Int = byteArray.__get( p++ );
            var b: Int = byteArray.__get( p++ );
            var col = Pixel32.fromChannels( a, r, g, b );
            pixelImage.setARGB( x, y, col );
        }
    }
    return pixelImage;
}
#end