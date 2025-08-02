package justGraphix.path;

import justGraphix.path.SvgLinePath;
import justGraphix.path.GraphicsPath;
import justGraphix.path.PathCommand;
import justGraphix.path.IPathContext;
import haxe.ds.Vector;
import justGraphix.path.ILinePathContext;
import justGraphix.path.LinePathContextTrace;
import justGraphix.path.SvgLinePath;
import justGraphix.path.ILinePathContext;
import justGraphix.path.LinePathContextTrace;

abstract class DrawAbstractHelper implements ILinePathContext implements IPathContext {
    var svgLinePath: SvgLinePath;
    var x0: Float = 0.;
    var y0: Float = 0.;
    var toggleDraw = true;
    public function new(){}
    public
    function moveTo( x1: Float, y1: Float ){
        x0 = x1;
        y0 = y1;
        toggleDraw = true;
    }
    public
    function quadTo( x2: Float, y2: Float, x3: Float, y3: Float ){
        svgLinePath.quadTo( x2, y2, x3, y3 );
    }
    public
    function curveTo( x2: Float, y2: Float, x3: Float, y3: Float, x4: Float, y4: Float ){
        svgLinePath.curveTo( x2, y2, x3, y3, x4, y4 );
    }
    public
    function quadThru( x2: Float, y2: Float, x3: Float, y3: Float ){
        svgLinePath.quadThru( x2, y2, x3, y3 );
    }
    public inline
    function archBezier( distance: Float, distance2: Float, radius: Float, rotation: Float ){            
        var nx = x0 + distance*Math.cos( rotation );
        var ny = y0 + distance*Math.sin( rotation );
        var thruX = x0 + distance2*Math.cos( rotation ) - radius*Math.cos( rotation + Math.PI/2 );
        var thruY = y0 + distance2*Math.sin( rotation ) - radius*Math.sin( rotation + Math.PI/2 );
        svgLinePath.quadThru( thruX, thruY, nx, ny );
    }
    public inline
    function triangleArch( distance: Float, distance2: Float, radius: Float, rotation: Float ){
        var nx = x0 + distance*Math.cos( rotation );
        var ny = y0 + distance*Math.sin( rotation );
        var thruX = x0 + distance2*Math.cos( rotation ) - radius*Math.cos( rotation + Math.PI/2 );
        var thruY = y0 + distance2*Math.sin( rotation ) - radius*Math.sin( rotation + Math.PI/2 );
        svgLinePath.lineTo( thruX, thruY );
        svgLinePath.lineTo( nx, ny );
    }
    public inline
    function path( str: String ){
        svgLinePath.parse( str );
    }
    public inline 
    function drawPath( commands: Vector<PathCommand>, data: Vector<Float> ){
        var graphicPath = new GraphicsPath( commands, data );
        drawGraphicsPath( graphicPath );
    }
    public inline
    function drawGraphicsPath( graphicsPath: GraphicsPath ){
        graphicsPath.parse( this );
    }
}