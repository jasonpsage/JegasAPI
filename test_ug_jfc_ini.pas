{=============================================================================
|    _________ _______  _______  ______  _______             Get out of the  |
|   /___  ___// _____/ / _____/ / __  / / _____/               Mainstream... |
|      / /   / /__    / / ___  / /_/ / / /____                Jump into the  |
|     / /   / ____/  / / /  / / __  / /____  /                   Jetstream   |
|____/ /   / /___   / /__/ / / / / / _____/ /                                |
/_____/   /______/ /______/ /_/ /_/ /______/                                 |
|         Virtually Everything IT(tm)                         info@jegas.com |
==============================================================================
                       Copyright(c)2016 Jegas, LLC
=============================================================================}


//=============================================================================
{ }
// Test the JFC_INI class functionality.
program test_ug_jfc_ini;
//=============================================================================

//=============================================================================
// Global Directives
//=============================================================================
{$INCLUDE i_jegas_splash.pp}
{$INCLUDE i_jegas_macros.pp}
{$DEFINE SOURCEFILE:='test_ug_jfc_ini.pas'}
{$SMARTLINK ON}
{$PACKRECORDS 4}
{$MODE objfpc}
//=============================================================================



//=============================================================================
uses 
//=============================================================================
  ug_jfc_ini;
//=============================================================================


//*****************************************************************************
//=============================================================================
//*****************************************************************************
// !@!Declarations 
//*****************************************************************************
//=============================================================================
//*****************************************************************************


//*****************************************************************************
//=============================================================================
//*****************************************************************************
//
//            
//*****************************************************************************
//=============================================================================
//*****************************************************************************
//=============================================================================
// Need add your own brackets [yoursection]
// Add your own "=" signs
// example: writekey('[yoursection]','yourkey=','yourvalue')
//=============================================================================
function bTest_A: boolean;//descriptive names are important
var
  INI: JFC_INI;
  bOk: boolean;
  saDataHere: ansistring;
begin
  INI:=JFC_INI.Create;
  bOk:=INI.WriteKey('[testsection1]','yourkey1=','yourvalue1');//if it still works
  if bOk then bOk:=INI.WriteKey('[testsection2]','yourkey2=','yourvalue2');//if it still works
  if bOk then bOk:=INI.WriteKey('[testsection3]','yourkey3=','yourvalue3');//if it still works
  if bOk then bOk:=INI.DeleteKey('[testsection2]','yourkey2=');
  if bOk then bOk:=INI.DeleteSection('[testsection2]');
  if bOk then bOk:=INI.SaveIniFile('test.ini');
  INI.Destroy;INI:=nil;//<-- good practice - not a bad habit :)

  INI:=JFC_INI.Create;
  // we good? if not more diagnostic messages - no gui here..
  if bok then
  begin
    bOk:=INI.LoadIniFile('test.ini');
  end;

  if bok then
  begin
    bOk:=(NOT INI.FoundSection('[NO WAY]')) AND
         INI.FoundSection('[testsection3]') AND
         INI.FoundSection('[testsection1]');
  end;

  if bOk then
  begin
    bOk:=(NOT INI.FoundKey('[NO WAY]','nope=')) AND
         INI.FoundKey('[testsection3]','yourkey3=') AND //not sure bout that equal sign edu'guessin
         INI.FoundKey('[testsection1]','yourkey1=') and
         (NOT INI.FoundKey('[testsection1]','yourkey3='));
  end;

  if bOk then
  begin
    bOk:=INI.ReadKey('[testsection3]','yourkey3=',saDataHere);
  end;
  INI.Destroy;INI:=nil;//<-- good practice - not a bad habit :)

  result:=bok and (saDatahere='yourvalue3');

end;



//=============================================================================
// Initialization
//=============================================================================
Begin
//=============================================================================
  if not bTest_A then writeln('bTest_A Failed.') else
  if 1=1 then writeln('Passed!');
//=============================================================================
End.
//=============================================================================

//=============================================================================
// History (Please Insert Historic Entries at top)
//=============================================================================
// Date        Who             Notes
//=============================================================================
//=============================================================================

//*****************************************************************************
// eof
//*****************************************************************************
