* ----------------------------------------------------------------------------
* Harbour Unit Test Runner [leap.prg]
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

* Variable declarations
memvar TESTS, SUCCESS

* Test database name
TESTS := IIF(PCOUNT() > 0, hb_PValue(1), "TESTS")

* Create tests database
do MakeTestDatabase with TESTS

* Add test data into tests database
do AddTestDatabase with TESTS, "Year not divisible by 4: common year", "==", ".F.", "LeapYear(2015)"
do AddTestDatabase with TESTS, "Year divisible by 2, not divisible by 4 in common year", "==", ".F.", "LeapYear(1970)"
do AddTestDatabase with TESTS, "Year divisible by 4, not divisible by 100: leap year", "==", ".T.", "LeapYear(1996)"
do AddTestDatabase with TESTS, "Year divisible by 4 and 5 is still a leap year", "==", ".T.", "LeapYear(1960)"
do AddTestDatabase with TESTS, "Year divisible by 100, not divisible by 400: common year", "==", ".F.", "LeapYear(2100)"
do AddTestDatabase with TESTS, "Year divisible by 100 but not by 3 is still not a leap year", "==", ".F.", "LeapYear(1900)"
do AddTestDatabase with TESTS, "Year divisible by 400: leap year", "==", ".T.", "LeapYear(2000)"
do AddTestDatabase with TESTS, "Year divisible by 400 but not by 125 is still a leap year", "==", ".T.", "LeapYear(2400)"
do AddTestDatabase with TESTS, "Year divisible by 200, not divisible by 400 in common year", "==", ".F.", "LeapYear(1800)"

* Execute unit tests. Arguments:
* - Tests database name
* - Database retention flag (.T. to not delete test database on test end)
* - JSON output flag (.T. to emit test results in JSON format [default is TAP])
SUCCESS := RunTests(TESTS, SToBool(hb_PValue(2)), SToBool(hb_PValue(3)))

* Return success status to OS
ERRORLEVEL(IIF(SUCCESS, 0, 1))

* Code under test (CUT)
#include "leap.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

