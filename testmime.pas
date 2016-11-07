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
// Program to test Synapse MIME Parsing I believe
Program testmime;
//=============================================================================

//=============================================================================
// Global Directives
//=============================================================================
{$INCLUDE i_jegas_macros.pp}
{$MODE DELPHI}
//=============================================================================

//=============================================================================
uses
//=============================================================================
  mimepart, classes;
//=============================================================================

//=============================================================================
type
//=============================================================================
  Tc = class(TObject)
  public
    class procedure ph(const Sender: TMimePart);
  end;
//=============================================================================

//=============================================================================
class procedure Tc.ph(const Sender: TMimePart);
//=============================================================================
begin
  Sender.DecodePart;
  Sender.EncodePart;
end;
//=============================================================================

//=============================================================================
var
//=============================================================================
  l: tstringlist;
  m:tmimepart;
//=============================================================================

//=============================================================================
begin
//=============================================================================
  l := TStringList.create;
  m := tmimepart.create;
  try
    m.OnWalkPart:=tc.ph;
    m.Lines.LoadFromFile(paramstr(1));
    m.DecomposeParts;
    m.WalkPart;
    m.ComposeParts;
    m.Lines.SaveToFile(paramstr(1) + '.repack');
  finally
    m.free;
    l.free;
  end;
end.
//=============================================================================

//*****************************************************************************
// EOF
//*****************************************************************************
