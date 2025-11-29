package justGraphix.example.contour;

import justGraphix.contour.io.Float32Array;

// contour code
import justGraphix.contour.Sketcher;
import justGraphix.contour.Pen2D;
import justGraphix.contour.StyleSketch;
import justGraphix.contour.StyleEndLine;
// SVG path parser
import justGraphix.path.*;
import justGraphix.path.ScaleContext;
import justGraphix.path.ScaleTranslateContext;
import justGraphix.path.TranslationContext;
import justGraphix.example.contour.SvgTests;
import justGraphix.target._gl.Renderer;
// webgl gl stuff
import justGraphix.target._gl.GL;

// html stuff
import justGraphix.target._canvas.Sheet;
import justGraphix.target._canvas.DivertTrace;

// js webgl 
import js.html.webgl.RenderingContext;


function main(){
    new BasicGL();
}

class BasicGL {
    // cornerContour specific code
    var sketcher:       Sketcher;
    var pen2D:          Pen2D;
    
    // WebGL/Html specific code
    public var gl:               RenderingContext;
    var renderer:                Renderer;

    // general
    public var width:            Int;
    public var height:           Int;
    public var mainSheet:        Sheet;
    var divertTrace:             DivertTrace;

    public function new(){
        divertTrace = new DivertTrace();
        trace('Contour Test');
        width = 1024;
        height = 768;

        // draw contours to triangles
        pen2D = new Pen2D( 0xFF0000FF );
        var s = Std.int( pen2D.pos );
        arcSvg(pen2D);
        pen2D.currentColor = 0xff0000FF;
        kiwiSvg(pen2D);
        cubicSvg(pen2D);
        quadSvg(pen2D);
        var e = Std.int( pen2D.pos - 1 );

        // render required triangles to webgl
        mainSheet = new Sheet();
        mainSheet.create( width, height, true );
        gl = mainSheet.gl;
        renderer = { gl:     gl
                   , pen:    pen2D
                   , width:  width
                   , height: height };
        renderer.simpleRenderRange( s...e );
    }
}