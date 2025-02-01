package justGraphix.target.openflTarget_;
// Based on work by Half - James O B Fisher, rearranged to suit this project style.
import peote.view.*;
import peote.view.PeoteView;
import peote.view.Buffer;
import peote.view.Display;
import peote.view.Program;
import peote.view.Color;
import peote.view.*;
import peote.view.TextureFormat;
import peote.view.intern.BufferBytes;
import peote.view.PeoteGL.Version;
import peote.view.intern.UniformBufferView;
import peote.view.intern.UniformBufferDisplay;

import lime.graphics.opengl.GLBuffer;
import lime.graphics.opengl.GLShader;
import lime.graphics.opengl.GLVertexArrayObject;

import justGraphix.contour.Pen2D;
import justGraphix.contour.Pen2DGrad; // not yet used
import justGraphix.contour.IPen;
import justGraphix.contour3D.drawing.Pen; // may need consideration

enum abstract GRADIENT( Bool ) from Bool to Bool {
    var NO = false;
    var YES = true;
}

@:access(peote.view)
class PeoteColorDisplayES2 extends Display {
    public static var wide: Int;
    public static var hi:   Int;
    private var pen:             Pen2D;
    private var gradient:        GRADIENT;
    private var program:         Program;
    private var vertex_shader:   GLShader;
    private var fragment_shader: GLShader;
    private var vertexBytes:     BufferBytes;
    final vertexColor2D = '#version 300 es
                layout (location = 0) in vec2 aPos;
                layout (location = 1) in vec4 aColor;
                out vec4 vertexColor; 
                void main(){
                    gl_Position = vec4(aPos, 0.0, 1.0);
                    vertexColor = aColor;
                }';
    final fragmentColor2D = '#version 300 es
                precision mediump float;
                in vec4 vertexColor;
                out vec4 FragColor;
                void main(){
                    FragColor = vertexColor;
                }';
    public
    function new( x: Int, y: Int, width: Int, height: Int, pen: Pen2D, gradient = GRADIENT.NO ){
        this.pen = pen;
        
        // Not ideal subject to change
        wide = width;
        hi   = height;

        this.gradient = gradient;
        super( x, y, width, height, 0x00000000 );
    }

    private function createShaders(){
        vertex_shader = gl.createShader( gl.VERTEX_SHADER );
        gl.shaderSource( vertex_shader, vertexColor2D );
        gl.attachShader( program, vertex_shader );
        gl.compileShader( vertex_shader );
        if( gl.getShaderParameter( vertex_shader, gl.COMPILE_STATUS ) == 0 ) throw( gl.getShaderInfoLog( vertex_shader ) );

        fragment_shader = gl.createShader( gl.FRAGMENT_SHADER );
        gl.shaderSource( fragment_shader, fragmentColor2D );
        gl.attachShader( program, fragment_shader );
        gl.compileShader(fragment_shader);
        if( gl.getShaderParameter( fragment_shader, gl.COMPILE_STATUS ) == 0 ) throw( gl.getShaderInfoLog( fragment_shader ) );
        
        gl.linkProgram( program );
        gl.useProgram(  program );
        if( gl.getProgramParameter( program, gl.LINK_STATUS ) == 0 ){
            var log = gl.getProgramInfoLog( program );
            log += "\nVALIDATE_STATUS: " + gl.getProgramParameter( program, gl.VALIDATE_STATUS );
            log += "\nERROR: " + gl.getError();
            throw( log );
        }
    }
    // Currently unused..
    public
    function deleteShaders( ){
        gl.deleteShader(vertex_shader);
        gl.deleteShader(fragment_shader);
    }
    private function uploadDataAssignAttributes(){
        rearrageDrawData();
		var vbo: GLBuffer = gl.createBuffer();
		var vao: GLVertexArrayObject = gl.createVertexArray();
		gl.bindVertexArray(vao);
		gl.bindBuffer( gl.ARRAY_BUFFER, vbo );
		gl.bufferData( gl.ARRAY_BUFFER, vertexBytes.length, new peote.view.intern.GLBufferPointer( vertexBytes ), gl.STATIC_DRAW );
		var FLOAT = 4;
        var VERTEX_STRIDE = 6;
        var stride = FLOAT * VERTEX_STRIDE;
        if( !Version.isVAO ){
			gl.bindAttribLocation( program, 0, "try" );
			gl.vertexAttribPointer( 0, 2, gl.FLOAT, false, stride, 0 );
			gl.enableVertexAttribArray( 0 );
			gl.vertexAttribPointer( 1, 4, gl.FLOAT, false, stride, 2 * FLOAT );
			gl.enableVertexAttribArray( 1 );
		}
    }
    public
    function rearrageDrawData(){
        var data = pen.arr;
        var red    = 0.;   
        var green  = 0.;
        var blue   = 0.; 
        var alpha  = 0.;
        var color: Int  = 0;
        var totalTriangles = ((gradient:Bool))? Std.int( data.size/9 ): Std.int( data.size/7 );
        var bufferLength = totalTriangles*3;
        var len = Std.int( totalTriangles * 6 * 3 );
        var j = 0;
        var FLOAT = 4;
        var VERTEX_STRIDE = 6;
        var stride = FLOAT * VERTEX_STRIDE;
        vertexBytes = BufferBytes.alloc(stride * totalTriangles);
        for( i in 0...totalTriangles ){
            pen.pos = i;
            if( !(gradient:Bool) ) {
                color = Std.int( data.color );
            } else {
                // gradient to implement for this target.
            }
            alpha = alphaChannel( color );
            red   = redChannel(   color );
            green = greenChannel( color );
            blue  = blueChannel(  color );
            // populate 
            vertexBytes.setFloat( j, gx( data.ax ) );
            j += FLOAT;
            vertexBytes.setFloat( j, gy( data.ay ) );
            j += FLOAT;
            vertexBytes.setFloat( j, red );
            j += FLOAT;
            vertexBytes.setFloat( j, green );
            j += FLOAT;
            vertexBytes.setFloat( j, blue );
            j += FLOAT;
            vertexBytes.setFloat( j, alpha );
            j += FLOAT;
            vertexBytes.setFloat( j, gx( data.bx ) );
            j += FLOAT;
            vertexBytes.setFloat( j, gy( data.by ) );
            j += FLOAT;
            vertexBytes.setFloat( j, red );
            j += FLOAT;
            vertexBytes.setFloat( j, green );
            j += FLOAT;
            vertexBytes.setFloat( j, blue );
            j += FLOAT;
            vertexBytes.setFloat( j, alpha );
            j += FLOAT;
            vertexBytes.setFloat( j, gx( data.cx ) );
            j += FLOAT;
            vertexBytes.setFloat( j, gy( data.cy ) );
            j += FLOAT;
            vertexBytes.setFloat( j, red );
            j += FLOAT;
            vertexBytes.setFloat( j, green );
            j += FLOAT;
            vertexBytes.setFloat( j, blue );
            j += FLOAT;
            vertexBytes.setFloat( j, alpha );
            j += FLOAT;
        }
    }
    private
    function tidyAfter(){
        if( !Version.isINSTANCED ) gl.disableVertexAttribArray( 0 );
        gl.bindBuffer (gl.ARRAY_BUFFER, null);		
        gl.useProgram (null);
    }
    #if peoteview_customdisplay // needs compiler condition to enable override
    override private
    function renderProgram( peoteView: PeoteView ): Void {
        program = gl.createProgram();
        createShaders();
        uploadDataAssignAttributes();
        if( !Version.isINSTANCED ) gl.disableVertexAttribArray( 0 );
        tidyAfter();
    }
    // if Display is rendered into texture this is called instead:	
    // override private function renderFramebufferProgram(peoteView:PeoteView):Void {}	

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
        return -( 1 - 2*v/wide );
    }
    public inline
    function gy( v: Float ): Float {
        return ( 1 - 2*v/hi );
    }
}