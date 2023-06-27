codeunit 50100 MyCodeunit
{
    procedure ReverseText(var Tekstas: Text) Reversed: Text;
    var
        ReversedText: Text;
        Length: Integer;
        i: Integer;
    begin
        ReversedText := '';
        Length := StrLen(Tekstas);

        for i := Length downto 1 do
            ReversedText := ReversedText + Tekstas[i];

        Reversed := ReversedText;

    end;
}