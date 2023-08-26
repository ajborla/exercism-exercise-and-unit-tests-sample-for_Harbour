* ----------------------------------------------------------------------------
* Harbour Unit Test Runner [isogram.prg]
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

* Variable declarations
memvar TESTS, SUCCESS

* Test database name
TESTS := "TESTS"

* Create tests database
do MakeTestDatabase with TESTS

* Add test data into tests database
do AddTestDatabase with TESTS, "Empty string", "==", ".T.", "IsIsogram('')"
do AddTestDatabase with TESTS, "Isogram with only lower case characters", "==", ".T.", "IsIsogram('isogram')"
do AddTestDatabase with TESTS, "Word with one duplicated character", "==", ".F.", "IsIsogram('eleven')"
do AddTestDatabase with TESTS, "Word with one duplicated character from the end of the alphabet", "==", ".F.", "IsIsogram('zzyzx')"
do AddTestDatabase with TESTS, "Longest reported english isogram", "==", ".T.", "IsIsogram('subdermatoglyphic')"
do AddTestDatabase with TESTS, "Word with duplicated character in mixed case", "==", ".F.", "IsIsogram('Alphabet')"
do AddTestDatabase with TESTS, "Hypothetical isogrammic word with hyphen", "==", ".T.", "IsIsogram('thumbscrew-japingly')"
do AddTestDatabase with TESTS, "Isogram with duplicated hyphen", "==", ".T.", "IsIsogram('six-year-old')"
do AddTestDatabase with TESTS, "Hypothetical word with duplicated character following hyphen", "==", ".F.", "IsIsogram('thumbscrew-jappingly')"
do AddTestDatabase with TESTS, "Made-up name that is an isogram", "==", ".T.", "IsIsogram('Emily Jung Schwartzkopf')"
do AddTestDatabase with TESTS, "Duplicated character in the middle", "==", ".F.", "IsIsogram('accentor')"
do AddTestDatabase with TESTS, "Word with duplicated character in mixed case, lowercase first", "==", ".F.", "IsIsogram('alphAbet')"
do AddTestDatabase with TESTS, "Same first and last characters", "==", ".F.", "IsIsogram('angola')"
do AddTestDatabase with TESTS, "Word with duplicated character and with two hyphens", "==", ".F.", "IsIsogram('up-to-date')"
do AddTestDatabase with TESTS, "No input should return an error", "==", "NIL", "IsIsogram()"
do AddTestDatabase with TESTS, "Too many arguments should return an error", "==", "NIL", "IsIsogram(12, 4562, 4566)"

* Execute unit tests
SUCCESS := RunTests(TESTS)

* Return success status to OS
ERRORLEVEL(IIF(SUCCESS, 0, 1))

* Code under test (CUT)
#include "isogram.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

