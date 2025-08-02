package justGraphix.rose;
var epsilon( get, never ): Float;
inline
function get_epsilon(): Float {
    return 0.000000000000005;
}
var pie_2( get, never ): Float;
inline
function get_pie_2(): Float {
    return pie/2;
}
var tau3_4( get, never ): Float;
inline
function get_tau3_4(): Float {
	return pie+pie_2;
}
var pie( get, never ): Float;
inline
function get_pie(): Float {
	return Math.PI;
}
var tau( get, never ): Float;
inline
function get_tau(): Float {
	return 2*pie;
}
inline 
function tauDivisor( val: Float ): Float {
	return Math.ceil( val/tau )-1.;
}
inline
function minusTau( val: Float ): Float {
    var divisor = tauDivisor( val );
	return ( divisor>0)? tau*divisor: 0;
}
inline
function tauNormalize( val: Float ): Float {
	return val - minusTau( val );
}
inline
function clean0( val: Float ){
    return ( 
        ( val > tau - epsilon && val < tau + epsilon )
        ||
        ( val > - epsilon && val < epsilon ) 
    )? 0.: val;
}
inline
function tauLimit( val: Float, zero: Bool = false ): Float {
    var out = ( val >= 0 )? tauNormalize( val ): tau-tauNormalize( -val );
    return ( zero )? clean0(out): out;
}
inline
function pi2piLimit( val: Float ): Float {
    return if( val >= 0. ){
        var temp = tauNormalize( val );
        ( temp > Math.PI )? -2*Math.PI + temp: temp;
    } else {
	    var temp = -tauNormalize( -val );
        ( temp < -Math.PI )? temp + 2*Math.PI: temp;
    }
}
inline
function smallest( v1: Float, v2: Float ){
    var t1 = tauLimit( v1, true );
    var t2 = tauLimit( v2, true );
    var dif: Float;
    return if( t1 == t2 ){
	    0.;
    } else if( t1 < t2 ){
	    dif = t2 - t1;
        if( dif < Math.PI ){
		dif;
        } else {
	        -(2*Math.PI-dif);
        }
    } else {
        dif = t1 - t2;
        if( dif < Math.PI ){
		    -dif;
        } else {
		    (2*Math.PI-dif);
        }
    }
}
