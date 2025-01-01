package justGraphix.contour3D.io;
import justGraphix.geom.Transformer;
import justGraphix.geom.Matrix1x4;
import justGraphix.geom.Matrix4x3;
import justGraphix.contour3D.io.ArrayColorTriangles;
import justGraphix.iterMagix.IteratorRange;
import justGraphix.geom.structs.Triangle3D;
import justGraphix.geom.structs.TriInt;
import justGraphix.contour.io.Float32Array;
@:transitive
@:forward
abstract FlatArrayTriangles( ArrayColorTriangles ){
    /*
    @:to
    public inline
    function toArray(): Float32Array {
        throw 'use getArray()';
        return null;
    }
    */
    public inline function new(){
        this = new ArrayColorTriangles();
    }
    public
    function transform( m: Matrix4x3 ){
        var pa: Matrix1x4 = { x: this.ax, y: this.ay, z: this.az, w: 1. };
        var pb: Matrix1x4 = { x: this.bx, y: this.by, z: this.bz, w: 1. };
        var pc: Matrix1x4 = { x: this.cx, y: this.cy, z: this.cz, w: 1. };
        pa = transformVertex( pa, m );
        pb = transformVertex( pb, m );
        pc = transformVertex( pc, m );
        this.ax = pa.x;
        this.ay = pa.y;
        this.az = pa.z;
        this.bx = pb.x;
        this.by = pb.y;
        this.bz = pb.z;
        this.cx = pc.x;
        this.cy = pc.y;
        this.cz = pc.z; 
    }
    public
    function transformAll( m: Matrix4x3 ) {
        this.pos = 0;
        for( i in 0...this.size ){
            transform( m );
            this.next();
        }
    }
    public
    function transformRange( m: Matrix4x3, startEnd: IteratorRange ){
        var start = startEnd.start;
        var end = startEnd.max;
        this.pos = start;
        if( end > this.size - 1 ) end == this.size - 1;
        for( i in start...( end + 1 ) ){
            transform( m );
            this.next();
        }
    }
    public inline
    function getTriangle3D(): Triangle3D {
        var pa: Matrix1x4 = { x: this.ax, y: this.ay, z: this.az, w: 1. };
        var pb: Matrix1x4 = { x: this.bx, y: this.by, z: this.bz, w: 1. };
        var pc: Matrix1x4 = { x: this.cx, y: this.cy, z: this.cz, w: 1. };
        return { a: pa, b: pb, c: pc };
    }
    public inline
    function getTriInt(): TriInt {
        return { a: this.argbA, b: this.argbB, c: this.argbC };
    }
}