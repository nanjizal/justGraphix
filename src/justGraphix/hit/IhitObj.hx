package justGraphix.hit;

interface IhitObj {
    public function rectBoundsHit( x: Float, y: Float ): Bool;
    public function hit( x: Float, y: Float ): Bool;
}