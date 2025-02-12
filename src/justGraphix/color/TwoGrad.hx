package justGraphix.color;
import justGraphix.color.ColorHelp;

@:structInit
private class TwoGrad_ {
    public var colorClock: Int;
    public var colorAnti: Int;
    public function new( colorClock: Int, colorAnti: Int ){
        this.colorClock = colorClock;
        this.colorAnti  = colorAnti;
    }
}
@:forward
@:transitive
@:access( justGraphix.color.TwoGrad_ )
abstract TwoGrad( TwoGrad_ ) from TwoGrad_ {
    public inline 
    function new( colorClock: Int, colorAnti: Int ){
        this = new TwoGrad_( colorClock, colorAnti );
    }
    public inline
    function average(): Int {
        return argbIntAvg( this.colorClock, this.colorAnti );
    }
}