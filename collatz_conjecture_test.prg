* ----------------------------------------------------------------------------
* Harbour Unit Test Runner [collatz_conjecture.prg]
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

* Variable declarations
memvar TESTS, SUCCESS

* Test database name
TESTS := "TESTS"

* Create tests database
do MakeTestDatabase with TESTS

* Add test data into tests database
do AddTestDatabase with TESTS, "Zero steps for one", "==", "0", "Steps(1)"
do AddTestDatabase with TESTS, "Divide if even", "==", "4", "Steps(16)"
do AddTestDatabase with TESTS, "Even and odd steps", "==", "9", "Steps(12)"
do AddTestDatabase with TESTS, "Large number of even and odd steps", "==", "152", "Steps(1000000)"
do AddTestDatabase with TESTS, "No input should return an error", "==", "NIL", "Steps()"
do AddTestDatabase with TESTS, "Too many arguments should return an error", "==", "NIL", "Steps(16, 45, 66)"
do AddTestDatabase with TESTS, "Float number input should return an error", "==", "NIL", "Steps(20.54)"
do AddTestDatabase with TESTS, "Alpha input should return an error", "==", "NIL", "Steps('abcd')"
do AddTestDatabase with TESTS, "Zero is an error", "==", "NIL", "Steps(0)"
do AddTestDatabase with TESTS, "Negative value is an error", "==", "NIL", "Steps(-15)"

* Execute unit tests
SUCCESS := RunTests(TESTS)

* Return success status to OS
ERRORLEVEL(IIF(SUCCESS, 0, 1))

* Code under test (CUT)
#include "collatz_conjecture.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

