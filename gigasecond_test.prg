* ----------------------------------------------------------------------------
* Harbour Unit Test Runner [gigasecond.prg]
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

* Variable declarations
memvar TESTS, SUCCESS

* Test database name
TESTS := "TESTS"

* Create tests database
do MakeTestDatabase with TESTS

* Add test data into tests database
do AddTestDatabase with TESTS, "Date only specificaion of time", "==", "2043-01-01T01:46:40", "From('2011-04-25')"
do AddTestDatabase with TESTS, "Second test for date only specification of time", "==", "2009-02-19T01:46:40", "From('1977-06-13')"
do AddTestDatabase with TESTS, "Third test for date only specification of time", "==", "1991-03-27T01:46:40", "From('1959-07-19')"
do AddTestDatabase with TESTS, "Full time specified", "==", "2046-10-02T23:46:40", "From('2015-01-24T22:00:00')"
do AddTestDatabase with TESTS, "Full time with day roll-over", "==", "2046-10-03T01:46:39", "From('2015-01-24T23:59:59')"
do AddTestDatabase with TESTS, "No input should return an error", "==", "NIL", "From()"
do AddTestDatabase with TESTS, "Too many arguments should return an error", "==", "NIL", "From(5, 7, 23, 153)"
do AddTestDatabase with TESTS, "Float number input should return an error", "==", "NIL", "From(201.54)"
do AddTestDatabase with TESTS, "Alpha input should return an error", "==", "NIL", "From('abcd')"

* Execute unit tests
SUCCESS := RunTests(TESTS)

* Return success status to OS
ERRORLEVEL(IIF(SUCCESS, 0, 1))

* Code under test (CUT)
#include "gigasecond.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

