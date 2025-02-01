package justGraphix.pallette.simple; 
/** 
   ![quick](../../bootstrap/img/quick.png)
**/
enum abstract QuickARGB( Int ) to Int from Int {
    var Violet      = 0xFF9400D3;
    var Indigo      = 0xFF4b0082;
    var Blue        = 0xFF0000FF;
    var Green       = 0xFF00ff00;
    var Yellow      = 0xFFFFFF00;
    var Orange      = 0xFFFF7F00;
    var Red         = 0xFFFF0000;
    var Black       = 0xFF000000;
    var NearlyBlack = 0xFF111111;
    var DarkGrey    = 0xFF0c0c0c;
    var MidGrey     = 0xFF333333;
    var LightGrey4  = 0xFF444444;
    var LightGrey7  = 0xFF777777;
    var LightGrey9  = 0xFF999999;
    var LightGreyB  = 0xFFBBBBBB;
    var White       = 0xFFFFFFFF;
    public static inline
    function rainbow(): Array<QuickARGB>{
        return [ Violet, Indigo, Blue, Green, Yellow, Red ];
    }
    public static inline
    function greys(): Array<QuickARGB>{
        return [ Black, NearlyBlack, DarkGrey, MidGrey, LightGrey4, LightGrey7, LightGrey9, LightGreyB, White ];
    }
}
