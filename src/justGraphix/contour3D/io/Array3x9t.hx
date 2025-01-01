package justGraphix.contour3D.io;

@:transitive
@:forward
abstract Array3x9t( ArrayFlatDepth ) {
    @:op([]) public inline 
    function readItem( k: Int ): Float {
        return this.readItem( index*28 + k );
    }
    //@:op([]) 
    public inline 
    function writeItem( k: Int, v: Float ): Float {
        this.writeItem( index*28 + k, v );
        return v;
    }
    public inline 
    function new(){
        this = new ArrayFlatDepth();
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
    function toEnd( id: Int, len: Int ){
        return this.rangeToEnd( id*28, Std.int( 28 * len ) , this.size );
    }
    public inline 
    function toStart( id: Int, len: Int ){
        return this.rangeToStart( id*28, Std.int( 28 * len ) );
    }
    public inline
    function swap( id0: Int, id1: Int, len: Int ){
        return this.rangeSwitch( id0*28, id1*28, Std.int( 28 * len ) );
    }
}