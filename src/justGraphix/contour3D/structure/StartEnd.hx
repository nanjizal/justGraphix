package justGraphix.contour3D.structure;
@:structInit
class StartEnd{
    public var start: Int;
    public var end:   Int;
    public function new( start: Int, end: Int ){
        this.start = start;
        this.end   = end;
    }
}