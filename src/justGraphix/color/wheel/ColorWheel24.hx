package justGraphix.color.wheel;
import justGraphix.pallette.wheel.Wheel24;
/** 
   ![wheel24](../../bootstrap/img/wheel24.png)
**/
class ColorWheel24{
    inline public static 
    function getWheel(){
        return  [ redRadish
                , orangeSoda
                , gokuOrange
                , highlighterOrange
                , carona
                , solarPower
                , flirtatious
                , yellowBellied
                , daffodil
                , spoiledEgg
                , peraRocha
                , appleGreen
                , fieldGreen
                , parisGreen
                , maximumBlue
                , blueTourmaline
                , celestialPlum
                , freeSpeechBlue
                , earlySpringNight
                , blueDepression
                , nebulaFuchsia
                , fuchsiaFlair
                , royalFuchsia
                , fuchsiaPurple ];
    }
    inline public static
    function random(){
        var wheel = getWheel();
        var rnd: Int = Math.round( Math.random()*23);
        return wheel[rnd];
    }
    inline public static
    function getName( w: Wheel24 ): String {
        return switch( w ){
            case redRadish:             'redRadish';
            case orangeSoda:            'orangeSoda';
            case gokuOrange:            'gokuOrange';
            case highlighterOrange:     'highlighterOrange';
            case carona:                'carona';
            case solarPower:            'solarPower';
            case flirtatious:           'flirtaious';
            case yellowBellied:         'yellowBellied';
            case daffodil:              'daffodil';
            case spoiledEgg:            'spoiledEgg';
            case peraRocha:             'peraRocha';
            case appleGreen:            'appleGreen';
            case fieldGreen:            'fieldGreen';
            case parisGreen:            'parisGreen';
            case maximumBlue:           'maximumBlue';
            case blueTourmaline:        'blueTourmaline';
            case celestialPlum:         'celestialPlum';
            case freeSpeechBlue:        'freeSpeechBlue';
            case earlySpringNight:      'earlySpringNight';
            case blueDepression:        'blueDepression';
            case nebulaFuchsia:         'nebulaFuschsia';
            case fuchsiaFlair:          'fushsiaFlair';
            case royalFuchsia:          'royalFuchsia';
            case fuchsiaPurple:         'fuchsiaPurple';
        }
    }
    inline public static
    function next( w: Wheel24 ){
        var wheel = getWheel();
        var i = wheel.indexOf( w );
        var v = ( i < 24 )? i + 1: 0;
        return wheel[ v ];
    }
}
