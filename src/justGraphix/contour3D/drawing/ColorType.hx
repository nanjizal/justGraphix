package justGraphix.contour3D.drawing;
import justGraphix.contour3D.drawing.Color3Type;
import justGraphix.geom.structs.TriInt;
import justGraphix.contour3D.drawing.ColorAbstract;
typedef ColorType = {
    var cornerColors: ( colorA: Int, colorB: Int, colorC: Int ) -> Void;
    var colorTriangles: ( color: Int, times: Int ) -> Void;
    var getTriInt:()->TriInt;
    public function get_pos(): Float;
    public function set_pos( v: Float ): Float;
    public function get_size(): Int;
    public function set_size( v: Int ): Int;
    // Only relevant when using interleave array structures
    var ?color3current: Color3Abstract;
}