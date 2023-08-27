* ----------------------------------------------------------------------------
* Harbour Unit Test Runner [hamming.prg]
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

* Variable declarations
memvar TESTS, SUCCESS

* Test database name
TESTS := "TESTS"

* Create tests database
do MakeTestDatabase with TESTS

* Add test data into tests database
do AddTestDatabase with TESTS, "Empty strands", "==", "0", "Distance('', '')"
do AddTestDatabase with TESTS, "Single letter identical strands", "==", "0", "Distance('A', 'A')"
do AddTestDatabase with TESTS, "Single letter different strands", "==", "1", "Distance('G', 'T')"
do AddTestDatabase with TESTS, "Long identical strands", "==", "0", "Distance('GGACTGAAATCTG', 'GGACTGAAATCTG')"
do AddTestDatabase with TESTS, "Long different strands", "==", "9", "Distance('GGACGGATTCTG', 'AGGACGGATTCT')"
do AddTestDatabase with TESTS, "No input should return an error", "==", "NIL", "Distance()"
do AddTestDatabase with TESTS, "Too many arguments should return an error", "==", "NIL", "Distance(12, 4562, 4566)"
do AddTestDatabase with TESTS, "Too few arguments should return an error", "==", "NIL", "Distance(16)"
do AddTestDatabase with TESTS, "Unequal length strands (1) should return an error", "==", "NIL", "Distance('', 'G')"
do AddTestDatabase with TESTS, "Unequal length strands (2) should return an error", "==", "NIL", "Distance('G', '')"

* Execute unit tests
SUCCESS := RunTests(TESTS)

* Return success status to OS
ERRORLEVEL(IIF(SUCCESS, 0, 1))

* Code under test (CUT)
#include "hamming.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

