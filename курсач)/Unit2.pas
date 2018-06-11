unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    mmo1: TMemo;
    btn2: TButton;
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
 uses unit1;


procedure TForm2.FormShow(Sender: TObject);
begin
 btn2.Left:=mmo1.Width+30;
end;

procedure TForm2.btn2Click(Sender: TObject);
var i :integer;
begin
  NumStr:=0;
  for i:=0 to mmo1.Lines.Count-1 do
  begin
    mmStr[i]:=mmo1.Lines.Strings[i];
    Inc(NumStr);
  end;
  Form2.Close;
end;



end.
