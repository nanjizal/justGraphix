package justGraphix.target.openflTarget_;
#if starling
import justGraphix.image.Pixelimage;
import lime.graphics.ImageBuffer;
import lime.graphics.Image;
import starling.textures.Texture;
import starling.display.Image;
import openfl.display.BitmapData;
import starling.display.Quad;
import pi_xy.formats.LimeImage.toLimeImage;

inline
function toStarlingTexture( pixelImage: justGraphix.image.Pixelimage ): starling.textures.Texture {
    return starling.textures.Texture.fromBitmapData( BitmapData.fromImage( toLimeImage( pixelImage ) ));
}
inline
function toStarlingQuad( pixelImage: justGraphix.image.Pixelimage, width: Float = 0, height: Float = 0 ): starling.display.Quad {
    var texture = starling.textures.Texture.fromBitmapData( BitmapData.fromImage( toLimeImage( pixelImage ) ));
    if( width == 0 ) width = texture.width;
    if( height == 0 ) height = texture.height;
    var quad: Quad = new Quad( width, height ); 
    quad.texture = texture;
    return quad;
}
inline
function toStarlingImage( pixelImage: justGraphix.image.Pixelimage ){
    return new starling.display.Image( toStarlingTexture( pixelImage ) );
}
#end