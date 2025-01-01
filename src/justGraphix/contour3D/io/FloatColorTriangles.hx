package justGraphix.contour3D.io;

@:transitive
@:forward
abstract FloatColorTriangles( Flat3x7 ){
    public inline function new( len: Int ){
        this = new Flat3x7( len );
    }
    public static inline
    function create( len: Int ){
        return new FloatColorTriangles( len * 21 );
    }
    public var ax( get, set ): Float;
    function get_ax(): Float {
        return this[ 0 ];
    }
    function set_ax( v: Float ): Float {
        //this[ 0 ] = v;
        this.writeItem( 0, v );
        return v;
    }
    public var ay( get, set ): Float;
    function get_ay(): Float {
        return this[ 1 ];
    }
    function set_ay( v: Float ): Float {
        //this[ 1 ] = v;
        this.writeItem( 1, v );
        return v;
    }
    public var az( get, set ): Float;
    function get_az(): Float {
        return this[ 2 ];
    }
    function set_az( v: Float ): Float {
        //this[ 2 ] = v;
        this.writeItem( 2, v );
        return v;
    }
    
    public var redA( get, set ): Float;
    function get_redA(): Float {
        return this[ 3 ];
    }
    function set_redA( v: Float ): Float {
        //this[ 3 ] = v;
        this.writeItem( 3, v );
        return v;
    }
    
    public var greenA( get, set ): Float;
    inline
    function get_greenA(): Float {
        return this[ 4 ];
    }
    inline
    function set_greenA( v: Float ): Float {
        //this[ 4 ] = v;
        this.writeItem( 4, v );
        return v;
    }
    public var blueA( get, set ): Float;
    inline
    function get_blueA(): Float {
        return this[ 5 ];
    }
    inline
    function set_blueA( v: Float ): Float {
        //this[ 5 ] = v;
        this.writeItem( 5, v );
        return v;
    }
    public var alphaA( get, set ): Float;
    inline
    function get_alphaA(): Float {
        return this[ 6 ];
    }
    inline
    function set_alphaA( v: Float ): Float {
        //this[ 6 ] = v;
        this.writeItem( 6, v );
        return v;
    }
    
    public var bx( get, set ): Float;
    function get_bx(): Float {
        return this[ 7 ];
    }
    function set_bx( v: Float ): Float {
        //this[ 7 ] = v;
        this.writeItem( 7, v );
        return v;
    }
    public var by( get, set ): Float;
    function get_by(): Float {
        return this[ 8 ];
    }
    function set_by( v: Float ): Float {
        //this[ 8 ] = v;
        this.writeItem( 8, v );
        return v;
    }
    public var bz( get, set ): Float;
    function get_bz(): Float {
        return this[ 9 ];
    }
    function set_bz( v: Float ): Float {
        //this[ 9 ] = v;
        this.writeItem( 9, v );
        return v;
    }
    
    public var redB( get, set ): Float;
    function get_redB(): Float {
        return this[ 10 ];
    }
    function set_redB( v: Float ): Float {
        //this[ 10 ] = v;
        this.writeItem( 10, v );
        return v;
    }
    
    public var greenB( get, set ): Float;
    inline
    function get_greenB(): Float {
        return this[ 11 ];
    }
    inline
    function set_greenB( v: Float ): Float {
        //this[ 11 ] = v;
        this.writeItem( 11, v );
        return v;
    }
    public var blueB( get, set ): Float;
    inline
    function get_blueB(): Float {
        return this[ 12 ];
    }
    inline
    function set_blueB( v: Float ): Float {
        //this[ 12 ] = v;
        this.writeItem( 12, v );
        return v;
    }
    public var alphaB( get, set ): Float;
    inline
    function get_alphaB(): Float {
        return this[ 13 ];
    }
    inline
    function set_alphaB( v: Float ): Float {
        //this[ 13 ] = v;
        this.writeItem( 13, v );
        return v;
    }
    
    public var cx( get, set ): Float;
    function get_cx(): Float {
        return this[ 14 ];
    }
    function set_cx( v: Float ): Float {
        //this[ 14 ] = v;
        this.writeItem( 14, v );
        return v;
    }
    public var cy( get, set ): Float;
    function get_cy(): Float {
        return this[ 15 ];
    }
    function set_cy( v: Float ): Float {
        //this[ 15 ] = v;
        this.writeItem( 15, v );
        return v;
    }
    public var cz( get, set ): Float;
    function get_cz(): Float {
        return this[ 16 ];
    }
    function set_cz( v: Float ): Float {
        //this[ 16 ] = v;
        this.writeItem( 16, v );
        return v;
    }
    
    public var redC( get, set ): Float;
    function get_redC(): Float {
        return this[ 17 ];
    }
    function set_redC( v: Float ): Float {
        //this[ 17 ] = v;
        this.writeItem( 17, v );
        return v;
    }
    
    public var greenC( get, set ): Float;
    inline
    function get_greenC(): Float {
        return this[ 18 ];
    }
    inline
    function set_greenC( v: Float ): Float {
        //this[ 18 ] = v;
        this.writeItem( 18, v );
        return v;
    }
    public var blueC( get, set ): Float;
    inline
    function get_blueC(): Float {
        return this[ 19 ];
    }
    inline
    function set_blueC( v: Float ): Float {
        //this[ 19 ] = v;
        this.writeItem( 19, v );
        return v;
    }
    public var alphaC( get, set ): Float;
    inline
    function get_alphaC(): Float {
        return this[ 20 ];
    }
    inline
    function set_alphaC( v: Float ): Float {
        //this[ 20 ] = v;
        this.writeItem( 20, v );
        return v;
    }
    @:keep
    public function triangle( ax_: Float, ay_: Float, az_: Float
                            , bx_: Float, by_: Float, bz_: Float
                            , cx_: Float, cy_: Float, cz_: Float ){
        ax = ax_;
        ay = ay_;
        az = az_;
        bx = bx_;
        by = by_;
        bz = bz_;
        cx = cx_;
        cy = cy_;
        cz = cz_;
        // assume shape is 2D with depth at moment.
        var windingAdjusted = adjustWinding();
        if( windingAdjusted ){
            ax = ax_;
            ay = ay_;
            bx = cx_;
            by = cy_;
            cx = bx_;
            cy = by_;
        }
        return windingAdjusted;
    }
    public function adjustWinding():Bool { // check sign
        return ( (ax * by - bx * ay) + (bx * cy - cx * by) + (cx * ay - ax * cy) )>0;
    }
    public var x( get, set ): Float;
    inline
    function get_x() {
        return Math.min( Math.min( ax, bx ), cx );
    }
    inline
    function set_x( x: Float ): Float {
        var dx = x - get_x();
        ax = ax + dx;
        bx = bx + dx;
        cx = cx + dx;
        return x;
    }
    public var y( get, set ): Float;   
    inline
    function get_y(): Float {
        return Math.min( Math.min( ay, by ), cy );
    }
    inline
    function set_y( y: Float ): Float {
        var dy = y - get_y();
        ay = ay + dy;
        by = by + dy;
        cy = cy + dy;
        return y;
    }
    public var z( get, set ): Float;   
    inline
    function get_z(): Float {
        return Math.min( Math.min( az, bz ), cz );
    }
    inline
    function set_z( z: Float ): Float {
        var dz = z - get_z();
        az = az + dz;
        bz = bz + dz;
        cz = cz + dz;
        return z;
    }
    public var right( get, never ): Float;
    inline
    function get_right(): Float {
        return Math.max( Math.max( ax, bx ), cx );
    }
    public var bottom( get, never ): Float;
    inline
    function get_bottom(): Float {
        return Math.max( Math.max( ay, by ), cy );
    }
    public var back( get, never ): Float;
    inline
    function get_back(): Float {
        return Math.max( Math.max( az, bz ), cz );
    }
    function moveDelta( dx: Float, dy: Float ){
        ax += dx;
        ay += dy;
        bx += dx;
        by += dy;
        cx += dx;
        cy += dy;
    }
    public static inline
    function sign( n: Float ): Int {
        return Std.int( Math.abs( n )/n );
    }
    public
    function distHit( px: Float, py: Float ): Float {
        if( liteHit( px, py ) ) return 0;
        var dA = Math.pow( Math.pow( px - ax, 2 ) + Math.pow( py - ay, 2 ), 0.5 );
        var dB = Math.pow( Math.pow( px - bx, 2 ) + Math.pow( py - by, 2 ), 0.5 );
        var dC = Math.pow( Math.pow( px - cx, 2 ) + Math.pow( py - cy, 2 ), 0.5 );
        return Math.min( Math.min( dA, dB ), dC );
    }
    // no bounds checking
    public inline
    function liteHit( px: Float, py: Float ): Bool {
        var planeAB = ( ax - px )*( by - py ) - ( bx - px )*( ay - py );
        var planeBC = ( bx - px )*( cy - py ) - ( cx - px )*( by - py );
        var planeCA = ( cx - px )*( ay - py ) - ( ax - px )*( cy - py );
        return sign( planeAB ) == sign( planeBC ) && sign( planeBC ) == sign( planeCA );
    }
    //http://www.emanueleferonato.com/2012/06/18/algorithm-to-determine-if-a-point-is-inside-a-triangle-with-mathematics-no-hit-test-involved/
    public
    function fullHit( px: Float, py: Float ): Bool {
        if( px > x && px < right && py > y && py < bottom ) return true;
        return liteHit( px, py );
    }
    public inline 
    function rotate( x: Float, y: Float, theta: Float ){
        var cos = Math.cos( theta );
        var sin = Math.sin( theta );
        rotateTrig( x, y, cos, sin );
    }
    public inline 
    function rotateTrig( x: Float, y: Float, cos: Float, sin: Float ){
        ax -= x;
        ay -= y;
        bx -= x;
        by -= y;
        cx -= x;
        cy -= y;
        var dx: Float;
        var dy: Float;
        dx  = ax;
        dy  = ay;
        ax  = dx * cos - dy * sin;
        ay  = dx * sin + dy * cos; 
        dx  = bx;
        dy  = by;
        bx  = dx * cos - dy * sin;
        by  = dx * sin + dy * cos; 
        dx  = cx;
        dy  = cy;
        cx  = dx * cos - dy * sin;
        cy  = dx * sin + dy * cos;
        ax += x;
        ay += y;
        bx += x;
        by += y;
        cx += x;
        cy += y;
    }
    public inline
    function colorTriangles( color: Int, times: Int ){
        for( i in 0...times ) {
            argb = color;
            this.pos++;
        }
    }
    public inline
    function cornerColors( colorA: Int, colorB: Int, colorC: Int ) {
        argbA = colorA;
        argbB = colorB;
        argbC = colorC;
    }
    public var rgb( never, set ): Int;
    inline
    function set_rgb( col: Int ): Int {
        rgbA = col;
        rgbB = col;
        rgbC = col;
        return col;
    }
    public var rgbA( get, set ): Int;
    inline
    function set_rgbA( col: Int ): Int {
        redA   = redChannel( col );
        blueA  = blueChannel( col );
        greenA = greenChannel( col );
        alphaA = 1.;
        return col;
    }
    inline
    function get_rgbA():Int {
        return     Math.round( blueA  * 255 )
               | ( Math.round( greenA * 255 ) << 8 ) 
               | ( Math.round( redA   * 255 ) << 16 );
    }
    public var rgbB( get, set ): Int;
    inline
    function set_rgbB( col: Int ): Int {
        redB   = redChannel( col );
        blueB  = blueChannel( col );
        greenB = greenChannel( col );
        alphaB = 1.;
        return col;
    }
    inline
    function get_rgbB():Int {
        return     Math.round( blueB  * 255 )
               | ( Math.round( greenB * 255 ) << 8 ) 
               | ( Math.round( redB   * 255 ) << 16 );
    }
    public var rgbC( get, set ): Int;
    inline
    function set_rgbC( col: Int ): Int {
        redC   = redChannel( col );
        blueC  = blueChannel( col );
        greenC = greenChannel( col );
        alphaC = 1.;
        return col;
    }
    inline
    function get_rgbC():Int {
        return     Math.round( blueC  * 255 )
               | ( Math.round( greenC * 255 ) << 8 ) 
               | ( Math.round( redC   * 255 ) << 16 );
    }
    public var argb( never, set ): Int;
    inline
    function set_argb( col: Int ): Int {
        argbA = col;
        argbB = col;
        argbC = col;
        return col;
    }
    public var argbA( get, set ): Int;
    inline
    function set_argbA( col: Int ): Int {
        redA   = redChannel( col );
        blueA  = blueChannel( col );
        greenA = greenChannel( col );
        alphaA = alphaChannel( col );
        return col;
    }
    inline
    function get_argbA():Int {
        return    ( Math.round( alphaA * 255 ) << 24 ) 
                | ( Math.round( redA   * 255 ) << 16) 
                | ( Math.round( greenA * 255 ) << 8) 
                |   Math.round( blueA  * 255 );
    }
    public var argbB( get, set ): Int;
    inline
    function set_argbB( col: Int ): Int {
        redB   = redChannel( col );
        blueB  = blueChannel( col );
        greenB = greenChannel( col );
        alphaB = alphaChannel( col );
        return col;
    }
    inline
    function get_argbB():Int {
        return    ( Math.round( alphaB * 255 ) << 24 ) 
                | ( Math.round( redB   * 255 ) << 16) 
                | ( Math.round( greenB * 255 ) << 8) 
                |   Math.round( blueB  * 255 );
    }
    public var argbC( get, set ): Int;
    inline
    function set_argbC( col: Int ): Int {
        redC   = redChannel( col );
        blueC  = blueChannel( col );
        greenC = greenChannel( col );
        alphaC = alphaChannel( col );
        return col;
    }
    inline
    function get_argbC():Int {
        return    ( Math.round( alphaC * 255 ) << 24 ) 
                | ( Math.round( redC   * 255 ) << 16) 
                | ( Math.round( greenC * 255 ) << 8) 
                |   Math.round( blueC  * 255 );
    }
    public inline
    function prettyStringVert(){
        return  '{ ax: ' + ax + ', ay: ' + ay + ', az: ' + az + ' }' + '\n' +
                '{ bx: ' + bx + ', by: ' + by + ', bz: ' + bz + ' }' + '\n' +
                '{ cx: ' + cx + ', cy: ' + cy + ', cz: ' + cz + ' }' + '\n';
    }
    public inline
    function prettyAllVert(){
        this.pos = 0;
        var str = 'FlatColorTriangle - Verts: \n';
        for( i in 0...this.size ) {
            str += prettyStringVert();
            this.next();
        }
        this.pos = 0;
        return str;
    }
    public inline
    function hex( v: Int ): String {
        return '0x' + StringTools.hex( v );
    }
    public inline
    function hexA(): String {
        return hex( argbA );
    }
    public inline
    function hexB(): String {
        return hex( argbB );
    }
    public inline
    function hexC(): String {
        return hex( argbC );
    }
    public inline
    function hexAll(){
        this.pos = 0;
        var str = 'FlatColorTriangle - RGBA: \n';
        for( i in 0...this.size ) {
            str += 'colorA: ' + hexA() + ', colorB: ' + hexB() +', colorC: ' + hexC() + '\n';
            this.next();
        }
        this.pos = 0;
        return str;
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
}