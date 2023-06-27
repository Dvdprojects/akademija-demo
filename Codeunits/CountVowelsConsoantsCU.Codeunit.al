codeunit 50103 CountVowelsConsoantsCU
{
    procedure CountVowelsConsoants(var VowelsCount: Integer; var ConsonantsCount: Integer; SomeText: Text)
    var
        Where: Text;
        Vowels: Text;
        Consonants: Text;
    begin
        SomeText := SomeText.ToLower();
        Where := '=';
        Vowels := 'aeėiįyouųū';
        Consonants := 'bcčdfghjklmnprsštvzž';
        VowelsCount := StrLen(SomeText) - StrLen(DelChr(SomeText, Where, Vowels));
        ConsonantsCount := StrLen(SomeText) - StrLen(DelChr(SomeText, Where, Consonants));
    end;
}