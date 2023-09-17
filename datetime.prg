* ----------------------------------------------------------------------------
* Harbour Date/Time Utilities
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

#define DATETIME_PRG

#ifndef UTILS_PRG
   #include "utils.prg"
#endif

*
* Given an integer year date component, returns its status as a
*  leap year as a Boolean value.
*
function IsLeapYear(year) ; return ;
   year % 400 == 0 .OR. (year % 4 == 0 .AND. year % 100 != 0)

*
* Given a date string in ISO8601 format, YYYY-MM-DDTHH:MM:SS, returns
*  the individual date components as an array of integer values, in
*  the order: year, month, day, hour, minute, second.
*
function ISO8601ToYMDHMS(datetime)
   local dtlen, year, month, day, hour, minute, second

   * Ensure we have a (likely) ISO8601 formatted date string
   if PCOUNT() <> 1 .OR. VALTYPE(datetime) <> "C" ; return NIL ; endif
   dtlen := LEN(datetime)
   if dtlen <> 10 .AND. dtlen <> 19 ; return NIL ; endif

   * Extract components, return as array
   * Date components always exist
   if AT("-", datetime) == 5 .AND. RAT("-", datetime) == 8
      year := SUBSTR(datetime, 1, 4)
      month := SUBSTR(datetime, 6, 2)
      day := SUBSTR(datetime, 9, 2)
      * Ensure each component is a valid integer (no range check performed)
      if !(IsINTString(year)) ; return NIL ; endif
      if !(IsINTString(month)) ; return NIL ; endif
      if !(IsINTString(day)) ; return NIL ; endif
   else
      return NIL
   endif

   * Time components are optional - assume zero values if not included
   if AT("T", datetime) == 11
      if AT(":", datetime) == 14 .AND. RAT(":", datetime) == 17
         hour := SUBSTR(datetime, 12, 2)
         minute := SUBSTR(datetime, 15, 2)
         second := SUBSTR(datetime, 18, 2)
         * Ensure each component is a valid integer (no range check performed)
         if !(IsINTString(hour)) ; return NIL ; endif
         if !(IsINTString(minute)) ; return NIL ; endif
         if !(IsINTString(second)) ; return NIL ; endif
      else
         return NIL
      endif
   else
      hour := "00"
      minute := "00"
      second := "00"
   endif

return { year, month, day, hour, minute, second }

*
* Given a date string in ISO8601 format, YYYY-MM-DDTHH:MM:SS, returns
*  an integer representing seconds before/after the Jan 1, 1970 epoch
*  date.
*
function ISO8601ToSeconds(datetime)
   local seconds := 0
return seconds

*
* Given a integer representing seconds before/after the Jan 1, 1970
*  epoch date, returns the equivalent date as a date string in ISO8061
*  format: YYYY-MM-DDTHH:MM:SS.
*
function SecondsToISO8601(seconds)
   local datetime := ""
return datetime

