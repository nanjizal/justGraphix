package justGraphix.image;
import justGraphix.image.Pixelimage;
import justGraphix.pixel.Pixel32;
import justGraphix.pixel.Pixel28;

function pixelsTransform( imageTarget: Pixelimage, imageSource: Pixelimage
    , transformFunc: ( colorTarget: Pixel32, colorSource: Pixel32 ) -> Pixel28
    , xTarget:     Float, yTarget:     Float
    , xSource:     Float, ySource:     Float
    , w: Float, h: Float ){
    var p    = Std.int( xSource );
    var xx   = p;
    var q    = Std.int( ySource );
    var dx   = Std.int( xTarget ) - p;
    var dy   = Std.int( yTarget ) - q;
    var maxX = Std.int( xSource + w );
    var maxY = Std.int( ySource + h );
    var xPos: Int;
    var yPos: Int;
    while( true ){
        xPos = p + dx;
        yPos = q + dy;
        imageTarget.setPixel( xPos, yPos
            , transformFunc( imageTarget.getPixel(xPos,yPos), imageSource.getPixel(p,q) )
        );
        p++;
        if( p > maxX ){
            p = xx;
            q++;
        } 
        if( q > maxY ) break;
    }
}
class PixelsTransform {
    /**
       <font color="LightPink" font-weight:"Bold">pixelsTransform</font> module level field
    **/
    public var _pixelsTransform:( imageTarget: Pixelimage, imageSource: Pixelimage
        , transformFunc: ( colorTarget: Pixel32, colorSource: Pixel32 ) -> Pixel28
        , xTarget:     Float, yTarget:     Float
        , xSource:     Float, ySource:     Float
        , w: Float, h: Float ) -> Void = pixelsTransform;
}