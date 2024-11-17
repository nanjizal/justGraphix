package justGraphix.geom;
import justGraphix.geom.structs.RayStruct;
/** 
   { dist, edge, norm, refl }
**/
@:forward
@:transitive
@:access( justGraphix.geom.structs.RayStruct )
abstract Ray( RayStruct ) to RayStruct from RayStruct {
    public inline function new( ray: RayStruct ){
        this = ray;
    }
    /*
    public inline 
    function clone(){
        var cloned = this.clone();
        return new Ray( cloned.dist, cloned.edge, cloned.norm, cloned.refl );
    }
    */
}