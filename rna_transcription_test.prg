* ----------------------------------------------------------------------------
* Harbour Unit Test Runner [rna_transcription.prg]
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

* Variable declarations
memvar TESTS, SUCCESS

* Test database name
TESTS := "TESTS"

* Create tests database
do MakeTestDatabase with TESTS

* Add test data into tests database
do AddTestDatabase with TESTS, "Empty RNA sequence", "==", "", "Transcribe('')"
do AddTestDatabase with TESTS, "RNA complement of cytosine is guanine", "==", "G", "Transcribe('C')"
do AddTestDatabase with TESTS, "RNA complement of guanine is cytosine", "==", "C", "Transcribe('G')"
do AddTestDatabase with TESTS, "RNA complement of thymine is adenine", "==", "A", "Transcribe('T')"
do AddTestDatabase with TESTS, "RNA complement of adenine is uracil", "==", "U", "Transcribe('A')"
do AddTestDatabase with TESTS, "RNA complement", "==", "UGCACCAGAAUU", "Transcribe('ACGTGGTCTTAA')"
do AddTestDatabase with TESTS, "Handles invalid character", "==", "NIL", "Transcribe('ACGTXCTTA')"
do AddTestDatabase with TESTS, "Handles completely invalid string", "==", "NIL", "Transcribe('XXXX')"
do AddTestDatabase with TESTS, "Handles partially invalid string", "==", "NIL", "Transcribe('ACGTXCTTAA')"

* Execute unit tests
SUCCESS := RunTests(TESTS)

* Return success status to OS
ERRORLEVEL(IIF(SUCCESS, 0, 1))

* Code under test (CUT)
#include "rna_transcription.prg"

* Unit Test Framework
#include "PRGUNIT.prg"

