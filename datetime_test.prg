* ----------------------------------------------------------------------------
* Harbour Unit Test Runner [datetime.prg]
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

* Variable declarations
memvar TESTS, SUCCESS

* Test database name
TESTS := IIF(PCOUNT() > 0, hb_PValue(1), "TESTS")

* Create tests database
do MakeTestDatabase with TESTS

* Add test data into tests database
do AddTestDatabase with TESTS, "IsLeapYear: negative year", "==", ".F.", "IsLeapYear(-1)"
do AddTestDatabase with TESTS, "IsLeapYear: year zero", "==", ".T.", "IsLeapYear(0)"
do AddTestDatabase with TESTS, "IsLeapYear: year 1800", "==", ".F.", "IsLeapYear(1800)"
do AddTestDatabase with TESTS, "IsLeapYear: year 1900", "==", ".F.", "IsLeapYear(1900)"
do AddTestDatabase with TESTS, "IsLeapYear: year 1996", "==", ".T.", "IsLeapYear(1996)"
do AddTestDatabase with TESTS, "IsLeapYear: year 1997", "==", ".F.", "IsLeapYear(1997)"

do AddTestDatabase with TESTS, "ISO8601ToYMDHMS: missing argument", "==", "NIL", "ISO8601ToYMDHMS()"
do AddTestDatabase with TESTS, "ISO8601ToYMDHMS: empty argument", "==", "NIL", "ISO8601ToYMDHMS('')"
do AddTestDatabase with TESTS, "ISO8601ToYMDHMS: valid argument, date only", "==", "20150124000000", "ISO8601ToYMDHMS('2015-01-24')"
do AddTestDatabase with TESTS, "ISO8601ToYMDHMS: valid argument, datetime, zero time", "==", "20150124000000", "ISO8601ToYMDHMS('2015-01-24T00:00:00')"
do AddTestDatabase with TESTS, "ISO8601ToYMDHMS: valid argument, datetime, full", "==", "20150124223427", "ISO8601ToYMDHMS('2015-01-24T22:34:27')"
do AddTestDatabase with TESTS, "ISO8601ToYMDHMS: invalid argument, datetime full", "==", "NIL", "ISO8601ToYMDHMS('2015-0I-24T22:34:27')"
do AddTestDatabase with TESTS, "ISO8601ToYMDHMS: invalid argument, datetime full", "==", "NIL", "ISO8601ToYMDHMS('2015/01/24T22:34:27')"

do AddTestDatabase with TESTS, "YMDHMSToISO8601: missing argument", "==", "NIL", "YMDHMSToISO8601()"
do AddTestDatabase with TESTS, "YMDHMSToISO8601: empty argument", "==", "NIL", "YMDHMSToISO8601('')"
do AddTestDatabase with TESTS, "YMDHMSToISO8601: valid argument, datetime, char array", "==", "2015-01-24T00:00:00", "YMDHMSToISO8601({'2015','01','24','00','00','00'})"
do AddTestDatabase with TESTS, "YMDHMSToISO8601: valid argument, datetime, number array", "==", "2015-01-24T00:00:00", "YMDHMSToISO8601({2015,1,24,0,0,0})"
do AddTestDatabase with TESTS, "YMDHMSToISO8601: valid argument, datetime, full", "==", "2015-01-24T22:34:27", "YMDHMSToISO8601({'2015','01','24','22','34','27'})"
do AddTestDatabase with TESTS, "YMDHMSToISO8601: invalid argument, datetime full", "==", "NIL", "YMDHMSToISO8601({'2015','0I','24','22','34','27'})"

do AddTestDatabase with TESTS, "YMDHMSToSeconds: missing argument", "==", "NIL", "YMDHMSToSeconds()"
do AddTestDatabase with TESTS, "YMDHMSToSeconds: empty argument", "==", "NIL", "YMDHMSToSeconds('')"
do AddTestDatabase with TESTS, "YMDHMSToSeconds: valid argument, datetime, char array", "==", "1422057600", "YMDHMSToSeconds({'2015','01','24','00','00','00'})"
do AddTestDatabase with TESTS, "YMDHMSToSeconds: valid argument, datetime, number array", "==", "1422057600", "YMDHMSToSeconds({2015,1,24,0,0,0})"
do AddTestDatabase with TESTS, "YMDHMSToSeconds: valid argument, datetime, full", "==", "1422138867", "YMDHMSToSeconds({'2015','01','24','22','34','27'})"
do AddTestDatabase with TESTS, "YMDHMSToSeconds: invalid argument, datetime full", "==", "NIL", "YMDHMSToSeconds({'2015','0I','24','22','34','27'})"

do AddTestDatabase with TESTS, "SecondsToYMDHMS: missing argument", "==", "NIL", "SecondsToYMDHMS()"
do AddTestDatabase with TESTS, "SecondsToYMDHMS: missing argument", "==", "NIL", "SecondsToYMDHMS('')"
do AddTestDatabase with TESTS, "SecondsToYMDHMS: zero epoch seconds", "==", "19700101000000", "SecondsToYMDHMS(0)"
do AddTestDatabase with TESTS, "SecondsToYMDHMS: positive epoch seconds 1", "==", "20150124000000", "SecondsToYMDHMS(1422057600)"
do AddTestDatabase with TESTS, "SecondsToYMDHMS: negative epoch seconds 1", "==", "19241209000000", "SecondsToYMDHMS(-1422057600)"
do AddTestDatabase with TESTS, "SecondsToYMDHMS: positive epoch seconds 2", "==", "20150124223427", "SecondsToYMDHMS(1422138867)"
do AddTestDatabase with TESTS, "SecondsToYMDHMS: negative epoch seconds 2", "==", "19241208012533", "SecondsToYMDHMS(-1422138867)"

do AddTestDatabase with TESTS, "ISO8601ToSeconds: missing argument", "==", "NIL", "ISO8601ToSeconds()"
do AddTestDatabase with TESTS, "ISO8601ToSeconds: empty argument", "==", "NIL", "ISO8601ToSeconds('')"
do AddTestDatabase with TESTS, "ISO8601ToSeconds: valid argument, date only", "==", "1422057600", "ISO8601ToSeconds('2015-01-24')"
do AddTestDatabase with TESTS, "ISO8601ToSeconds: valid argument, datetime, zero time", "==", "1422136800", "ISO8601ToSeconds('2015-01-24T22:00:00')"
do AddTestDatabase with TESTS, "ISO8601ToSeconds: valid argument, datetime, full", "==", "1422138867", "ISO8601ToSeconds('2015-01-24T22:34:27')"
do AddTestDatabase with TESTS, "ISO8601ToSeconds: invalid argument, datetime full", "==", "NIL", "ISO8601ToSeconds('2015-0I-24T22:34:27')"
do AddTestDatabase with TESTS, "ISO8601ToSeconds: invalid argument, datetime full", "==", "NIL", "ISO8601ToSeconds('2015/01/24T22:34:27')"

do AddTestDatabase with TESTS, "SecondsToISO8601: missing argument", "==", "NIL", "SecondsToISO8601()"
do AddTestDatabase with TESTS, "SecondsToISO8601: missing argument", "==", "NIL", "SecondsToISO8601('')"
do AddTestDatabase with TESTS, "SecondsToISO8601: zero epoch seconds", "==", "1970-01-01T00:00:00", "SecondsToISO8601(0)"
do AddTestDatabase with TESTS, "SecondsToISO8601: positive epoch seconds 1", "==", "2015-01-24T00:00:00", "SecondsToISO8601(1422057600)"
do AddTestDatabase with TESTS, "SecondsToISO8601: negative epoch seconds 1", "==", "1924-12-09T00:00:00", "SecondsToISO8601(-1422057600)"
do AddTestDatabase with TESTS, "SecondsToISO8601: positive epoch seconds 2", "==", "2015-01-24T22:34:27", "SecondsToISO8601(1422138867)"
do AddTestDatabase with TESTS, "SecondsToISO8601: negative epoch seconds 2", "==", "1924-12-08T01:25:33", "SecondsToISO8601(-1422138867)"

* Execute unit tests. Arguments:
* - Tests database name
* - Database retention flag (.T. to not delete test database on test end)
* - JSON output flag (.T. to emit test results in JSON format [default is TAP])
SUCCESS := RunTests(TESTS, SToBool(hb_PValue(2)), SToBool(hb_PValue(3)))

* Return success status to OS
ERRORLEVEL(IIF(SUCCESS, 0, 1))

* Code under test (CUT)
#include "datetime.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

