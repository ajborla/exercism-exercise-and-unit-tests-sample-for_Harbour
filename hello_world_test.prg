* ----------------------------------------------------------------------------
* Harbour Unit Test Runner [hello_world.prg]
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

* Variable declarations
memvar NAME, CMPOP, EXPVALUE, RETVALUE, CMDSTR, TESTEXPR

memvar TESTS
TESTS := "TESTS"

* Create tests database
do MakeTestDatabase with TESTS

* Add test data into tests database
do AddTestDatabase with TESTS, "say Hi!", "==", "Hello, World!", "HelloWorld()"

* Execute unit tests
use &TESTS
do while !EOF()
   * Extract test data
   NAME := TRIM(&TESTS->NAME)
   CMPOP := &TESTS->CMPOP
   EXPVALUE := TRIM(&TESTS->EXPVALUE)
   CMDSTR := TRIM(&TESTS->CMDSTR)

   * Execute test, and build test rexpression
   RETVALUE := &CMDSTR
   TESTEXPR := '"' + RETVALUE + '" ' + CMPOP + ' "' + EXPVALUE + '"'

   * Report test outcome
   if &TESTEXPR
      ?? "OK - " + NAME
   else
      ?? "FAIL - " + NAME
   endif

   * ... next test
   skip
enddo
close &TESTS

* Cleanup databases
TESTS := TESTS + ".dbf"
erase &TESTS

* Code under test (CUT)
#include "hello_world.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

