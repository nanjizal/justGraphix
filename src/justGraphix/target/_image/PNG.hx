package justGraphix.target._image;
import justGraphix.image.Pixelimage;
import justGraphix.pixel.Pixel32;
import justGraphix.target._image.Format;
#if sys
@:forward
@:transient
abstract PNG( Pixelimage ) from Pixelimage to Pixelimage {
    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    @:access( justGraphix.image.Pixelimage )
    @:access( justGraphix.image.ImageStruct )
    public inline
    function to( name: String ): Pixelimage {
        var here: Pixelimage = this;
        toPNG( here, name );
        return here;
    }
    @:access( justGraphix.image.Pixelimage )
    @:access( justGraphix.image.ImageStruct )
    public inline
    function from( name: String ): Pixelimage {
        var here: Pixelimage = this;
        var pixelimage = fromPNG( name );
        var resize = here.transform.scaleMatch( pixelimage );
        for( i in 0...here.image.length ) here.image[ i ] = resize.image[ i ];
        return here;
    }
}
#end