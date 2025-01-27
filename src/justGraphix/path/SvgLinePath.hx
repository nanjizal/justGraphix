package justGraphix.path;
import justGraphix.path.StoreF8;
import justGraphix.path.StoreF6;
import justGraphix.curve.EllipseArc;
import justGraphix.curve.CurveMath;
import justGraphix.path.ILinePathContext;
class SvgLinePath{
    var str = '';
    var pos = 0;
    var lastX = 0.;
    var lastY = 0.;
    var controlX = 0.;
    var controlY = 0.;
    var c = 0;
    var l = 0;
    var px = 0.;
    var py = 0.;
    var pathContext: ILinePathContext;
    var store:       StoreF6;
    public function new( pathContext_: ILinePathContext ){
        pathContext = pathContext_;
    }
    function quickTriangle( x0: Float, y0: Float, off: Float ){ // only used for visual debug ie: Ellipse Arc.
        pathContext.moveTo( x0, y0 - off );
        pathContext.lineTo( x0 + off, y0 + off );
        pathContext.lineTo( x0 - off, y0 + off );
        pathContext.lineTo( x0, y0 - off );
    }
    // currently not much protection against malformed, or unusual path data.
    public function parse( str_: String ): String {
        str = str_;
        pos = 0;
        l = str.length;
        c = nextChar();
        var count = 0;
        store = new StoreF6();
        while( pos < l ){
            switch( c ){
                case 'M'.code:
                    extractArgs();
                    if( store.length() == 2 ){ // usual case 
                        lastX = store.s0;
                        lastY = store.s1;
                        moveTo( lastX, lastY );
                    } else if( store.length() > 2 ){ // when multiple moves ... these are actually lineTo, weird!
                            lastX = store.shift();
                            lastY = store.shift();
                            moveTo( lastX, lastY );
                        while( store.length() > 1 ) { 
                            lastX = store.shift();
                            lastY = store.shift();
                            lineTo( lastX, lastY );
                        }
                    } // when second parameter missing!
                case 'm'.code:
                    extractArgs();
                    if( store.length() == 2 ){ // usual case
                        lastX = store.s0 + lastX;
                        lastY = store.s1 + lastY;
                        pathContext.moveTo( lastX, lastY );
                    } else if( store.length() > 2 ){
                            lastX = store.shift() + lastX;
                            lastY = store.shift() + lastY;
                            pathContext.moveTo( lastX, lastY );
                        while( store.length() > 1 ){
                            lastX = store.shift() + lastX;
                            lastY = store.shift() + lastY;
                            pathContext.lineTo( lastX, lastY );
                        }
                    } // when second parameter missing!
                case 'L'.code:
                    extractArgs();
                    if( store.length() == 2 ){
                        lastX = store.s0;
                        lastY = store.s1;
                        lineTo( lastX, lastY );
                    } else if( store.length() > 2 ){
                        while( store.length() > 1 ){
                            lastX = store.shift();
                            lastY = store.shift();
                            lineTo( lastX, lastY );
                        }
                    }
                case 'l'.code:
                    extractArgs();
                    if( store.length() == 2 ){
                        lastX = store.s0 + lastX;
                        lastY = store.s1 + lastY;
                        pathContext.lineTo( lastX, lastY );
                    } else if( store.length() > 2 ){
                        while( store.length() > 2 ){
                            lastX = store.shift() + lastX;
                            lastY = store.shift() + lastY;
                            pathContext.lineTo( lastX, lastY );
                        }
                    }
                case 'H'.code:
                    extractArgs( false );
                    if( store.length() == 1 ){
                        lastX = store.s0;
                        lineTo( lastX, lastY );
                    } else if( store.length() > 1 ){
                        while( store.length() > 0 ){
                            lastX = store.shift();
                            lineTo( lastX, lastY );
                        }
                    }
                case 'h'.code:
                    extractArgs( false );
                    if( store.length() == 1 ){
                        lastX = lastX + store.s0;
                        pathContext.lineTo( lastX, lastY );
                    } else if( store.length() > 1 ){
                        while( store.length() > 0 ){
                            lastX = lastX + store.shift();
                            lineTo( lastX, lastY );
                        }
                    }
                case 'V'.code:
                    extractArgs( false );
                    if( store.length() == 1 ){
                        lastY = store.shift();
                        lineTo( lastX, lastY );
                    } else if( store.length() > 1 ){
                        while( store.length() > 0 ){
                            lastY = store.shift();
                            lineTo( lastX, lastY );
                        }
                    }
                case 'v'.code:
                    extractArgs( false );
                    if( store.length() == 1 ){
                        lastY = lastY + store.s0;
                        lineTo( lastX, lastY );
                    } else if( store.length() > 1 ){
                        while( store.length() > 0 ){
                            lastY = lastY + store.shift();
                            lineTo( lastX, lastY );
                        }
                    }
                case 'C'.code:
                    extractArgs();
                    if( store.length() == 4 ){
                        controlX = store.s2;
                        controlY = store.s3;
                        lastX = store.s4;
                        lastY = store.s5;
                        curveTo( store.s0, store.s1
                            ,   controlX, controlY
                            ,   lastX, lastY );
                    } else if( store.length() > 4 ){
                        while( store.length() > 3 ){
                            var firstX = store.shift();
                            var firstY = store.shift();
                            controlX = store.shift();
                            controlY = store.shift();
                            lastX = store.shift();
                            lastY = store.shift();
                            curveTo( firstX, firstY, controlX, controlY, lastX, lastY );
                        }
                    }
                case 'c'.code:
                    extractArgs();
                    if( store.length() == 4 ){
                        var firstX = store.s0 + lastX;
                        var firstY = store.s1 + lastY;
                        controlX = store.s2 + lastX;
                        controlY = store.s3 + lastY;
                        lastX = store.s4 + lastX;
                        lastY = store.s5 + lastY;
                        curveTo( firstX, firstY, controlX, controlY, lastX, lastY );
                    } else if( store.length() > 4 ){
                        while( store.length() > 3 ){
                            var firstX = store.shift() + lastX;
                            var firstY = store.shift() + lastY;
                            controlX = store.shift() + lastX;
                            controlY = store.shift() + lastY;
                            lastX = store.shift() + lastX;
                            lastY = store.shift() + lastY;
                            curveTo( firstX, firstY, controlX, controlY, lastX, lastY );
                        }
                    }
                case 'S'.code:
                    // TODO: add code for cases when no last control
                    extractArgs();
                    // calculate reflection of previous control points
                    if( store.length() == 4 ){
                        var firstX = store.s0;
                        var firstY = store.s1;
                        controlX = 2*lastX - controlX;
                        controlY = 2*lastY - controlY;
                        var endX = store.s2;
                        var endY = store.s3;
                        curveTo( controlX, controlY, firstX, firstY, endX, endY );
                        controlX = store.s0;
                        controlY = store.s1;
                        lastX = endX;  // not there but I think it neest to be?
                        lastY = endY;
                    } else if( store.length() > 4 ){
                        while( store.length() > 3 ){
                            var firstX = store.shift();
                            var firstY = store.shift();
                            controlX = 2*lastX - controlX;
                            controlY = 2*lastY - controlY;
                            lastX = store.shift();
                            lastY = store.shift();
                            curveTo( controlX, controlY, firstX, firstY, lastX, lastY );
                            controlX = firstX;
                            controlY = firstY;
                        }
                    }
                case 's'.code:
                    // TODO: add code for cases when no last control
                    extractArgs();
                    // calculate reflection of previous control points
                    if( store.length() == 4 ){
                        var firstX = store.s0 + lastX;
                        var firstY = store.s1 + lastY;
                        controlX = 2*lastX - controlX;
                        controlY = 2*lastY - controlY;
                        lastX = store.s2 + lastX;
                        lastY = store.s3 + lastY;
                        curveTo( controlX, controlY, firstX, firstY, lastX, lastY );
                        controlX = firstX;
                        controlY = firstY;
                    } else if( store.length() > 4 ){
                        while( store.length() > 3 ){
                            var firstX = store.shift() + lastX;
                            var firstY = store.shift() + lastY;
                            controlX = 2*lastX - controlX;
                            controlY = 2*lastY - controlY;
                            lastX = store.shift() + lastX;
                            lastY = store.shift() + lastY;
                            curveTo( controlX, controlY, firstX, firstY, lastX, lastY );
                            controlX = firstX;
                            controlY = firstY;
                        }
                    }
                case 'Q'.code:
                    extractArgs();
                    if( store.length() == 4 ) {
                        controlX = store.s0;
                        controlY = store.s1;
                        lastX = store.s2;
                        lastY = store.s3;
                        quadTo( controlX, controlY
                                    ,   lastX, lastY );
                    } else if( store.length() > 4 ){
                        while( store.length() > 3 ){
                            controlX = store.shift();
                            controlY = store.shift();
                            lastX = store.shift();
                            lastY = store.shift();
                            quadTo( controlX, controlY, lastX, lastY );
                        }
                    }
                case 'q'.code:
                    extractArgs();
                    if( store.length() == 4 ){
                        controlX = lastX + store.s0;
                        controlY = lastY + store.s1;
                        lastX = store.s0 + lastX;
                        lastY = store.s1 + lastY;
                        quadTo( controlX, controlY, lastX, lastY );
                    } else if( store.length() > 4 ){
                        while( store.length() > 3 ){
                            controlX = lastX + store.shift();
                            controlY = lastY + store.shift();
                            lastX = store.shift() + lastX;
                            lastY = store.shift() + lastY;
                            quadTo( controlX, controlY, lastX, lastY );
                        }
                    }
                case 'T'.code:
                // TODO: add code for cases when no last control
                    extractArgs();
                    // calculate reflection of previous control points
                    if( store.length() == 2 ){
                        controlX = 2*lastX  - controlX;
                        controlY = 2*lastY - controlY;
                        lastX = store.s0;   
                        lastY = store.s1;
                        quadTo( controlX, controlY, lastX, lastY );
                    } else if( store.length() > 2 ){
                        while( store.length() > 1 ){
                            controlX = 2*lastX  - controlX;
                            controlY = 2*lastY - controlY;
                            lastX = store.shift();   
                            lastY = store.shift();
                            quadTo( controlX, controlY, lastX, lastY );
                        }
                    }
                case 't'.code:
                // TODO: add code for cases when no last control
                    extractArgs();
                    // calculate reflection of previous control points
                    if( store.length() == 2 ){
                        controlX = 2*lastX - controlX;
                        controlY = 2*lastY - controlY;
                        lastX = store.s0 + lastY;
                        lastY = store.s1 + lastX;
                        quadTo( controlX, controlY, lastX, lastY );
                    } else if( store.length() > 2 ){
                        while( store.length() > 1 ){
                            controlX = 2*lastX - controlX;
                            controlY = 2*lastY - controlY;
                            lastX = store.shift() + lastY;
                            lastY = store.shift() + lastX;
                            quadTo( controlX, controlY, lastX, lastY );
                        }
                    }
                case 'A'.code:
                    extractArgs();
                    if( store.length() == 7 ){
                        var sx      = lastX;
                        var sy      = lastY;
                        var xr      = store.shift();
                        var yr      = store.shift();
                        var phi     = store.shift();
                        var large   = Std.int( store.shift() );
                        var sweep   = Std.int( store.shift() );
                        lastX       = store.shift();
                        lastY       = store.shift();
                        var ellipseData: EllipseArcData = new ConverterArc( sx, sy, xr, yr, phi, large, sweep, lastX, lastY );
                        var ellipse  = new EllipseArc( ellipseData );
                        ellipse.lineRender( pathContext.moveTo, pathContext.lineTo, Math.PI/18 );
                    } else if( store.length() > 7 ){
                        while( store.length() > 6 ){
                            var sx      = lastX;
                            var sy      = lastY;
                            var xr      = store.shift();
                            var yr      = store.shift();
                            var phi     = store.shift();
                            var large   = Std.int( store.shift() );
                            var sweep   = Std.int( store.shift() );
                            lastX       = store.shift();
                            lastY       = store.shift();
                            var ellipseData: EllipseArcData = new ConverterArc( sx, sy, xr, yr, phi, large, sweep, lastX, lastY );
                            var ellipse  = new EllipseArc( ellipseData );
                            ellipse.lineRender( pathContext.moveTo, pathContext.lineTo, Math.PI/18 );
                        }
                    }
                case 'a'.code:
                extractArgs();
                if( store.length() == 7 ){
                    var sx      = lastX;
                    var sy      = lastY;
                    var xr      = store.shift();
                    var yr      = store.shift();
                    var phi     = store.shift();
                    var large   = Std.int( store.shift() );
                    var sweep   = Std.int( store.shift() );
                    lastX       = store.shift() + lastX;
                    lastY       = store.shift() + lastY;
                    var ellipseData: EllipseArcData = new ConverterArc( sx, sy, xr, yr, phi, large, sweep, lastX, lastY );
                    var ellipse  = new EllipseArc( ellipseData );
                    ellipse.lineRender( pathContext.moveTo, pathContext.lineTo, Math.PI/18 );
                } else if( store.length() > 7 ){
                    while( store.length() > 6 ){
                        var sx      = lastX;
                        var sy      = lastY;
                        var xr      = store.shift();
                        var yr      = store.shift();
                        var phi     = store.shift();
                        var large   = Std.int( store.shift() );
                        var sweep   = Std.int( store.shift() );
                        lastX       = store.shift() + lastX;
                        lastY       = store.shift() + lastY;
                        var ellipseData: EllipseArcData = new ConverterArc( sx, sy, xr, yr, phi, large, sweep, lastX, lastY );
                        var ellipse  = new EllipseArc( ellipseData );
                        ellipse.lineRender( pathContext.moveTo, pathContext.lineTo, Math.PI/18 );
                    }
                }
                case 'Z'.code, 'z'.code: 
                    lastX = 0;
                    lastY = 0;
                    //trace( 'closepath' );
                    //break;
                case 'B'.code:
                    trace( 'bearing - not implemented' );
                    throw( 'bearing not supported please remove' );
                default:
                    count++;
            }
            c = nextChar();
        }
        return str_;
    }
    
    // Extract the args
    // Assumes all values are float
    // new lines not yet implemented
    // scientifc numbers not implemented yet
    inline function extractArgs( ?process: Bool = true ) {
        store.clear();
        //pos++;
        c = nextChar();
        var count = 0;
        var temp: String = '';
        var exit = false;
        while( true ) {
            switch( c ) {
                case '-'.code:
                    if( temp != '' ){
                        //if( temp == '0' ) temp = '0.1';
                        if( process ){
                            if( ( store.length() & 1) == 0 ) { // x 
                                store.push( Std.parseFloat( temp ) );
                            } else { // y
                                store.push( Std.parseFloat( temp ) );
                            }
                        } else {
                            store.push( Std.parseFloat( temp ) );
                        }
                    }
                    temp = '-';
                case '.'.code:
                    temp = temp + '.';
                case '0'.code:
                    temp = temp + '0';
                case '1'.code:
                    temp = temp + '1';
                case '2'.code:
                    temp = temp + '2';
                case '3'.code:
                    temp = temp + '3';
                case '4'.code:
                    temp = temp + '4';
                case '5'.code:
                    temp = temp + '5';
                case '6'.code:
                    temp = temp + '6';
                case '7'.code:
                    temp = temp + '7';
                case '8'.code:
                    temp = temp + '8';
                case '9'.code:
                    temp = temp + '9';
                case ' '.code,','.code:
                    if( temp != '' ){
                        //if( temp == '0' ) temp = '0.1';
                        if( process ){
                            if( ( store.length() & 1) == 0 ) { // x 
                                store.push( Std.parseFloat( temp ) );
                            } else { // y
                                store.push( Std.parseFloat( temp ) );
                            }
                        } else { // for special cases V,v,H,h where only one var is stored.
                            store.push( Std.parseFloat( temp ) );
                        }
                        temp = '';
                    }
                default:
                    if( temp != '' ){
                        //if( temp == '0' ) temp = '0.1';
                        if( process ){
                            if( ( store.length() & 1) == 0 ) { // x 
                                store.push( Std.parseFloat( temp ) );
                            } else { // y
                                store.push( Std.parseFloat( temp ) );
                            }
                        } else { // for special cases V,v,H,h where only one var is stored.
                            store.push( Std.parseFloat( temp ) );
                        }
                        temp = '';
                    }
                    // Useful for debug:
                    //trace(' default ' + store.populatedToString() );
                    pos--;
                    exit = true; // break; here causes a throw in older haxe which is not ideal.
            }
            if( exit ) break;
            c = nextChar();
        }
    }
    inline function nextChar() {
        return StringTools.fastCodeAt( str, pos++ );
    }
    public inline
    function moveTo( x_: Float, y_: Float ): Void {
        px = x_;
        py = y_;
        pathContext.moveTo( x_, y_ );
    }
    public inline
    function lineTo( x_: Float, y_: Float ): Void {
        pathContext.lineTo( x_,y_);
        px = x_;
        py = y_;
    }
    // x1,y1 is a point on the curve rather than the control point, taken from my divtatic project.
    public inline
    function quadThru( x1: Float, y1: Float, x2: Float, y2: Float ): Void {
        var newx = 2*x1 - 0.5*( px + x2 );
        var newy = 2*y1 - 0.5*( py + y2 );
        return quadTo( newx, newy, x2, y2 );
    }
    public inline
    function quadTo( x1: Float, y1: Float, x2: Float, y2: Float ): Void {
        var tempArr = [];
        quadCurve( tempArr, px, py, x1, y1, x2, y2 );
        plotSegmentCoord( tempArr, false );
        tempArr = [];
        px = x2;
        py = y2;
    }
    public inline
    function curveTo( x1: Float, y1: Float, x2: Float, y2: Float, x3: Float, y3: Float ): Void {
        var tempArr = [];
        cubicCurve( tempArr, px, py, x1, y1, x2, y2, x3, y3 );
        plotSegmentCoord( tempArr, false );
        tempArr = [];
        px = x3;
        py = y3;
    }
    public inline
    function plotSegmentCoord( arr: Array<Float>, ?withMove: Bool = true ): Void {
        var l = arr.length;
        var i = 2;
        if( withMove ){ // normally when just plotting points you will do it withMove but from a curve not.
            pathContext.moveTo( arr[ 0 ], arr[ 1 ] );
        } else {
            pathContext.lineSegmentTo( arr[ 0 ], arr[ 1 ] );
        }
        while( i < l ){
            pathContext.lineSegmentTo( arr[ i ], arr[ i + 1 ] );
            i += 2;
        }
    }   
    public inline
    function plotCoord( arr: Array<Float>, ?withMove: Bool = true ): Void {
        var l = arr.length;
        var i = 2;
        if( withMove ){ // normally when just plotting points you will do it withMove but from a curve not.
            pathContext.moveTo( arr[ 0 ], arr[ 1 ] );
        } else {
            pathContext.lineTo( arr[ 0 ], arr[ 1 ] );
        }
        while( i < l ){
            pathContext.lineTo( arr[ i ], arr[ i + 1 ] );
            i += 2;
        }
    }
}
