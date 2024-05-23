* ----------------------------------------------------------------------------
* Harbour Unit Test Runner [utils.prg]
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

* Variable declarations
memvar TESTS, SUCCESS

* Test database name
TESTS := IIF(PCOUNT() > 0, hb_PValue(1), "TESTS")

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
do AddTestDatabase with TESTS, "SToArr: non-empty string no separator, no separator", "==", "123", "SToArr('123')"
do AddTestDatabase with TESTS, "SToArr: non-empty string no separator, with separator", "==", "123", "SToArr('123', '')"
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

do AddTestDatabase with TESTS, "IsINTString: no argument", "==", ".F.", "IsIntString()"
do AddTestDatabase with TESTS, "IsINTString: empty string argument", "==", ".F.", "IsIntString('')"
do AddTestDatabase with TESTS, "IsINTString: numeric argument", "==", ".F.", "IsIntString(77)"
do AddTestDatabase with TESTS, "IsINTString: non-digit in string 1", "==", ".F.", "IsIntString('00T')"
do AddTestDatabase with TESTS, "IsINTString: non-digit in string 2", "==", ".F.", "IsIntString('T01')"
do AddTestDatabase with TESTS, "IsINTString: non-digit in string 3", "==", ".F.", "IsIntString('T11')"
do AddTestDatabase with TESTS, "IsINTString: non-digit in string 5", "==", ".F.", "IsIntString('1.T')"
do AddTestDatabase with TESTS, "IsINTString: floating point string", "==", ".F.", "IsIntString('1.1')"
do AddTestDatabase with TESTS, "IsINTString: single digit string", "==", ".T.", "IsIntString('1')"
do AddTestDatabase with TESTS, "IsINTString: multi digit string", "==", ".T.", "IsIntString('12')"
do AddTestDatabase with TESTS, "IsINTString: multi digit with zero string 1", "==", ".T.", "IsIntString('001')"
do AddTestDatabase with TESTS, "IsINTString: multi digit with zero string 2", "==", ".T.", "IsIntString('010')"
do AddTestDatabase with TESTS, "IsINTString: multi digit with zero string 3", "==", ".T.", "IsIntString('100')"
do AddTestDatabase with TESTS, "IsINTString: multi digit with zero string 4", "==", ".T.", "IsIntString('000')"

do AddTestDatabase with TESTS, "SToBool: no argument", "==", "NIL", "SToBool()"
do AddTestDatabase with TESTS, "SToBool: empty string argument", "==", "NIL", "SToBool('')"
do AddTestDatabase with TESTS, "SToBool: .T. argument", "==", ".T.", "SToBool('.T.')"
do AddTestDatabase with TESTS, "SToBool: .t. argument", "==", ".T.", "SToBool('.t.')"
do AddTestDatabase with TESTS, "SToBool: .F. argument", "==", ".F.", "SToBool('.F.')"
do AddTestDatabase with TESTS, "SToBool: .f. argument", "==", ".F.", "SToBool('.f.')"
do AddTestDatabase with TESTS, "SToBool: TRUE argument", "==", ".T.", "SToBool('TRUE')"
do AddTestDatabase with TESTS, "SToBool: true argument", "==", ".T.", "SToBool('true')"
do AddTestDatabase with TESTS, "SToBool: FALSE argument", "==", ".F.", "SToBool('FALSE')"
do AddTestDatabase with TESTS, "SToBool: false argument", "==", ".F.", "SToBool('false')"

* Execute unit tests. Arguments:
* - Tests database name
* - Database retention flag (.T. to not delete test database on test end)
* - JSON output flag (.T. to emit test results in JSON format [default is TAP])
SUCCESS := RunTests(TESTS, SToBool(hb_PValue(2)), SToBool(hb_PValue(3)))

* Return success status to OS
ERRORLEVEL(IIF(SUCCESS, 0, 1))

* Code under test (CUT)
#include "utils.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

