package justGraphix.geom.structs;
import justGraphix.geom.Matrix1x4;
/** 
   { dist, edge, norm, refl }
**/
@:structInit
class RayStruct {
    public var dist = 0.; 
    public var edge = 0.;
    public var norm: Matrix1x4;
    public var refl:  Matrix1x4;
    public
    function new( dist: Float, edge: Float, norm: Matrix1x4, refl: Matrix1x4 ){
        this.dist  = dist; 
        this.edge  = edge;
        this.norm = norm;
        this.refl  = refl;
    }
    public function clone(): RayStruct {
        return { dist: dist
               , edge: edge
               , norm: new Matrix1x4( { x: norm.x, y: norm.y, z: norm.z } )
               , refl: new Matrix1x4( { x: refl.x, y: refl.y, z: refl.z } )
        };
    }
}