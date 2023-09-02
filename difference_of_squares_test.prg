* ----------------------------------------------------------------------------
* Harbour Unit Test Runner [difference_of_squares.prg]
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

* Variable declarations
memvar TESTS, SUCCESS

* Test database name
TESTS := "TESTS"

* Create tests database
do MakeTestDatabase with TESTS

* Add test data into tests database
do AddTestDatabase with TESTS, "Square of sum 1", "==", "1", "SquareOfSum(1)"
do AddTestDatabase with TESTS, "Square of sum 5", "==", "225", "SquareOfSum(5)"
do AddTestDatabase with TESTS, "Square of sum 100", "==", "25502500", "SquareOfSum(100)"
do AddTestDatabase with TESTS, "No input should return an error", "==", "NIL", "SquareOfSum()"
do AddTestDatabase with TESTS, "Too many arguments should return an error", "==", "NIL", "SquareOfSum(1, 2, 3, 4)"
do AddTestDatabase with TESTS, "Float number input should return an error", "==", "NIL", "SquareOfSum(12.34)"
do AddTestDatabase with TESTS, "Alpha input should return an error", "==", "NIL", "SquareOfSum('abcd')"
do AddTestDatabase with TESTS, "Zero is an error", "==", "NIL", "SquareOfSum(0)"
do AddTestDatabase with TESTS, "Negative value is an error", "==", "NIL", "SquareOfSum(-1)"
do AddTestDatabase with TESTS, "Sum of squares 1", "==", "1", "SumOfSquares(1)"
do AddTestDatabase with TESTS, "Sum of squares 5", "==", "55", "SumOfSquares(5)"
do AddTestDatabase with TESTS, "Sum of squares 100", "==", "338350", "SumOfSquares(100)"
do AddTestDatabase with TESTS, "No input should return an error", "==", "NIL", "SumOfSquares()"
do AddTestDatabase with TESTS, "Too many arguments should return an error", "==", "NIL", "SumOfSquares(1, 2, 3, 4)"
do AddTestDatabase with TESTS, "Float number input should return an error", "==", "NIL", "SumOfSquares(12.34)"
do AddTestDatabase with TESTS, "Alpha input should return an error", "==", "NIL", "SumOfSquares('abcd')"
do AddTestDatabase with TESTS, "Zero is an error", "==", "NIL", "SumOfSquares(0)"
do AddTestDatabase with TESTS, "Negative value is an error", "==", "NIL", "SumOfSquares(-1)"
do AddTestDatabase with TESTS, "Difference of squares 1", "==", "0", "Difference(1)"
do AddTestDatabase with TESTS, "Difference of squares 5", "==", "170", "Difference(5)"
do AddTestDatabase with TESTS, "Difference of squares 100", "==", "25164150", "Difference(100)"
do AddTestDatabase with TESTS, "No input should return an error", "==", "NIL", "Difference()"
do AddTestDatabase with TESTS, "Too many arguments should return an error", "==", "NIL", "Difference(1, 2, 3, 4)"
do AddTestDatabase with TESTS, "Float number input should return an error", "==", "NIL", "Difference(12.34)"
do AddTestDatabase with TESTS, "Alpha input should return an error", "==", "NIL", "Difference('abcd')"
do AddTestDatabase with TESTS, "Zero is an error", "==", "NIL", "Difference(0)"
do AddTestDatabase with TESTS, "Negative value is an error", "==", "NIL", "Difference(-1)"

* Execute unit tests
SUCCESS := RunTests(TESTS)

* Return success status to OS
ERRORLEVEL(IIF(SUCCESS, 0, 1))

* Code under test (CUT)
#include "difference_of_squares.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

