package justGraphix.image.imageAbstracts;
#if ( peote_view )
import justGraphix.pixel.Pixel32;
@:forward
@:transient
abstract PeoteTextureData( Pixelimage ) from Pixelimage to Pixelimage {
    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    @:to
    public inline
    function to(): peote.view.TextureData {
        return justGraphix.target.openflTarget_.PeoteTextureData.toPeoteTextureData( this );
    }
}
#end
