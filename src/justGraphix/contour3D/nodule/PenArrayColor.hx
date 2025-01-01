package justGraphix.contour3D.nodule;
import justGraphix.contour3D.io.FlatArrayTriangles;
import justGraphix.contour3D.drawing.Pen;
import justGraphix.contour3D.drawing.TriangleAbstract;
import justGraphix.contour3D.drawing.PaintAbstract;
import justGraphix.contour3D.drawing.Color3Abstract;
import justGraphix.contour.io.Float32Array;
class PenArrColor extends PenNodule {
    public var colorTriangles   = new FlatArrayTriangles();
    public function new( useGLScale: Bool = true ){
        super( useGLScale );
    }
    public function createPen(): Pen {
       var t = colorTriangles;
       @:privateAccess
       var triangleAbstract: TriangleAbstract = {
             rotate:        t.rotate
           , moveDelta:     t.moveDelta
           , rotateTrig:    t.rotateTrig
           #if trilateral_hitDebug , distHit:       t.distHit #end
           , fullHit:       t.fullHit
           , liteHit:       t.liteHit
           , get_bottom:    t.get_bottom
           , get_back:      t.get_back
           , get_right:     t.get_right
           , get_x:         t.get_x
           , set_x:         t.set_x
           , get_y:         t.get_y
           , set_y:         t.set_y
           , get_z:         t.get_z
           , set_z:         t.set_z
           , triangle:      t.triangle
           , getTriangle3D: t.getTriangle3D
           , transform:     t.transform
       }
       // only viable to set this up for interleave arrays.
       @:privateAccess
       var color3Abstract: Color3Abstract = {
             set_argb:  t.set_argb
           , set_argbA: t.set_argbA
           , get_argbA: t.get_argbA
           , set_argbB: t.set_argbB
           , get_argbB: t.get_argbB
           , set_argbC: t.set_argbC
           , get_argbC: t.get_argbC
       }
       @:privateAccess
       var paintAbstract: PaintAbstract = {     
              triangle:        t.triangle   // remove...?
            , cornerColors:   t.cornerColors
            , colorTriangles: t.colorTriangles
            , getTriInt:      t.getTriInt
            , transform:       t.transform  // remove...?
            , transformRange:  t.transformRange
            , getTriangle3D:   t.getTriangle3D // remove...?
            , next:            t.next
            , hasNext:         t.hasNext
            , get_pos:         t.get_pos
            , set_pos:         t.set_pos
            , get_size:        t.get_size
            , set_size:        null
            , toStart:         t.toStart
            , toEnd:           t.toEnd
            , swap:            t.swap
            , triangleCurrent: triangleAbstract
            , color3current:  color3Abstract
            };
        pen = new Pen( paintAbstract );
        return pen;
    }
    public inline
    function get_data(): Float32Array {
        return colorTriangles.getArray();
    }
    public inline
    function get_size(): Int{
        return Std.int( colorTriangles.size*3 );
    }
}