* ----------------------------------------------------------------------------
* Harbour Miscellaneous Utilities
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

#define UTILS_PRG

*
* Given a string, charSet, interpreted as a set of individual characters,
*  and a string, string, returns a copy of string with all occurrences of
*  the characters in charSet, removed.
*
function RemoveCharSet(charSet, string)
   local i, clen := LEN(charSet)
   for i := 1 to clen
      string := STRTRAN(string, SUBSTR(charSet, i, 1))
   next
return string

