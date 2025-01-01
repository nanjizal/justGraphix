package justGraphix.contour3D.io;
import justGraphix.contour.io.Float32Array;
@:transitive
@:forward
abstract Flat3x9( Float32FlatDepth ) from Float32FlatDepth to Float32FlatDepth {
    @:op([]) public inline 
    function readItem( k: Int ): Float {
        return this.readItem( index*27 + k );
    }
    @:op([])
    public inline 
    function writeItem( k: Int, v: Float ): Float {
        this.writeItem( index*27 + k, v );
        return v;
    }
    public inline 
    function new( len: Int ){
        this = new Float32FlatDepth( len );
    }
    public var index( get, set ): Int;
    inline
    function get_index(): Int {
        return this.index;
    }
    inline
    function set_index( id: Int ): Int {
        this.index = id;
        return id;
    }
    public inline
    function getArray(): Float32Array {
        return this.subarray( 2, this.size*27 + 2 );
    }
    public inline 
    function toEnd( id: Int, len: Int ){
        return this.rangeToEnd( id*27, Std.int( 27*len ), 27 );
    }
    public inline 
    function toStart( id: Int, len: Int ){
        return this.rangeToStart( id*27, Std.int( 27*len ) );
    }
    public inline
    function swap( id0: Int, id1: Int, len: Int ){
        return this.rangeSwitch( id0*27, id1*27, Std.int( 27 * len ) );
    }
}