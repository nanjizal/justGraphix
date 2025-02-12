package justGraphix.image.imageAbstracts;
import justGraphix.contour.contourPath.DrawTileHelper;
import justGraphix.image.Pixelimage;
import justGraphix.hit.HitTri;
import justGraphix.hit.HitQuad;
import justGraphix.hit.HitTriArray;
import justGraphix.image.algo.GeomPix;
import justGraphix.pixel.Pixel32;
import justGraphix.image.algo.QuadrantPixel;
import justGraphix.image.algo.PolyPixel;
import justGraphix.curve.CirclePixel;

@:transient
abstract TileShape( Pixelimage ) from Pixelimage to Pixelimage {

    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    public inline
    function triangle( ax: Float, ay: Float
                    , bx: Float, by: Float
                    , cx: Float, cy: Float
                    , tileImage: Pixelimage
                    , hasHit: Bool = false ): Null<HitTri> {
        return justGraphix.image.algo.TriPixel
            .tileTriangle( this, ax, ay, bx, by, cx, cy, tileImage, hasHit );
    }
    public inline
    function quad( ax: Float, ay: Float
                     , bx: Float, by: Float
                     , cx: Float, cy: Float
                     , dx: Float, dy: Float 
                     , tileImage: Pixelimage
                     , hasHit: Bool = false ): HitQuad {
        // tri e - a b d
        // tri f - b c d
        return justGraphix.image.algo.QuadPixel
            .tileQuadrilateral( this, ax, ay, bx, by, cx, cy, dx, dy, tileImage, hasHit );
    }
    public inline 
    function rectangle( x:   Float, y: Float
                     , wid: Float, hi: Float
                     , tileImage: Pixelimage
                     , hasHit: Bool = false ): HitQuad {
        var bx = x + wid;
        var cy = y + hi;
        return quad( x,  y, bx, y, bx, cy, x,  cy, tileImage, hasHit );
    }
        /**
        tiles a thick line using two triangles vector p, q
        debug corners draws coloured squares on the corners for development
    **/
    public inline 
    function line( px: Float, py: Float, qx: Float, qy: Float
                     , thick: Float, tileImage: Pixelimage
                     , hasHit: Bool = false, ?debugCorners = false ): Null<HitQuad>{
        var o = qy-py;
        var a = qx-px;
        var h = Math.pow( o*o + a*a, 0.5 );
        var theta = Math.atan2( o, a );
        return justGraphix.image.algo.LinePixel
            .rotateTileLine( this, px, py, thick, h, theta, tileImage, hasHit, debugCorners );
    }
    /**
        this provides building block for image tiled regular polygons,ellipses and circles
        cornerUp false will have polygon with flat edge on the top
        defined from centre cx,cy the radius allow stretching the regualar and phi controls rotation
        sides defines the sides required
        would be nice to add skew in future?
        cornerUp may need debugging
    **/
    public inline
    function PolyBuild( cx: Float, cy: Float
                      , rx: Float, ry: Float
                      , tileImage: Pixelimage
                      , ?phi: Float = 0.
                      , ?sides: Int = 36, cornerUp: Bool = true ){
        tilePolygonBuild( this
                        , cx, cy
                        , rx, ry
                        , tileImage
                        , phi
                        , sides
                        , cornerUp );
    }
    /**
        tiles Quadrant draws a quarter arc, for rounded rectangle there are I,II,III,IV defined ones in Pixelshape
    **/
    public inline
    function quadrant( cx: Float, cy: Float
                         , rx: Float, ry: Float
                         , startAngle: Float
                         , tileImage: Pixelimage
                         , ?phi: Float, ?targetError: Float = 1.05 ){
        tileSolidQuadrant( this
                         , cx, cy
                         , rx, ry
                         , startAngle
                         , tileImage
                         , phi
                         , targetError );
    }

    public inline
    function quadrantI( cx: Float, cy: Float
                          , rx: Float, ry: Float
                          , tileImage: Pixelimage
                          , ?phi: Float = 0. ){
        // positive positive plane I  + + , simon says RED
        quadrant( cx, cy
                , rx, ry
                , 3 * Math.PI / 2
                , tileImage
                , phi );
    }

    public inline
    function quadrantII( cx: Float, cy: Float
                           , rx: Float, ry: Float
                           , tileImage: Pixelimage
                           , ?phi: Float = 0. ){
        // plane II  - + , simon says GREEN
        quadrant( cx, cy
                , rx, ry
                , Math.PI
                , tileImage
                , phi );
    }

    public inline
    function quadrantIII( cx: Float, cy: Float
                            , rx: Float, ry: Float
                            , tileImage: Pixelimage
                            , ?phi:Float = 0. ){
        // negative negative plane III - - , simon says YELLOW
        quadrant( cx, cy
                , rx, ry
                , Math.PI / 2
                , tileImage
                , phi );
    }

    public inline
    function quadrantIV( cx: Float, cy: Float
                       , rx: Float, ry: Float
                       , tileImage: Pixelimage
                       , ?phi:Float = 0.) {
        // plane IV  + - , simon says BLUE
        quadrant( cx, cy
                , rx, ry
                , 0
                , tileImage
                , phi );
    }
    public inline
    function sweepTri( ax: Float, ay: Float
                         , rx: Float, ry: Float
                         , startRadian: Float, sweepRadian: Float
                         , tileImage: Pixelimage
                         , hasHit: Bool = false ): HitTri {
        var currAngle = startRadian;
        var bx = rx * Math.cos( currAngle ) + ax;
        var by = ry * Math.sin( currAngle ) + ay;
        // last pie
        currAngle = startRadian + sweepRadian;
        var cx = rx * Math.cos( currAngle ) + ax;
        var cy = ry * Math.sin( currAngle ) + ay;
        return triangle( ax, ay, bx, by, cx, cy, tileImage, hasHit );
    }

    public inline
    function pie( ax: Float, ay: Float
                , rx: Float, ry: Float
                , startRadian: Float, sweepRadian: Float
                , tileImage: Pixelimage
                , hasHit: Bool = false
                , ?targetError: Float = 1.05 ): Null<HitTriArray> {
        var rSmall = ( rx > ry ) ? ry : rx;
        var noSides = circleError( rSmall, targetError );
        var theta = 1.41213 * Math.PI / noSides; // 2* but make smaller
        var currAngle = startRadian;
        var tot = Math.floor( sweepRadian / theta );
        theta += ( sweepRadian / theta - tot ) / noSides;
        tot = Math.floor( sweepRadian / theta );
        var bx = rx * Math.cos( currAngle ) + ax;
        var by = ry * Math.sin( currAngle ) + ay;
        var cx = 0.;
        var cy = 0.;
        var arrTri:Array<HitTri> = [];
        for( i in 1...tot + 1 ) {
            currAngle = startRadian + i * theta;
            cx = rx * Math.cos( currAngle ) + ax;
            cy = ry * Math.sin( currAngle ) + ay;
            var triHit = triangle( ax, ay, bx, by, cx, cy, tileImage, hasHit );
            if( hasHit ) arrTri[arrTri.length] = triHit;
            bx = cx;
            by = cy;
        }
        // last pie
        currAngle = startRadian + sweepRadian;
        cx = rx * Math.cos( currAngle ) + ax;
        cy = ry * Math.sin( currAngle ) + ay;
        var triHit = triangle( ax, ay, bx, by, cx, cy, tileImage, hasHit );
        if( hasHit ) arrTri[arrTri.length] = triHit;
        return if( hasHit ) {
            new HitTriArray( arrTri );
        } else {
            arrTri = null;
            null;
        }
    }

    public inline
    function ellipseTri( cx: Float, cy: Float
                           , rx: Float, ry: Float
                           , tileImage: Pixelimage
                           , ?phi: Float = 0
                           , ?printSides: Bool = false
                           , ?targetError:Float = 1.05) {
        var rSmall = ( rx > ry ) ? ry : rx;
        var noSides = circleError( rSmall, targetError );
        if( printSides ) trace( noSides );
        PolyBuild( cx, cy
                 , rx, ry
                 , tileImage
                 , phi
                 , noSides );
    }
    /**
        svg path
    **/
    public inline
    function svgPath( path: String
                    , strokeWidth: Float, tileImageStroke: Pixelimage
                    , translateX = 0. , translateY = 0.
                    , scaleX     = 1. , scaleY     = 1.  ){
        var drawTileHelper = new DrawTileHelper( this, strokeWidth, tileImageStroke
                                                 , translateX, translateY
                                                 , scaleX, scaleY );
        drawTileHelper.path( path );
    }
}
