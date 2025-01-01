package justGraphix.contour3D.drawing;
// TODO: Not really happy with hard coding the triangulation possible engines.
enum abstract StyleFill( Int ) from Int to Int {
    var tess2;
    var polyK;
    var poly2tri;
}