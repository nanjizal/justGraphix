package justGraphix.contour.io;
import justGraphix.contour.io.Float32Array;
// arr[0] defines pos the position, pos is used to get items
// arr[1] defines internal ( populated ) size
// DON'T use this one directly!!
@:transitive
@:forward
abstract Float32Flat( Float32Array )/* to Float32Array from Float32Array*/ {
    /**
     * <pre><code>
     * >>> ({ 
     * ... var ff = new Float32Flat(2);
     * ... ff[0] = 1.;
     * ... ff[0] == 1.; }) == true
     * </code></pre>
     */
    @:op([]) //@:arrayAccess
    public inline
    function readItem( k: Int ): Float {
      return this[ k + 2 ];
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var ff = new Float32Flat(2);
     * ... ff[0] = 1.;
     * ... ff[0] == 1.; }) == true
     * </code></pre>
     */
    //  @:op([]) //@:arrayAccess
    public inline
    function writeItem( k: Int, v: Float ): Float {
        this[ k + 2 ] = v;
        return v;
    }
    public inline
    function new( len: Int ){
        this = new Float32Array( len + 2 );
        this[0] = 0.; // init iteratior no.
        this[1] = 0.; // init useful size
    }
    public var size( get, set ): Int;
    inline
    function get_size(): Int {
        return Std.int( this[ 1 ] );
    }
    // set to make sure compiler does no just use the set value.
    inline
    function set_size( id: Int ): Int {
        pos = cast id;
        return id;
    }
    public var index( get, set ): Int;
    inline
    function get_index(): Int {
        return Std.int( pos );
    }
    inline
    function set_index( id: Int ): Int {
        pos = id;
        return id;
    }
    public var pos( get, set ): Float;
    inline
    function get_pos(): Float {
        return this[ 0 ];
    }
    inline
    function set_pos( pos_: Float ): Float {
        this[ 0 ] = pos_;
        updateLen();
        return pos_;
    }
  	public inline 
    function fits( k: Int ): Bool {
        return if( k > this.length - 3 ) {
            resize( Math.ceil( k * 2 + 2 ) );
            false;
        } else {
            true;
        }
    }
  public inline
    function resize( l: Int ){
        var p = this[ 0 ];
        var s = this[ 1 ];
        var sInt:Null<Int> = Std.int( this[ 1 ] );
        var arr = this.subarray( 2, this.length );
        this = new Float32Flat( l );
        for( i in 0...sInt ){
            this[ i + 2 ] = arr[ i ];
        }
        this[ 0 ] = p;
        this[ 1 ] = s;
        //trace( 'resize now ' + (l + 2) );
    }
   /*
    public inline // likely not used
    function resize0( l: Int ){
        resize( l );
        this[0] = 0;
    }
  */
    public inline // use if you want to optimise size.
    function optimiseLength(): Int {
        var targetLen: Int = size + 2;
        resize( targetLen );
        return targetLen;
    }
    
    inline function updateLen() {
        if( this[ 0 ] > ( this[ 1 ] - 1 ) ) {
            this[ 1 ] = this[ 0 ];
        }
    }
    public inline
    function hasNext() return pos < get_size();
    public inline
    function next(): Float {
        pos = pos + 1.;
        //fits( Std.int( pos ) );
        return pos;
    }
    /*
    var checker = i % ( section/3);
        switch( checker ){
            case 6:  this[ starting + i ] = this[ starting + i ]/2; 
            default:
                
    }
    */
    @:op(A++) public inline
    function increment() {
        return next();
    }
    @:to
    public inline
    function toArray(): Float32Array {
        return this.subarray( 2, this.length );
    }
    @:from
    public static inline
    function fromArray( arr: Float32Array ): Float32Flat {
        var flat = new Float32Flat( arr.length );
        flat.fill( arr );
        return flat;
    }
    public inline
    function clone(): Float32Flat {
        var flat = new Float32Flat( this.length - 2 );
        flat.fill( toArray() );
        return flat;
    }
    public inline
    function fill( arr: Float32Array ){
        var l = arr.length;
        for( i in 0...l ){
            this[ i + 2 ] = arr[ i ];
        }
        this[ 0 ] = 0;
        this[ 1 ] = l;
    }
}