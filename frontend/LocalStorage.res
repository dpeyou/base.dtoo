// REFERENCES
// https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage
// https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API/Using_the_Web_Storage_API

/*
localStorage is similar to sessionStorage, except that while localStorage data has no expiration time, sessionStorage data gets cleared when the page session ends — that is, when the page is closed. (localStorage data for a document loaded in a "private browsing" or "incognito" session is cleared when the last "private" tab is closed.)
*/

let clear: unit => unit = () => %raw( "localStorage.clear()" );

let getItem: string => string = _string => %raw( "localStorage.getItem( _string )" );

let removeItem: string => unit = _string => %raw( "localStorage.removeItem( _string )" );

let setItem: (string, string) => unit = ( _string1, _string2 ) => %raw( "localStorage.setItem( _string1, _string2 )" );


