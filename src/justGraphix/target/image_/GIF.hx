package justGraphix.target.image_;
import justGraphix.image.Pixelimage;
import justGraphix.pixel.Pixel32;
import justGraphix.target.image_.Format;
#if sys
@:forward
@:transient
abstract GIF( Pixelimage ) from Pixelimage to Pixelimage {
    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    @:access( justGraphix.image.Pixelimage )
    @:access( justGraphix.image.ImageStruct )
    public inline
    function from( name: String ): Pixelimage {
        var here: Pixelimage = this;
        var pixelimage = fromGIFframe( name ); // assumes frame 0
        var resize = here.transform.scaleMatch( pixelimage );
        for( i in 0...here.image.length ) here.image[ i ] = resize.image[ i ];
        return here;
    }
}
#end