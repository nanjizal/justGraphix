package justGraphix.iterMagix;
import justGraphix.iterMagix.EaseIterator;
import justGraphix.iterMagix.TauIterator.TauIter;
import justGraphix.iterMagix.TauIterator.tauLimit;

class TauEaseIter {
    public var tauIter: TauIterator;
    public var ease: Null<Float -> Float> = null;
    public inline 
    function new( tauIter: TauIterator ){
        this.tauIter = tauIter;
    }
}
@:access( )
@:transitive
@:forward
abstract TauEaseIterator( TauEaseIter) from TauEaseIter to TauEaseIter {
    public inline
    function new( min: Float, max: Float, steps: Int ){
        var tIter = new TauIterator( tauLimit( min, true ), tauLimit( max, true ), steps );
        this = new TauEaseIter( tIter );
    }
    public inline
    function hasNext(): Bool {
        return this.tauIter.hasNext();
    }
    public inline
    function next():Float {
        var n = this.tauIter.iter.next();
        var hasFinish = false;
        this.tauIter.value = if( n == 1. ){
            hasFinish = true;
            this.tauIter.end;
        } else {
            tauLimit( this.tauIter.start + this.ease( n * this.tauIter.stepSize ), true );
        }
        if( hasFinish && this.tauIter.finish != null ) this.tauIter.finish();
        return this.tauIter.value;
    }
    public inline
    function easing( ease_: Float -> Float ){
      this.ease = ease_;
      return abstract;
    }
    public inline
    function finished( finish_: Void->Void ){
        this.tauIter.finish = finish_;
        return abstract;
    }
}
