package justGraphix.target.kha_;
import justGraphix.pixel.Pixel32;
#if kha
import justGraphix.target.khaTarget.KhaPixels;
typedef KhaPixels = justGraphix.target.kha_.KhaPixels;
@:forward
@:transient
abstract KhaImage( Pixelimage ) from Pixelimage to Pixelimage {
    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    @:to
    public inline
    function to(): kha.Image {
        return KhaPixels.toKhaImage_( this );
    }
    public static inline
    function createPixelImage( khaImage: kha.Image ): Pixelimage {
        return KhaPixels.fromKhaImage( khaImage );
    }
    public inline
    function drawG1_Image( x: Int, y: Int, frameBuffer: kha.Framebuffer ){
        KhaPixels.toG1( x, y, this, frameBuffer );
    }
}
#end