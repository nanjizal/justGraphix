package justGraphix.example.polygon;

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
    new Banana();
}

var vertices = [[132.84375, 99.5], [115.71875, 183.78125], [45.71875, 258.0625], [34.28125, 372.375], [60.0, 496.65625], [148.5625, 612.375], [308.5625, 653.78125], [432.84375, 613.78125], [505.71875, 525.21875], [480.0, 489.5], [315.71875, 459.5], [251.4375, 410.9375], [241.4375, 312.375], [215.71875, 225.21875], [177.15625, 189.5], [222.84375, 123.78125]];
class Banana {
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
        trace('Banana Test');
        width = 1024;
        height = 768;

        // draw contours to triangles
        pen2D = new Pen2D( 0xFF9DE970 );
        var s = Std.int( pen2D.pos );
        pen2D.currentColor = 0xfff2e747;
        var sketcher = new Sketcher( pen2D, StyleSketch.Fine, StyleEndLine.no);
        sketcher.width = 20;
        sketcher.moveTo( vertices[0][0]/2,vertices[0][1]/2);
        for(v in vertices ){
            sketcher.lineTo( v[0]/2, v[1]/2 );
        }
        sketcher.lineTo( vertices[0][0]/2,vertices[0][1]/2 );
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