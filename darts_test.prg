* ----------------------------------------------------------------------------
* Harbour Unit Test Runner [darts.prg]
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

* Variable declarations
memvar TESTS, SUCCESS

* Test database name
TESTS := "TESTS"

* Create tests database
do MakeTestDatabase with TESTS

* Add test data into tests database
do AddTestDatabase with TESTS, "Missed target", "==", "0", "Score(-9, 9)"
do AddTestDatabase with TESTS, "On the outer circle", "==", "1", "Score(0, 10)"
do AddTestDatabase with TESTS, "On the middle circle", "==", "5", "Score(-5, 0)"
do AddTestDatabase with TESTS, "On the inner circle", "==", "10", "Score(0, -1)"
do AddTestDatabase with TESTS, "Exactly on centre", "==", "10", "Score(0, 0)"
do AddTestDatabase with TESTS, "Near the centre", "==", "10", "Score(-0.1, -0.1)"
do AddTestDatabase with TESTS, "Just within the inner circle", "==", "10", "Score(0.7, 0.7)"
do AddTestDatabase with TESTS, "Just outside the inner circle", "==", "5", "Score(0.8, -0.8)"
do AddTestDatabase with TESTS, "Just within the middle circle", "==", "5", "Score(-3.5, 3.5)"
do AddTestDatabase with TESTS, "Just outside the middle circle", "==", "1", "Score(-3.6, -3.6)"
do AddTestDatabase with TESTS, "Just within the outer circle", "==", "1", "Score(-7.0, 7.0)"
do AddTestDatabase with TESTS, "Just outside the outer circle", "==", "0", "Score(7.1, -7.1)"
do AddTestDatabase with TESTS, "Asymmetric position between the inner and middle circles", "==", "5", "Score(0.5, -4)"

* Execute unit tests
SUCCESS := RunTests(TESTS)

* Return success status to OS
ERRORLEVEL(IIF(SUCCESS, 0, 1))

* Code under test (CUT)
#include "darts.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

