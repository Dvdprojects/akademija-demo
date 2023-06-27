codeunit 50101 FindMinMaxCodeunit
{
    var
        Numbers: array[100] of Integer;
        Min: Integer;
        Max: Integer;

    procedure FindMinMax(var Numbers: array[100] of Integer; var Min: Integer; var Max: Integer);
    var
        i: Integer;
    begin
        // Initialize min and max with the first element of the list
        Min := Numbers[1];
        Max := Numbers[1];

        // Iterate through the list to find the minimum and maximum numbers
        for i := 2 to ArrayLen(Numbers) do begin
            if Numbers[i] < Min then
                Min := Numbers[i];

            if Numbers[i] > Max then
                Max := Numbers[i];
        end;
    end;
}
