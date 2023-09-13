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

* Execute unit tests
SUCCESS := RunTests(TESTS)

* Return success status to OS
ERRORLEVEL(IIF(SUCCESS, 0, 1))

* Code under test (CUT)
#include "datetime.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

