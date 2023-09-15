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

do AddTestDatabase with TESTS, "SToArr: empty string, empty separator", "==", "", "SToArr('', '')"
do AddTestDatabase with TESTS, "SToArr: empty string, no separator", "==", "", "SToArr('')"
do AddTestDatabase with TESTS, "SToArr: non-empty string with separator, empty separator", "==", "1;2;3", "SToArr('1;2;3', '')"
do AddTestDatabase with TESTS, "SToArr: non-empty string with separator, no separator", "==", "1;2;3", "SToArr('1;2;3')"
do AddTestDatabase with TESTS, "SToArr: non-empty string with separator, same separator", "==", "1;2;3", "ArrToS(SToArr('1;2;3', ';'), ';')"
do AddTestDatabase with TESTS, "SToArr: non-empty string no separator, with separator", "==", "123", "SToArr('123', ',')"
do AddTestDatabase with TESTS, "SToArr: non-empty string with separator, different separator", "==", "1;2;3", "SToArr('1;2;3', ',')"

do AddTestDatabase with TESTS, "ArrToS: empty array, no separator", "==", "", "ArrToS({}, '')"
do AddTestDatabase with TESTS, "ArrToS: empty array, default separator", "==", "", "ArrToS({})"
do AddTestDatabase with TESTS, "ArrToS: empty array, single-character separator", "==", "", "ArrToS({}, ';')"
do AddTestDatabase with TESTS, "ArrToS: numeric array, no separator", "==", "123", "ArrToS({1,2,3}, '')"
do AddTestDatabase with TESTS, "ArrToS: numeric array, default separator", "==", "123", "ArrToS({1,2,3})"
do AddTestDatabase with TESTS, "ArrToS: numeric array, single-character separator", "==", "1;2;3", "ArrToS({1,2,3}, ';')"
do AddTestDatabase with TESTS, "ArrToS: character array, no separator", "==", "abc", "ArrToS({'a','b','c'}, '')"
do AddTestDatabase with TESTS, "ArrToS: character array, default separator", "==", "abc", "ArrToS({'a','b','c'})"
do AddTestDatabase with TESTS, "ArrToS: character array, single-character separator", "==", "a;b;c", "ArrToS({'a','b','c'}, ';')"
do AddTestDatabase with TESTS, "ArrToS: character array, no separator 2", "==", ";;;", "ArrToS({';',';',';'}, '')"
do AddTestDatabase with TESTS, "ArrToS: character array, default separator 2", "==", ";;;", "ArrToS({';',';',';'})"
do AddTestDatabase with TESTS, "ArrToS: character array, single-character separator 2", "==", ";;;;;", "ArrToS({';',';',';'}, ';')"

* Execute unit tests
SUCCESS := RunTests(TESTS)

* Return success status to OS
ERRORLEVEL(IIF(SUCCESS, 0, 1))

* Code under test (CUT)
#include "utils.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

