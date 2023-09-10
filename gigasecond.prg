* ----------------------------------------------------------------------------
* exercism.io
* Harbour Track Exercise: gigasecond
* Contributed: Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

function From(datetime)
   local baseseconds := ISO8601ToSeconds(datetime)
return ;
   IIF(baseseconds == NIL, ;
      NIL, ;
      SecondsToISO8601(baseseconds + 1000000000))

function ISO8601ToSeconds(datetime)
   local seconds := 0
return seconds

function SecondsToISO8601(seconds)
   local datetime := ""
return datetime

