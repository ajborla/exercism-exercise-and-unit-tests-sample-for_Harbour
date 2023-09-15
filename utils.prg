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

*
* Given a string, and a separator string (usually a single character)
*  returns an array of separator-split tokens, or the original string
*  if separation not possible.
*
function SToArr(string, separator)
   local array := {}, i, element

   * Return untouched string if no separator, or it is not in string
   if PCOUNT() < 2 .OR. separator == NIL ; return string ; endif
   i := AT(separator, string) ; if i == 0 ; return string ; endif

   * Parse the string, extracting each element, and adding to array
   do while i <> 0
      element := LEFT(string, i - 1)
      if !EMPTY(element) ; AADD(array, element) ; endif
      string := SUBSTR(string, i + 1)
      i := AT(separator, string)
   enddo

   * Handle last element, and return array
   if !EMPTY(string) ; AADD(array, string) ; endif
return array

*
* Given an array whose elements are non-aggregate types, returns a
*  string of those elements separated by separator. If a string
*  cannot be built, an empty string is returned.
*
function ArrToS(array, separator)
   local i, element, string := "", arrlen := LEN(array)
   if PCOUNT() < 2 .OR. separator == NIL ; separator := "" ; endif
   if arrlen < 1 ; return "" ; endif
   for i := 1 to arrlen
      element := IIF(VALTYPE(array[i]) <> "C", ALLTRIM(STR(array[i])), array[i])
      string += element + separator
   next
return ;
   IIF(EMPTY(separator), string, SUBSTR(string, 1, RAT(separator, string) - 1))

