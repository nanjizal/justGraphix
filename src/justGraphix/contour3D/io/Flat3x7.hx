package justGraphix.contour3D.io;
import justGraphix.contour.io.Float32Array;
@:transitive
@:forward
abstract Flat3x7( Float32FlatDepth ) {
    @:op([]) public inline 
    function readItem( k: Int ): Float {
        return this.readItem( index*21 + k );
    }
    @:op([]) public inline 
    function writeItem( k: Int, v: Float ): Float {
        this.writeItem( index*21 + k, v );
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
        //this.fits( id*21 );
        return id;
    }
    public inline
    function getArray(): Float32Array {
        return this.subarray( 2, this.size*21 + 2 );
    }
    public inline 
    function toEnd( id: Int, len: Int ){
        return this.rangeToEnd( id*21, Std.int( 21 * len ) , 21*this.size );
    }
    public inline 
    function toStart( id: Int, len: Int ){
        return this.rangeToStart( id*21, Std.int( 21 * len ) );
    }
    public inline
    function swap( id0: Int, id1: Int, len: Int ){
        return this.rangeSwitch( id0*21, id1*21, Std.int( 21 * len ) );
    }
}