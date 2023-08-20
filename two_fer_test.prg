* ----------------------------------------------------------------------------
* Harbour Unit Test Runner [two_fer.prg]
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

* Variable declarations
memvar TESTS, SUCCESS

* Test database name
TESTS := "TESTS"

* Create tests database
do MakeTestDatabase with TESTS

* Add test data into tests database
do AddTestDatabase with TESTS, "No name given", "==", "One for you, one for me.", "TwoFer()"
do AddTestDatabase with TESTS, "A name given", "==", "One for Alice, one for me.", "TwoFer('Alice')"
do AddTestDatabase with TESTS, "Another name given", "==", "One for Bob, one for me.", "TwoFer('Bob')"
do AddTestDatabase with TESTS, "Handle arg with spaces", "==", "One for John Smith, one for me.", "TwoFer('John Smith')"
do AddTestDatabase with TESTS, "Name as empty string", "==", "One for you, one for me.", "TwoFer('')"

* Execute unit tests
SUCCESS := RunTests(TESTS)

* Return success status to OS
ERRORLEVEL(IIF(SUCCESS, 0, 1))

* Code under test (CUT)
#include "two_fer.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

