# exercism-exercise-and-unit-test-samples-for_Harbour
> Sample exercises, unit tests, and test library, for proposed Exercism track, Harbour

|||
| :---     | :--- |
| author:  | Anthony J. Borla |
| contact: | [ajborla@bigpond.com](ajborla@bigpond.com) |
| license: | MIT |

## Overview

## Installation
The unit test library, unit tests, and Exercism exercises, are all resident in the current repository, and require no installation.

_Harbour_, however, **does** require installation. It is available in both binary, and source form.

Here is the official download page: [Harbour Project](https://sourceforge.net/projects/harbour-project/files/)

Binaries are available for several platforms, including DOS, Windows, OS/2 (an unsuccessful attempt by IBM to market a DOS-replacement), several Linux distributions, and MacOSX. Most of these date back several years, the most recent being the Ubuntu Linux version.

Binary installation involves downloading the relevant package, and using the relevant package manager to effect installation.

If targeting a recent Linux distribution, a source-based installation is straightforward, and, in the author's view, a preferable one.

Here is an example using the official source version (later versions _are_ obtainable, refer installation instructions below). To download the source archive:

```plain
curl -sLk https://sourceforge.net/projects/harbour-project/files/source/3.0.0/harbour-3.0.0.tar.gz > harbour-3.0.0.tar.gz
```

Assuming the standard build tools (gcc, make) are installed (if not, follow instructions here: [Install Development Tools](https://ostechnix.com/install-development-tools-linux/)), then perform the following steps:

```plain
tar -xzvf harbour-3.0.0.tar.gz && cd harbour-3.0.0
make && sudo make install
```

Several components will have installed in various subdirectories (the default parent directory location is `/usr/local`), the most important of which are the binaries, `/usr/local/bin/hbrun` and `/usr/local/bin/hbmak2`.

For additional information such as how to effect an installation on Windows, please refer to the following detailed instructions: [Harbour Installation](https://www.kresin.ru/en/hrbfaq.html#Install)

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

