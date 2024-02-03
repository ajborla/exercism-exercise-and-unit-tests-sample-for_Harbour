# exercism-exercise-and-unit-test-samples-for_Harbour
> Sample exercises, unit tests, and test library, for proposed Exercism track, Harbour

|||
| :---     | :--- |
| author:  | Anthony J. Borla |
| contact: | [ajborla@bigpond.com](ajborla@bigpond.com) |
| license: | MIT |

## Overview
## Installation

## Usage
Assuming command-line operation, and that the current directory points to a clone of this repository, the unit tests for an exercise, for example, the `leap` exercise, may be effected by invoking the `hbrun` binary, like so:

```plain
hbrun leap_test.prg
```

A successful execution will see generation of the following output:

```plain
OK - Year not divisible by 4: common year
OK - Year divisible by 2, not divisible by 4 in common year
OK - Year divisible by 4, not divisible by 100: leap year
OK - Year divisible by 4 and 5 is still a leap year
OK - Year divisible by 100, not divisible by 400: common year
OK - Year divisible by 100 but not by 3 is still not a leap year
OK - Year divisible by 400: leap year
OK - Year divisible by 400 but not by 125 is still a leap year
OK - Year divisible by 200, not divisible by 400 in common year
```
Continuing the current example, `leap.prg`, is the exercise file, and, of course, `leap_test.prg` is the test file, and is structured as follows:

```plain
* Variable declarations
memvar TESTS, SUCCESS

* Test database name
TESTS := "TESTS"

* Create tests database
do MakeTestDatabase with TESTS

* Add test data into tests database
do AddTestDatabase with TESTS, "Year not divisible by 4: common year", "==", ".F.", "LeapYear(2015)"
do AddTestDatabase with TESTS, "Year divisible by 2, not divisible by 4 in common year", "==", ".F.", "LeapYear(1970)"
do AddTestDatabase with TESTS, "Year divisible by 4, not divisible by 100: leap year", "==", ".T.", "LeapYear(1996)"
do AddTestDatabase with TESTS, "Year divisible by 4 and 5 is still a leap year", "==", ".T.", "LeapYear(1960)"
do AddTestDatabase with TESTS, "Year divisible by 100, not divisible by 400: common year", "==", ".F.", "LeapYear(2100)"
do AddTestDatabase with TESTS, "Year divisible by 100 but not by 3 is still not a leap year", "==", ".F.", "LeapYear(1900)"
do AddTestDatabase with TESTS, "Year divisible by 400: leap year", "==", ".T.", "LeapYear(2000)"
do AddTestDatabase with TESTS, "Year divisible by 400 but not by 125 is still a leap year", "==", ".T.", "LeapYear(2400)"
do AddTestDatabase with TESTS, "Year divisible by 200, not divisible by 400 in common year", "==", ".F.", "LeapYear(1800)"

* Execute unit tests
SUCCESS := RunTests(TESTS)

* Return success status to OS
ERRORLEVEL(IIF(SUCCESS, 0, 1))

* Code under test (CUT)
#include "leap.prg"

* Unit Test Framework
#include "PRGUNIT.prg"
```

The flow of control should be quite evident:
* A database containing the unit test parameters is created
* All unit tests in that database are serially executed
* A _success_ status is returned to the operating system, so assisting testing automation

Note that tests may be easily commented out, modified, and new tests added.

Note, also, that both the code under test (CUT), and unit test library source code, are included in the test file, as would any user-supplied utility files, should they be required.

The CUT source file may include procedures and functions in addition to the test function, but cannot contain global variables (these would need to be at the top of the test file).

## Acknowledgements
The author frequently referred to, and adapted, the unit tests in the [Exercism Bash Track](https://exercism.org/tracks/bash). Many thanks to the authors of those tests for their work, particularly, the clarity of test names, and the addition of extra tests.

More generally, thanks to the volunteers who have, and continue to, develop _Harbour_, as well as those enthusiasts writing and hosting _Harbour_ code and documentary resources, so helping to keep a historically rich, and important, legacy, alive into the 21st Century.

## TODO
Assuming acceptance of this proposal, commence working on the newly-created repositories:

`https://github.com/exercism/harbour`

and:

`https://github.com/exercism/harbour-test-runner`

The author expects to effect the transference of current repository contents to the new track.

However, should there be interest, welcomes contributions in the form of new exercises. These should be quite straightforward to implement since committed exercises may be used as templates.

