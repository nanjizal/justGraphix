package justGraphix.target.openflTarget_;
#if ( lime )
import lime.graphics.Image;
import lime.graphics.ImageBuffer;
import justGraphix.image.Pixelimage;
import justGraphix.target.openflTarget_.LimeImage;
//typedef LimeImage = justGraphix.target.openflTarget_.LimeImage;
@:forward
@:transient
abstract ImageLime( Pixelimage ) from Pixelimage to Pixelimage {
    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    @:to
    public inline
    function to(): lime.graphics.Image {
        return LimeImage.toLimeImage( this );
    }
    @:to
    public inline
    function toImageBuffer(): lime.graphics.ImageBuffer {
        return LimeImage.toLimeImageBuffer( this );
    }
    public static inline
    function createPixelImage( Image: lime.graphics.Image ): Pixelimage {
        return LimeImage.fromLimeImage( Image );
    }
}
#end