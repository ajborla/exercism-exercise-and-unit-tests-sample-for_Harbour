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

