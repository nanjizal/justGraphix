package justGraphix.contour3D.io;

@:transitive
@:forward
abstract Array3x7( ArrayFlatDepth ) {
    @:op([]) public inline 
    function readItem( k: Int ): Float {
        return this.readItem( index*21 + k );
    }
    //@:op([]) 
    public inline 
    function writeItem( k: Int, v: Float ): Float {
        this.writeItem( index*21 + k, v );
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
        //this.fits( id*21 );
        return id;
    }
    public inline 
    function toEnd( id: Int, len: Int ){
        return this.rangeToEnd( id*21, Std.int( 21 * len ) , this.size );
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