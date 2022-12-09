let clear: unit => unit = () => %raw( "localStorage.clear()" );

let getItem: string => unit = _string => %raw( "localStorage.getItem( _string )" );

let removeItem: string => unit = _string => %raw( "localStorage.removeItem( _string )" );

let setItem: (string, string) => unit = ( _string1, _string2 ) => %raw( "localStorage.setItem( _string1, _string2 )" );


