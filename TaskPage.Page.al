page 50100 TaskPage
{
    Caption = 'DEMO PAGE';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            group("1 Task - Reverse text ")
            {
                field(InputCtrl; InputText)
                {
                    Caption = 'Enter text';
                    trigger OnValidate()
                    begin
                        OutputText := MyCodeunit.ReverseText(InputText);
                    end;

                }

                field(OutputCtrl; OutputText)
                {
                    Caption = 'Result';
                    Editable = false;

                }

            }

            group("2 Task - Find min & max in array")
            {
                Editable = false;
                field(MinCtrl; Min)
                {
                    Caption = 'The smallest value';

                }

                field(MaxCtrl; Max)
                {
                    Caption = 'The highest value';
                }

                field(NumbersCtrl; NumbersToString)
                {
                    Caption = 'Numbers array';
                    MultiLine = true;
                }

            }

            group("3 Task - Find duplicates in array")
            {
                Editable = false;
                field(DuplicatesCtrl; DisplayDuplicateNumbers)
                {
                    Caption = 'Found duplicates';
                    MultiLine = true;
                }
            }

            group("4 Task - Find Vowels and Consoants")
            {
                Field(TextInputCtrl; TextInput)
                {
                    Caption = 'Enter some text :';
                    trigger OnValidate()
                    begin
                        CountVowelsConsoantsCU.CountVowelsConsoants(Vowels, Consoants, TextInput);
                    end;
                }

                Field(VowelsCtrl; Vowels)
                {
                    Caption = 'Vowels:';
                    Editable = false;
                }
                Field(ConsoantsCtrl; Consoants)
                {
                    Caption = 'Consoants:';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(MyAction)
            {
                Caption = 'Generate Array';
                ToolTip = 'This button generates array of 100 random values';
                Image = Action;

                trigger OnAction()
                var
                    NewArray: array[100] of Integer;
                begin
                    Clear(DisplayDuplicateNumbers);
                    NumbersCU.GenerateNumbers(NewArray);
                    NumbersToString := NumbersCU.TextFormat(NewArray);
                    FindMinMaxCodeunit.FindMinMax(NewArray, Min, Max);
                    DuplicateNumbers := FindDuplicatesCU.FindDuplicateNumbers(NewArray);
                    foreach PKey in DuplicateNumbers.Keys() do
                        DisplayDuplicateNumbers += Format(PKey) + ' - ' + Format(DuplicateNumbers.Get(PKey)) + '; \';
                end;

            }

        }
    }

    var
        InputText: Text;
        OutputText: Text;
        MyCodeunit: Codeunit MyCodeunit;
        NumbersToString: Text;
        Min: Integer;
        Max: Integer;
        FindMinMaxCodeunit: Codeunit FindMinMaxCodeunit;
        DisplayDuplicateNumbers: text;
        PKey: Integer;
        DuplicateNumbers: Dictionary of [Integer, Integer];
        FindDuplicatesCU: Codeunit FindDuplicatesCU;
        TextInput: text;
        Vowels: Integer;
        Consoants: Integer;
        CountVowelsConsoantsCU: Codeunit CountVowelsConsoantsCU;
        NumbersCU: Codeunit NumbersCU;
}