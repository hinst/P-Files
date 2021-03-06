unit FileRoutines;

interface

uses
  SysUtils,
  Classes,

  StringRoutines;
  
function Path(const s: array of string): string; overload;

function Write(const aStream: TStream; const s: String): boolean; overload; inline;

implementation

function Path(const s: array of string): string; 
var
  i: Integer;
begin
  result := '';
  if 
    Length(s) > 0
  then
  begin
	result := s[0];
    for i := 1 to Length(s) - 1 do
      result := result + PathDelim + s[i];
  end;  
end;

function Write(const aStream: TStream; const s: String): boolean;
var
  dataSize, writeResult: Integer;
begin
  dataSize := GetByteLength(s) - 1;
  writeResult := aStream.Write(PChar(s)^, dataSize);
  result := writeResult = dataSize;
end;

end.
