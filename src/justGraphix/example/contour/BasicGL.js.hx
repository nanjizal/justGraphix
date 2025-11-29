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
// webgl gl stuff
import justGraphix.target._gl.ShaderColor2D;
import justGraphix.target._gl.BufferGL;
import justGraphix.target._gl.GL;

// html stuff
import justGraphix.target._canvas.Sheet;
import justGraphix.target._canvas.DivertTrace;

// js webgl 
import js.html.webgl.Buffer;
import js.html.webgl.RenderingContext;
import js.html.webgl.Program;
import js.html.webgl.Texture;

function main(){
    new BasicGL();
}

class BasicGL {
    // cornerContour specific code
    var sketcher:       Sketcher;
    var pen2D:          Pen2D;
    
    // WebGL/Html specific code
    public var gl:               RenderingContext;
        // general inputs
    final vertexPosition         = 'vertexPosition';
    final vertexColor            = 'vertexColor';

    // general
    public var width:            Int;
    public var height:           Int;
    public var mainSheet:        Sheet;

    // Color
    public var programColor:     Program;
    public var bufColor:         Buffer;
    var divertTrace:             DivertTrace;
    var arr32:                   Float32Array;
    var len:                     Int;
    var totalTriangles:          Int;
    var bufferLength:            Int;
    public function new(){
        divertTrace = new DivertTrace();
        trace('Contour Test');
        width = 1024;
        height = 768;
        // use Pen to draw to Array
        drawContours();
        rearrageDrawData();
        renderOnce();
    }
    
    public
    function rearrageDrawData(){
        trace( 'rearrangeDrawData' );
        var pen = pen2D;
        var data = pen.arr;
        var red    = 0.;   
        var green  = 0.;
        var blue   = 0.; 
        var alpha  = 0.;
        var color: Int  = 0;
        // triangle length
        totalTriangles = Std.int( data.size/7 );
        bufferLength = totalTriangles*3;
         // xy rgba = 6
        len = Std.int( totalTriangles * 6 * 3 );
        var j = 0;
        arr32 = new Float32Array( len );
        for( i in 0...totalTriangles ){
            pen.pos = i;
            color = Std.int( data.color );
            alpha = alphaChannel( color );
            red   = redChannel(   color );
            green = greenChannel( color );
            blue  = blueChannel(  color );
            // populate arr32.
            arr32[ j ] = gx( data.ax );
            j++;
            arr32[ j ] = gy( data.ay );
            j++;
            arr32[ j ] = red;
            j++;
            arr32[ j ] = green;
            j++;
            arr32[ j ] = blue;
            j++;
            arr32[ j ] = alpha;
            j++;
            arr32[ j ] = gx( data.bx );
            j++;
            arr32[ j ] = gy( data.by );
            j++;
            arr32[ j ] = red;
            j++;
            arr32[ j ] = green;
            j++;
            arr32[ j ] = blue;
            j++;
            arr32[ j ] = alpha;
            j++;
            arr32[ j ] = gx( data.cx );
            j++;
            arr32[ j ] = gy( data.cy );
            j++;
            arr32[ j ] = red;
            j++;
            arr32[ j ] = green;
            j++;
            arr32[ j ] = blue;
            j++;
            arr32[ j ] = alpha;
            j++;
        }
    }
    public
    function drawContours(){
        trace( 'drawContours' );
        pen2D = new Pen2D( 0xFF0000FF );
        arcSvg(pen2D);
        pen2D.currentColor = 0xff0000FF;
        kiwiSvg(pen2D);
        cubicSvg(pen2D);
        quadSvg(pen2D);
    }
    public
    function renderOnce(){
        trace( 'renderOnce' );
        mainSheet = new Sheet();
        mainSheet.create( width, height, true );
        gl = mainSheet.gl;
        clearAll( gl, width, height, 0., 0., 0., 1. );
        programColor = programSetup( gl, vertexString, fragmentString );
        gl.bindBuffer( GL.ARRAY_BUFFER, null );
        gl.useProgram( programColor );
        bufColor = interleaveXY_RGBA( gl
                       , programColor
                       , arr32
                       , vertexPosition, vertexColor, true );
        gl.bindBuffer( GL.ARRAY_BUFFER, bufColor );
        gl.useProgram( programColor );
        gl.drawArrays( GL.TRIANGLES, 0, bufferLength );
        
    }
    public static inline
    function alphaChannel( int: Int ) : Float
        return ((int >> 24) & 255) / 255;
    public static inline
    function redChannel( int: Int ) : Float
        return ((int >> 16) & 255) / 255;
    public static inline
    function greenChannel( int: Int ) : Float
        return ((int >> 8) & 255) / 255;
    public static inline
    function blueChannel( int: Int ) : Float
        return (int & 255) / 255;
    public inline
    function gx( v: Float ): Float {
        return -( 1 - 2*v/width );
    }
    public inline
    function gy( v: Float ): Float {
        return ( 1 - 2*v/height );
    }
}