package justGraphix.target.openflTarget_;
#if ( peote_view )
import peote.view.TextureFormat;
import peote.view.Texture;
import peote.view.TextureData;

import justGraphix.image.Pixelimage;
import justGraphix.pixel.Pixel32;
import haxe.io.UInt8Array;
import justGraphix.image.Img;

typedef PeotePixels = haxe.io.Bytes; //RGBA
//typedef RawPixels   = haxe.io.Bytes;  //ABGR

@:forward
@:transient
abstract PeoteTexture( Pixelimage ) from Pixelimage to Pixelimage {
    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    @:to
    public inline
    function to(): peote.view.Texture {
        return PeoteV.toPeoteTexture_( this );
    }
    @:to
    public inline
    function toTextureData(): peote.view.TextureData {
        return PeoteV.toPeoteTextureData_( this );
    }
    // unsure when/how/if feasible to grab the texture.
    public static inline
    function createPixelImage( texture: peote.view.Texture ): Pixelimage {
        return PeoteV.fromPeoteTexture_( texture );
    }
}

// module PeoteTexture
class PeoteV {
    @:keep
    public static var toPeoteTexture_ = toPeoteTexture;
    @:keep
    public static var fromPeoteTexture_ = fromPeoteTexture;
    @:keep
    public static var toPeoteTextureData_ = toPeoteTextureData;
    @:keep
    public static var fromPeoteTextureData_ = fromPeoteTextureData;
    @:keep
    public static var toPeotePixels_ = toPeotePixels;
    @:keep
    public static var fromPeotePixels_ = fromPeotePixels;
    public function new(){}
}

inline
function toPeotePixels( pixelImage: Pixelimage, ?peotePixels: Null<PeotePixels> ): PeotePixels {
    var lh = pixelImage.height; 
    var lw = pixelImage.width;
    if( peotePixels == null ) peotePixels = haxe.io.Bytes.alloc( lw * lh * 4 );
    var a: Int;
    var r: Int;
    var g: Int;
    var b: Int;
    var col: Pixel32;
    var w = 0;
    for( y in 0...lh ) {
        for( x in 0...lw ) {
            col = new Pixel32( pixelImage.getARGB( x, y ) );
            a = col.c0;
            r = col.c1;
            g = col.c2;
            b = col.c3;
            peotePixels.set(w++,r);
            peotePixels.set(w++,g);
            peotePixels.set(w++,b);
            peotePixels.set(w++,a);
        }
    }
    return ( peotePixels: PeotePixels );
}
inline
function fromPeotePixels( peotePixels: PeotePixels, width: Int, height: Int ): Pixelimage {
    var lh = height; 
    var lw = width;
    var pixelImage = new Pixelimage( lw, lh );
    pixelImage.transparent = true;
    var p = 0;
    var a: Int;
    var r: Int;
    var g: Int;
    var b: Int;
    var col: Pixel32;
    for( y in 0...lh ) {
        for( x in 0...lw ) {
            r = peotePixels.get( p++ );
            g = peotePixels.get( p++ );
            b = peotePixels.get( p++ );
            a = peotePixels.get( p++ );
            col = Pixel32.fromChannels( a, r, g, b );
            pixelImage.setARGB( x, y, col );
        }
    }
    return pixelImage;
}

inline
function toPeoteTextureData( pixelImage: Pixelimage ){
    var peotePixels = toPeotePixels( pixelImage );
    return new peote.view.TextureData( pixelImage.width, pixelImage.height, peote.view.TextureFormat.RGBA, peotePixels );
}

inline
function fromPeoteTextureData( textureData: peote.view.TextureData ): Null<Pixelimage> {
    return if( textureData.format != peote.view.TextureFormat.RGBA ){
        trace( 'requires TextureData in RGBA format!!');
        return null;
    } else {
        var peotePixels = textureData.bytes;
        return fromPeotePixels( peotePixels, textureData.width, textureData.height );
    }
}

inline
function toPeoteTexture( pixelImage: Pixelimage, slot:Int = 0): peote.view.Texture {
    var texture = new peote.view.Texture( pixelImage.width, pixelImage.height );
    texture.setData( toPeoteTextureData( pixelImage ), slot );
    return texture;
}

inline
function fromPeoteTexture( texture: peote.view.Texture, transparent: Bool = true ): Pixelimage {
        var lh = texture.height; 
        var lw = texture.width;
        var pixelImage = new Pixelimage( lw, lh );
        pixelImage.transparent = transparent;
        var data = texture.readPixelsUInt8( 0, 0, lw, lh );
        var p = 0;
        for( y in 0...lh ) {
            for( x in 0...lw ) {
                var r = data.get( p++ );
                var g = data.get( p++ );
                var b = data.get( p++ );
                var a = data.get( p++ );
                pixelImage.set_argbPixel( a, r, g, b, pixelImage.position( x, y ) );
            }
        }
        return pixelImage;
}
#end