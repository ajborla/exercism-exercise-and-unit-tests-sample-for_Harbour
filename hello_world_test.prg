* ----------------------------------------------------------------------------
* Harbour Unit Test Runner [hello_world.prg]
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

* Variable declarations
memvar NAME, CMPOP, EXPVALUE, RETVALUE, CMDSTR, TESTEXPR

memvar TESTS
TESTS := "TESTX"

* Create tests database
do MakeTestDatabase with TESTS

* Load test data into tests database
use &TESTS
append blank
replace NAME with "Say Hi!"
replace CMPOP with "=="
replace EXPVALUE with "Hello, World!"
replace CMDSTR with "HelloWorld()"
close &TESTS

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

