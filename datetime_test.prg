* ----------------------------------------------------------------------------
* Harbour Unit Test Runner [datetime.prg]
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

* Variable declarations
memvar TESTS, SUCCESS

* Test database name
TESTS := "TESTS"

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

* Execute unit tests
SUCCESS := RunTests(TESTS)

* Return success status to OS
ERRORLEVEL(IIF(SUCCESS, 0, 1))

* Code under test (CUT)
#include "datetime.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

