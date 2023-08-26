* ----------------------------------------------------------------------------
* Harbour Unit Test Runner [reverse_string.prg]
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

* Variable declarations
memvar TESTS, SUCCESS

* Test database name
TESTS := "TESTS"

* Create tests database
do MakeTestDatabase with TESTS

* Add test data into tests database
do AddTestDatabase with TESTS, "Empty string", "==", "", "ReverseString('')"
do AddTestDatabase with TESTS, "A word", "==", "tobor", "ReverseString('robot')"
do AddTestDatabase with TESTS, "A capitalised word", "==", "nemaR", "ReverseString('Ramen')"
do AddTestDatabase with TESTS, "A sentence with punctuation", "==", "!yrgnuh m'I", "ReverseString('I'+CHR(39)+'m hungry!')"
do AddTestDatabase with TESTS, "A palindrome", "==", "racecar", "ReverseString('racecar')"
do AddTestDatabase with TESTS, "An even-sized word", "==", "reward", "ReverseString('drawer')"
do AddTestDatabase with TESTS, "Missing string should return an error", "==", "NIL", "ReverseString()"
do AddTestDatabase with TESTS, "Too many arguments should return an error", "==", "NIL", "ReverseString(12, 4562, 4566)"

* Execute unit tests
SUCCESS := RunTests(TESTS)

* Return success status to OS
ERRORLEVEL(IIF(SUCCESS, 0, 1))

* Code under test (CUT)
#include "reverse_string.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

