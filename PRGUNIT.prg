* ----------------------------------------------------------------------------
* Harbour Unit Test Worker
* Anthony J. Borla (ajborla@bigpond.com)
* ----------------------------------------------------------------------------

procedure MakeTestDatabaseStructure(dbfName)
   * Creation overwites any existing database
   create &dbfName

   * Each record describes the structure of a FIELD
   append blank
   replace Field_name with "NAME", Field_type with "C",;
           Field_Len  with 80,     Field_dec  with 0
   append blank
   replace Field_name with "CMPOP", Field_type with "C",;
           Field_Len  with 2,       Field_dec  with 0
   append blank
   replace Field_name with "EXPVALUE", Field_type with "C",;
           Field_Len  with 80,         Field_dec  with 0
   append blank
   replace Field_name with "CMDSTR", Field_type with "C",;
           Field_Len  with 80,       Field_dec  with 0

   * Ensure data written to disk
   close &dbfName
return

procedure MakeTestDatabase(dbfName)
   local dbfStructure := dbfName + "_STRUCTURE"

   * Build test database from database structure file
   do MakeTestDatabaseStructure with dbfStructure
   create &dbfName from &dbfStructure

   * Ensure database structure file is removed
   dbfStructure := dbfStructure + ".dbf"
   erase &dbfStructure
return

procedure AddTestDatabase(dbfName, testName, cmpOp, expValue, cmdStr)
   * Load a test data record into tests database
   use &dbfName
   append blank
   replace &dbfName->NAME with testName
   replace &dbfName->CMPOP with cmpOp
   replace &dbfName->EXPVALUE with expValue
   replace &dbfName->CMDSTR with cmdStr
   close &dbfName
return

function RunTests(dbfName, keepTestDBF, outputJSON)
   local testName, cmpOp, expValue, cmdStr, retValue, testExpr
   local success := .T.

   use &dbfName

   * Execute unit tests
   do while !EOF()
      * Extract test data
      testName := TRIM(&dbfName->NAME)
      cmpOp := &dbfName->CMPOP
      expValue := TRIM(&dbfName->EXPVALUE)
      cmdStr := TRIM(&dbfName->CMDSTR)

      * Execute test, and build test rexpression
      retValue := &cmdStr
      testExpr := '"' + retValue + '" ' + cmpOp + ' "' + expValue + '"'

      * If the parameter flag, outputJSON, is omitted, or set to .F., then
      *  emit test report in TAP format

      if outputJSON == NIL .OR. !outputJSON
         * Report test outcome - TAP
         if &testExpr
            ?? "OK - " + testName
         else
            * Single test failure signals failure of whole suite
            success := .F.
            ?? "FAIL - " + testName
         endif
      else
         * Report test outcome - JSON
         ? "JSON"
      endif

      * ... next test
      skip
   enddo

   close &dbfName

   * If the parameter flag, keepTestDBF, is omitted, or set to .F., then
   *  remove the tests database
   if keepTestDBF == NIL .OR. !keepTestDBF
      dbfName := dbfName + ".dbf"
      erase &dbfName
   endif

return success

