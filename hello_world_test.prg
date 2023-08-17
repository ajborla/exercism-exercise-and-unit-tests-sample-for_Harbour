* ----------------------------------------------------------------------------
* Harbour Unit Test Runner [hello_world.prg]
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

* Variable declarations
memvar NAME, CMPOP, EXPVALUE, RETVALUE, CMDSTR, TESTEXPR

* Create tests database structure
do MakeTestDatabaseStructure with "TESTS_STRUCTURE"

* Create actual tests database, and load test data into it
create TESTS from TESTS_STRUCTURE
append blank
replace NAME with "Say Hi!"
replace CMPOP with "=="
replace EXPVALUE with "Hello, World!"
replace CMDSTR with "HelloWorld()"
close TESTS

* Execute unit tests
use TESTS
do while !EOF()
   * Extract test data
   NAME := TRIM(TESTS->NAME)
   CMPOP := TESTS->CMPOP
   EXPVALUE := TRIM(TESTS->EXPVALUE)
   CMDSTR := TRIM(TESTS->CMDSTR)

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
close TESTS

* Cleanup databases
erase TESTS.dbf
erase TESTS_STRUCTURE.dbf

* Code under test (CUT)
#include "hello_world.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

