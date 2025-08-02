package justGraphix.color.space;
import justGraphix.color.space.LAB;
/** 
   { l, a, b, alpha }
   , L – perceived lightness, a – how green/red the color is, b – how blue/yellow the color is, alpha -alpha
**/
@:transitive
@:forward
abstract SRLAB2( LAB ) from LAB to LAB {
   public inline
   function new( L: Float, a: Float, b: Float, alpha: Float ){
      this = new LAB( L, a, b, alpha );
   }
}
