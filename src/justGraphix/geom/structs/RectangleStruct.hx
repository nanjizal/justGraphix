package justGraphix.geom.structs;
@:structInit
class RectangleStruct {
    public var x: Float;
    public var y: Float;
    public var width: Float;
    public var height: Float;
    function new( x: Float, y: Float, width: Float, height: Float ){
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }
    public function clone(): RectangleStruct {
        return { x: x, y: y, width: width, height: height };
    }
}