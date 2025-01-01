package justGraphix.geom;
import justGraphix.geom.Matrix1x4;
import justGraphix.geom.Matrix4x3;
inline
function transformVertex( v: Matrix1x4, t: Matrix4x3 ): Matrix1x4 {
    var v2: Matrix1x4 = {  x: t.a * v.x + t.b * v.y + t.c * v.z + t.d
            , y: t.e * v.x + t.f * v.y + t.g * v.z + t.h
            , z: t.i * v.x + t.j * v.y + t.k * v.z + t.l  
            , w: 1. };
    return v2;
}