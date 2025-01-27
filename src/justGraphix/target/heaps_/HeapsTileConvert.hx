package justGraphix.target.heaps_;

#if heaps
import justGraphix.image.Pixelimage;
import justGraphix.target.heaps_.HeapsTile;
import h2d.Tile;

@:forward
@:transient
abstract HeapsTileConvert( Pixelimage ) from Pixelimage to Pixelimage {
    inline
    public function new( w: Int, h: Int ){
       this = new Pixelimage( w, h );
    }
    @:to
    public inline
    function toHeapsTile(): Tile {
        var heapsTile: HeapsTile = this;
        return heapsTile;
    }
    @:to
    public inline
    function toTile(): Tile {
        var tile: Tile = toHeapsTile();
        return tile;
    }
    @:to
    public inline
    function toHeapsPixels(): hxd.Pixels {
        return pi_xy.formats.HeapsPixels.toHeapsPixels( this );
    }
}
#end