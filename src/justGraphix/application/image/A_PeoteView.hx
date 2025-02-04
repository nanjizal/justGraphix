package justGraphix.application.image;

import justGraphix.contour.Sketcher;
import justGraphix.contour.Pen2D;
import haxe.CallStack;

import lime.app.Application;
import lime.ui.Window;

import peote.view.PeoteView;
import peote.view.Buffer;
import peote.view.Display;
import peote.view.Program;
import peote.view.Color;
import peote.view.*;
import peote.view.TextureFormat;
import peote.view.intern.BufferBytes;

import justGraphix.image.Pixelimage;
import justGraphix.pixel.Pixel32;
import haxe.io.UInt8Array;
import justGraphix.image.Img;
import justGraphix.image.imageAbstracts.PeoteTextureData;
import justGraphix.pallette.simple.QuickARGB;
import justGraphix.contour.StyleSketch;
import justGraphix.contour.StyleEndLine;
import justGraphix.path.ScaleTranslateContext;
import justGraphix.path.Path_D;
import justGraphix.path.SvgPath;
import haxe.CallStack;
import lime.app.Application;
import lime.ui.Window;
import peote.view.*;
import justGraphix.target.openflTarget_.PeoteBasicElement;
import peote.view.element.Elem;
import justGraphix.path.Path_D;
import peoteViewTriangle.Triangle;
import peoteViewTriangle.TriangleDisplay;
class A_PeoteView extends Application {
    var wide = 800;
    var hi = 600;
    
    /**
     * Lime GL setup for PeoteView
     */
    override function onWindowCreate(): Void {
        switch( window.context.type ){
            case WEBGL, OPENGL, OPENGLES:
                try startPeoteView( window )
                catch (_) trace(CallStack.toString(CallStack.exceptionStack()), _);
            default: throw("Sorry, only works with OpenGL.");
        }
    }
    /**
     * PeoteView initalization
     * @param window 
     */
    public
    function startPeoteView( window: Window ){
        var peoteView = new PeoteView( window) ;
        // pixel example
        var display   = new Display( 10, 10, window.width - 20, window.height - 20, Color.WHITE );
        textureUsage( display );
        peoteView.addDisplay( display );
        // triangle example
        var triangleDisplay = new TriangleDisplay( 0, 0, window.width, window.height, 0, Std.int( 100* 1024) );
        var pen2D = new Pen2D( 0xFF0000FF );
        birdSVG( pen2D );
        var data = pen2D.arr;
        var color: Int;
        var totalTriangles = Std.int( data.size/7); // /9 for gradient version!
        var str = '';
        for( i in 0...totalTriangles ){
            pen2D.pos = i;
            color = Std.int( data.color );
            triangleDisplay.addElement( new Triangle( data.ax, data.ay+300, color
                                                    , data.bx, data.by+300, color
                                                    , data.cx, data.cy+300, color ) );
         }
         peoteView.addDisplay( triangleDisplay );
    }

    public
    function birdSVG( pen2D: Pen2D ){
        var sketcher = new Sketcher( pen2D, StyleSketch.Fine, StyleEndLine.both );
        sketcher.width = 2;
        var scaleTranslateContext = new ScaleTranslateContext( sketcher, 20, 0, 1, 1 );
        var p = new SvgPath( scaleTranslateContext );
        p.parse( kiwi_d );
    }

    public function textureUsage( display: Display ){
        var buffer    = new Buffer<PeoteBasicElement>( 10 );//var buffer = new Buffer<Elem>(4, 4, true);
        var program   = new Program( buffer );
        var pixelImage = createPixelImage();
        var texture = new Texture( pixelImage.width, pixelImage.height, 2 );
        texture.setData( pixelImage.peoteTextureData.to(), 0 );
        texture.setData( pixelImage.transform.flipY().peoteTextureData.to(), 1 );
        var wid = pixelImage.width;
        var hi  = pixelImage.height;
        var element1 = new PeoteBasicElement(0, 0, wid, hi, 0 );
        buffer.addElement( element1 );
        //buffer.updateElement( element1 );
        var element2 = new PeoteBasicElement(800, 0, wid, hi, 1 );
        buffer.addElement( element2 );
        //buffer.updateElement( element2 );
        program.setTexture( texture, "justGraphix_image" );
        display.addProgram( program );
    }
    public function createPixelImage(): Pixelimage {
        var pixelImage = new Pixelimage( 800, 600 );
        pixelImage.transparent = true;
        pixelImage.simpleRect( 0, 0, pixelImage.width, pixelImage.height, 0xffc9c3c3 );
        pixelImage.transparent = true;
        var scale       = 10;
        var pixelTest = new Pixelimage( 80*scale, 80*scale );
        pixelTest.transparent = true;
        var colors = QuickARGB.rainbow();
        var vertColor = colors[0]; 
        for( x in 0...70*scale ){
            vertColor = colors[ Math.floor( (x/scale) / 10 ) ];
            for( y in 0...768-70-45 ) pixelTest.setARGB( x, y, vertColor );
        }
        pixelTest.gradientShape.triangle( 100, 100, 0xf0ffcf00, 300, 220, 0xf000cfFF, 120, 300, 0xf0cF00FF );
        pixelTest.gradientShape.triangle( 100+120, 100+20, 0xccff0000, 300+120, 220+20, 0xcc0000FF, 120+120, 300+20, 0xcc00ff00 );
        pixelTest.lineShape.svgPath( kiwi_d, .7, 0xF0cccccc, 0., 0., 1., 1. );
        pixelImage.putPixelImage( pixelTest, 45, 45 );
        return pixelImage;
    }
    override function onPreloadComplete():Void {}
    override function update(deltaTime:Int):Void {}
} 
