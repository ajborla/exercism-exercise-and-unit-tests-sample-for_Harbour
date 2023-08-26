* ----------------------------------------------------------------------------
* Harbour Unit Test Runner [error_handling.prg]
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

* Variable declarations
memvar TESTS, SUCCESS

* Test database name
TESTS := "TESTS"

* Create tests database
do MakeTestDatabase with TESTS

* Add test data into tests database
do AddTestDatabase with TESTS, "Correct arguments", "==", "Hello, Alice", "HandleError('Alice')"
do AddTestDatabase with TESTS, "One long argument", "==", "Hello, Alice and Bob", "HandleError('Alice and Bob')"
do AddTestDatabase with TESTS, "Incorrect arguments", "==", "NIL", "HandleError('Alice', 'Bob')"
do AddTestDatabase with TESTS, "Return error indicator with no value given", "==", "NIL", "HandleError()"
do AddTestDatabase with TESTS, "Empty argument", "==", "Hello, ", "HandleError('')"

* Execute unit tests
SUCCESS := RunTests(TESTS)

* Return success status to OS
ERRORLEVEL(IIF(SUCCESS, 0, 1))

* Code under test (CUT)
#include "error_handling.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

