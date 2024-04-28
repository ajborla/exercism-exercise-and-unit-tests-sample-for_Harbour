* ----------------------------------------------------------------------------
* Harbour Unit Test Runner [armstrong_numbers.prg]
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

* Variable declarations
memvar TESTS, SUCCESS

* Test database name
TESTS := IIF(PCOUNT() > 0, hb_PValue(1), "TESTS")

* Create tests database
do MakeTestDatabase with TESTS

* Add test data into tests database
do AddTestDatabase with TESTS, "Zero is Armstrong numbers", "==", ".T.", "IsArmstrongNumber(0)"
do AddTestDatabase with TESTS, "Single digits are Armstrong numbers", "==", ".T.", "IsArmstrongNumber(5)"
do AddTestDatabase with TESTS, "There are no two digit Armstrong numbers", "==", ".F.", "IsArmstrongNumber(10)"
do AddTestDatabase with TESTS, "A three digit number that is an Armstrong number", "==", ".T.", "IsArmstrongNumber(153)"
do AddTestDatabase with TESTS, "A three digit number that is not an Armstrong number", "==", ".F.", "IsArmstrongNumber(100)"
do AddTestDatabase with TESTS, "A four digit number that is an Armstrong number", "==", ".T.", "IsArmstrongNumber(9474)"
do AddTestDatabase with TESTS, "A four digit number that is not an Armstrong number", "==", ".F.", "IsArmstrongNumber(9475)"
do AddTestDatabase with TESTS, "A seven digit number that is an Armstrong number", "==", ".T.", "IsArmstrongNumber(9926315)"
do AddTestDatabase with TESTS, "A seven digit number that is not an Armstrong number", "==", ".F.", "IsArmstrongNumber(9926314)"
do AddTestDatabase with TESTS, "No input should return an error", "==", "NIL", "IsArmstrongNumber()"
do AddTestDatabase with TESTS, "Too many arguments should return an error", "==", "NIL", "IsArmstrongNumber(5, 7, 23, 153)"
do AddTestDatabase with TESTS, "Float number input should return an error", "==", "NIL", "IsArmstrongNumber(201.54)"
do AddTestDatabase with TESTS, "Alpha input should return an error", "==", "NIL", "IsArmstrongNumber('abcd')"

* Execute unit tests. Arguments:
* - Tests database name
* - Database retention flag (.T. to not delete test database on test end)
* - JSON output flag (.T. to emit test results in JSON format [default is TAP])
SUCCESS := RunTests(TESTS, SToBool(hb_PValue(2)), SToBool(hb_PValue(3)))

* Return success status to OS
ERRORLEVEL(IIF(SUCCESS, 0, 1))

* Code under test (CUT)
#include "armstrong_numbers.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

