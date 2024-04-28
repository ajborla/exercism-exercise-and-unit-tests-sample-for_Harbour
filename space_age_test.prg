* ----------------------------------------------------------------------------
* Harbour Unit Test Runner [space_age.prg]
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

* Variable declarations
memvar TESTS, SUCCESS

* Test database name
TESTS := IIF(PCOUNT() > 0, hb_PValue(1), "TESTS")

* Create tests database
do MakeTestDatabase with TESTS

* Add test data into tests database
do AddTestDatabase with TESTS, "Age on Earth", "==", "31.69", "AgeYearsOn('earth', 1000000000)"
do AddTestDatabase with TESTS, "Age on Mercury", "==", "280.88", "AgeYearsOn('mercury', 2134835688)"
do AddTestDatabase with TESTS, "Age on Venus", "==", "9.78", "AgeYearsOn('venus', 189839836)"
do AddTestDatabase with TESTS, "Age on Mars", "==", "35.88", "AgeYearsOn('mars', 2129871239)"
do AddTestDatabase with TESTS, "Age on Jupiter", "==", "2.41", "AgeYearsOn('jupiter', 901876382)"
do AddTestDatabase with TESTS, "Age on Saturn", "==", "2.15", "AgeYearsOn('saturn', 2000000000)"
do AddTestDatabase with TESTS, "Age on Uranus", "==", "0.46", "AgeYearsOn('uranus', 1210123456)"
do AddTestDatabase with TESTS, "Age on Neptune", "==", "0.35", "AgeYearsOn('neptune', 1821023456)"
do AddTestDatabase with TESTS, "Not a planet", "==", "NIL", "AgeYearsOn('sun', 680804807)"
do AddTestDatabase with TESTS, "No input should return an error", "==", "NIL", "AgeYearsOn()"
do AddTestDatabase with TESTS, "Too many arguments should return an error", "==", "NIL", "AgeYearsOn(16, 45, 66)"
do AddTestDatabase with TESTS, "Float number input should return an error", "==", "NIL", "AgeYearsOn('earth', 20.54)"
do AddTestDatabase with TESTS, "Alpha input should return an error", "==", "NIL", "AgeYearsOn('earth', 'abcd')"
do AddTestDatabase with TESTS, "Zero is an error", "==", "NIL", "AgeYearsOn('earth', 0)"
do AddTestDatabase with TESTS, "Negative value is an error", "==", "NIL", "AgeYearsOn('earth', -15)"

* Execute unit tests. Arguments:
* - Tests database name
* - Database retention flag (.T. to not delete test database on test end)
* - JSON output flag (.T. to emit test results in JSON format [default is TAP])
SUCCESS := RunTests(TESTS, SToBool(hb_PValue(2)), SToBool(hb_PValue(3)))

* Return success status to OS
ERRORLEVEL(IIF(SUCCESS, 0, 1))

* Code under test (CUT)
#include "space_age.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

