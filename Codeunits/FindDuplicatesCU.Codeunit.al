codeunit 50102 FindDuplicatesCU
{

    procedure FindDuplicateNumbers(ArrayOfNumbers: array[100] of Integer) "Duplicates": Dictionary of [Integer, Integer]
    var
        i: Integer;
        PKey: Integer;
    begin
        for i := 1 to ArrayLen(ArrayOfNumbers) do
            if Duplicates.ContainsKey(ArrayOfNumbers[i]) then
                Duplicates.Set(ArrayOfNumbers[i], Duplicates.Get(ArrayOfNumbers[i]) + 1)
            else
                Duplicates.Set(ArrayOfNumbers[i], 1);
        foreach PKey in Duplicates.Keys() do
            if Duplicates.Get(PKey) = 1 then
                Duplicates.Remove(PKey);
        exit(Duplicates);
    end;

}