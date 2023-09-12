* ----------------------------------------------------------------------------
* Harbour Date/Time Utilities
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

#define DATETIME_PRG

#ifndef UTILS_PRG
   #include "utils.prg"
#endif

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

