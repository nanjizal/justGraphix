package justGraphix.iterMagix;
/*
// positive
// https://try.haxe.org/#4aC54d24
// negative
//https://try.haxe.org/#d4BcA806
function main() {
    var iter = new UnitIterator().step(10).places(1).negative().toTheTop();
    for( i in iter ){
        if( i > 0.5 ) break;
        trace( i );
    }
    iter.reset();
    for( i in iter ){
        trace( i );
    }
}
*/
@:access(IntIterator.min, IntIterator.max )
class UnitIter {
    public var start = 0;
    public var max = .1;
    public var step: Float = 0;
  	public var value: Float = 0.;
    public var isNegative: Bool = false;  
    var count = 0;
    public var includeMax:Bool = false;
    var cropTo: Null<Float> = null;
    public inline
    function new(){}
}
@:transitive
@:access( IntIterator.min, IntIterator.max )
@:access( justGraphix.iterMagix.UnitIter.includeMax )
@:access( justGraphix.iterMagix.UnitIter.isNegative )
@:access( justGraphix.iterMagix.UnitIter.cropTo )
@:access( justGraphix.iterMagix.UnitIter.count )
@:access( justGraphix.iterMagix.UnitIter.value )
@:forward
@:transitive
abstract UnitIterator( UnitIter ) from UnitIter {
    // step must be positive
    public function step( count_: Int ): UnitIterator {
        if( count_ < 0. ) count_ = -count_;
        this.step = 1./count_;
        this.value = 0.;
        this.max = count_;
        return abstract;
    }
    public inline
    function setFloatStep( v: Float ){
        this.step = v;
    }
    public inline
    function new(){
        this = new UnitIter();
    }
    public inline
    function hasNext() {
        return if( this.includeMax ){
            this.count++ < this.max + this.step;
        } else {
            this.count++ < this.max;
        }
    }
    public inline
    function next():Float {
        var v = positiveValue();
        this.value = ( this.isNegative )? -v: v;
        return this.value;
    }
    inline function positiveValue(): Float {
        return if( this.cropTo != null ){
            crop( this.start + (this.count-1) * this.step );
        } else {
            this.start + (this.count-1) * this.step;
        }
    }
    inline function crop( val: Float ){
        return Std.int( val*this.cropTo)/this.cropTo;	
    }
    public inline
    function toTheTop() {
        this.includeMax = true;
        return abstract;
    }
    public inline
    function places( n: Int ){
        this.cropTo = Math.pow( 10, n );
        return abstract;
    }
    public inline
    function reset(){
        this.count = 0;
        this.value = 0.;
        return abstract;
    }
    public inline
    function resetPositive(){
        reset();
        positive();
        return abstract;
  	}
    public inline
    function negative(){
        this.isNegative = true;
        return abstract;
    }
    public inline
    function positive(){
        this.isNegative = false;
        return abstract;
    }
    public static inline
    function change( i: Float, start: Float, end: Float ){
        return i*(end-start)+start;
    }
    public static inline
    function changeCrop(i: Float, start: Float, end: Float, places_: Int ){
        var n = Math.pow( 10, places_ );
        return Std.int( ( i*(end-start)+start )*n )/n;
    }
}