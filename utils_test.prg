* ----------------------------------------------------------------------------
* Harbour Unit Test Runner [utils.prg]
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

* Variable declarations
memvar TESTS, SUCCESS

* Test database name
TESTS := "TESTS"

* Create tests database
do MakeTestDatabase with TESTS

* Add test data into tests database
do AddTestDatabase with TESTS, "RemoveCharSet: empty charset from empty string", "==", "", "RemoveCharSet('', '')"
do AddTestDatabase with TESTS, "RemoveCharSet: empty charset from non-empty string", "==", "abCD89", "RemoveCharSet('', 'abCD89')"
do AddTestDatabase with TESTS, "RemoveCharSet: single-character charset from non-empty string 1", "==", "abC89", "RemoveCharSet('D', 'abCD89')"
do AddTestDatabase with TESTS, "RemoveCharSet: single-character charset from non-empty string 2", "==", "abCD89", "RemoveCharSet('7', 'abCD89')"
do AddTestDatabase with TESTS, "RemoveCharSet: single-character charset from empty string", "==", "", "RemoveCharSet('D', '')"
do AddTestDatabase with TESTS, "RemoveCharSet: multi-character charset from non-empty string 1", "==", "aCD9", "RemoveCharSet('8b', 'abCD89')"
do AddTestDatabase with TESTS, "RemoveCharSet: multi-character charset from non-empty string 2", "==", "abCD89", "RemoveCharSet('70', 'abCD89')"
do AddTestDatabase with TESTS, "RemoveCharSet: multi-character charset from empty string", "==", "", "RemoveCharSet('8b', '')"
do AddTestDatabase with TESTS, "RemoveCharSet: multi-character charset from non-empty string 3", "==", "", "RemoveCharSet('98DCba', 'abCD89')"
do AddTestDatabase with TESTS, "RemoveCharSet: multi-character charset from non-empty string 4", "==", "", "RemoveCharSet('Da9C8b', 'abCD89')"

* Execute unit tests
SUCCESS := RunTests(TESTS)

* Return success status to OS
ERRORLEVEL(IIF(SUCCESS, 0, 1))

* Code under test (CUT)
#include "utils.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

