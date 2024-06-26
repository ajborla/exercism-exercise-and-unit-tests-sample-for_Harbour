* ----------------------------------------------------------------------------
* Harbour Unit Test Runner [nucleotide_count.prg]
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

* Variable declarations
memvar TESTS, SUCCESS

* Test database name
TESTS := IIF(PCOUNT() > 0, hb_PValue(1), "TESTS")

* Create tests database
do MakeTestDatabase with TESTS

* Add test data into tests database
do AddTestDatabase with TESTS, "Empty strand", "==", "A: 0 C: 0 G: 0 T: 0", "Counts('')"
do AddTestDatabase with TESTS, "Can count one nucleotide in single-character input", "==", "A: 0 C: 0 G: 1 T: 0", "Counts('G')"
do AddTestDatabase with TESTS, "Strand with repeated nucleotide", "==", "A: 0 C: 0 G: 7 T: 0", "Counts('GGGGGGG')"
do AddTestDatabase with TESTS, "Strand with multiple nucleotides", "==", "A: 20 C: 12 G: 17 T: 21", "Counts('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC')"
do AddTestDatabase with TESTS, "Strand with invalid nucleotides", "==", "NIL", "Counts('AGXXACT')"

* Execute unit tests. Arguments:
* - Tests database name
* - Database retention flag (.T. to not delete test database on test end)
* - JSON output flag (.T. to emit test results in JSON format [default is TAP])
SUCCESS := RunTests(TESTS, SToBool(hb_PValue(2)), SToBool(hb_PValue(3)))

* Return success status to OS
ERRORLEVEL(IIF(SUCCESS, 0, 1))

* Code under test (CUT)
#include "nucleotide_count.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

