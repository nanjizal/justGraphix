package justGraphix.splitter;

import justGraphix.splitter.StringCodeIterator;
class SpaceSplitter {
    public static inline
    function parse( str: String ): Array<Array<String>> {
        var sl        = new StringCodeIterator( str );
        sl.next();
        var arr = new Array<Array<String>>();
        var arrTemp = new Array<String>();
        var no = 0;
        var count = 0;
        while( sl.hasNext() ){
            switch( sl.c ){
                case '\n'.code | '\r'.code:
                    arrTemp[ count ] = sl.toStr();
                    arr[ no++ ] = arrTemp.copy();
                    count = 0;
                    sl.resetBuffer();
                case ' '.code: // case space
                    switch( count ){
                        case 0:
                            arrTemp.resize( 0 );
                            arrTemp[0] = sl.toStr();
                        default:
                            arrTemp[ count ] = sl.toStr();
                      }
                      count++;
                      sl.resetBuffer();
                default: // otherwise
                      sl.addChar();
            }
            sl.next();
        }
        return arr;
    }
}