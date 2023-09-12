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

#include "datetime.prg"

