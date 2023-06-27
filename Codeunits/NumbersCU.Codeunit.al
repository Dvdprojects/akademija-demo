codeunit 50104 NumbersCU
{
    procedure GenerateNumbers(var Numbers: array[100] of Integer)
    var
        i: Integer;
    begin
        for i := 1 to ArrayLen(Numbers) do begin
            Numbers[i] := (Random(1000));
        end;
    end;

    procedure TextFormat(Numbers: array[100] of Integer) NumbersToString: Text
    var
        i: Integer;
    begin
        for i := 1 to ArrayLen(Numbers) do
            NumbersToString += ' ' + Format(Numbers[i]);
    end;
}