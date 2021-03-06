{=============================================================================
|    _________ _______  _______  ______  _______  Get out of the Mainstream, |
|   /___  ___// _____/ / _____/ / __  / / _____/    Mainstream Jetstream!    |
|      / /   / /__    / / ___  / /_/ / / /____         and into the          |
|     / /   / ____/  / / /  / / __  / /____  /            Jetstream! (tm)    |
|____/ /   / /___   / /__/ / / / / / _____/ /                                |
/_____/   /______/ /______/ /_/ /_/ /______/                                 |
|         Virtually Everything IT(tm)                        Jason@Jegas.com |
==============================================================================
                       Copyright(c)2016 Jegas, LLC
=============================================================================}

//=============================================================================
{}
// Program to test synapse httpsend
Program testhttp;
//=============================================================================


//=============================================================================
// GLOBAL DIRECTIVES
//=============================================================================
{$INCLUDE i_jegas_macros.pp}
{$MODE DELPHI}
//=============================================================================

//=============================================================================
uses
//=============================================================================
  httpsend, classes;
//=============================================================================

//=============================================================================
var
//=============================================================================
  HTTP: THTTPSend;
  l: tstringlist;
//=============================================================================


//=============================================================================
begin
//=============================================================================
  HTTP := THTTPSend.Create;
  l := TStringList.create;
  try
    if not HTTP.HTTPMethod('GET', Paramstr(1)) then
      begin
	writeln('ERROR');
        writeln(Http.Resultcode);
      end
    else
      begin
        writeln(Http.Resultcode, ' ', Http.Resultstring);
        writeln;
        writeln(Http.headers.text);
        writeln;
        l.loadfromstream(Http.Document);
        writeln(l.text);
     end;
  finally
    HTTP.Free;
    l.free;
  end;
end.
//=============================================================================

//*****************************************************************************
// EOF
//*****************************************************************************

