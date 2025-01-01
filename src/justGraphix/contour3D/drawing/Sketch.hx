package justGraphix.contour3D.drawing;

// import justPath.IPathContext;
// import trilateral3.math.Algebra;
import justGraphix.contour.Contour;
import justGraphix.contour.IPen;
import justGraphix.contour.Sketcher;
//import justGraphix.color.ColorHelp;
import justGraphix.color.ColorSpaceHelper;
import justGraphix.splitter.SpaceSplitter;

// Assume converted to lower case
enum abstract AIColorType ( String ) from String to String {
    var GRAY = 'g';
    var CYMK = 'k';
    var RGB = 'xa'; // unsupported?
    var EPS_RGB = 'r';
}

class Sketch extends Sketcher {
    function aiColorSet( colorType: AIColorType, arr: Array<String> ){
        var colorInt = switch( colorType ){
            case GRAY: 
                aiGreyA( arr[0] );
            case CYMK:
                aiCYMKA( arr );
            case RGB:
                aiARGB( arr );
            case EPS_RGB:
                aiARGB( arr );
            default:
                trace( 'color not found' );
                aiGreyA( '0' );
        }
        pen.currentColor = colorInt;
        return colorInt;
    }
    function getColorType( arr: Array<String> ): AIColorType {
        var col: AIColorType = cast( (arr[ arr.length - 1 ] ).toLowerCase() );
        return col;
    }
    // TODO: make this handle longer string
    // flipY is because ai export seems to be with y going up.
    public inline
    function aiStringPart( str: String, x: Float, y: Float, flipY: Float = 0 ): Void {
        var arr: Array<Array<String>> = SpaceSplitter.parse( str );
        var arr2 = arr.shift();
        aiColorSet( getColorType( arr2 ), arr2 );
        var len = arr.length;
        if( flipY == 0 ){
            for( i in 0...len ){
                var len2 = arr[i].length;
                var arr3 = arr[i];
                var str = arr3[len2-1];
                switch( str ){
                    // may need adjustment for eps I am not sure if l and c are relative
                    case 'm'|'M':
                        moveTo( Std.parseFloat( arr3[0] ) + x, Std.parseFloat( arr3[1] ) + y );
                    case 'L'|'l':
                        lineTo( Std.parseFloat( arr3[0] ) + x, Std.parseFloat( arr3[1] ) + y );
                    case 'C'|'c':
                        quadTo( Std.parseFloat( arr3[0] ) + x, Std.parseFloat( arr3[1] ) + y
                              , Std.parseFloat( arr3[1] ) + x, Std.parseFloat( arr3[2] ) + y );
                    default:
                        trace( str + ' NOT FOUND in aiString' );
                }
            }
        } else {
            for( i in 0...len ){
                var len2 = arr[i].length;
                var arr3 = arr[i];
                var str = arr3[len2-1];
                switch( str ){
                    case 'm':
                        moveTo( Std.parseFloat( arr3[0] ) + x, flipY - Std.parseFloat( arr3[1] ) + y );
                    case 'L':
                        lineTo( Std.parseFloat( arr3[0] ) + x, flipY - Std.parseFloat( arr3[1] ) + y );
                    case 'C':
                        quadTo( Std.parseFloat( arr3[0] ) + x, flipY - Std.parseFloat( arr3[1] ) + y
                              , Std.parseFloat( arr3[1] ) + x, flipY - Std.parseFloat( arr3[2] ) + y );
                    default:
                        trace( str + ' NOT FOUND in aiString' );
                }
            }
        }
    }
}