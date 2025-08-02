package justGraphix.contour.contourPath;

import justGraphix.image.Pixelimage;
import justGraphix.path.DrawAbstractHelper;
import justGraphix.hit.HitQuad;
import justGraphix.hit.HitObjArray;
import justGraphix.hit.IhitObj;
import haxe.ds.Vector;

abstract class DrawContourHelper extends DrawAbstractHelper {
    var translateX: Float;
    var translateY: Float;
    var scaleX: Float;
    var scaleY: Float;
    var pixelImage: Pixelimage;
    var hitsAllowed: Bool;
    var hitsArr: HitObjArray;
    public function new( pixelImage: Pixelimage
        , translateX = 0.
        , translateY = 0.
        , scaleX = 1.
        , scaleY = 1.  
        , hitsAllowed = false ){
        this.pixelImage = pixelImage;
        this.translateX = translateX;
        this.translateY = translateY;
        this.scaleX = scaleX;
        this.scaleY = scaleY;
        this.hitsAllowed = hitsAllowed;
        if( hitsAllowed ) hitsArr = new HitObjArray( new Array<IhitObj>() );
        super();
        // needs to be done in the class instance probably to pick up correct methods?
        /** svgLinePath = new SvgLinePath( this ); **/
    }
    //function lineDraw( ax: Float, ay: Float, bx: Float, by: Float ): HitQuad;
}