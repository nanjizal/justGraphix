package justGraphix.target.openflTarget_;
import peote.view.Element;
import peote.view.Color;
class PeoteBasicElement implements Element {
    @posX    public var x:          Int   = 0;
    @posY    public var y:          Int   = 0;
    @sizeX   public var wide:       Int   = 128;
    @sizeY   public var hi:         Int   = 128;
    // controls the material slot used.
    @texSlot public var slot:       Int   = 0;
    public
    function new( x: Int, y: Int, wide: Int = 128, hi: Int = 128, slot: Int = 0 ){
        this.x      = x;
        this.y      = y;
        this.wide   = wide;
        this.hi     = hi;
        this.slot   = slot;
    }
}