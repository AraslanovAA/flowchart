unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm3 = class(TForm)
    clrbx1: TColorBox;
    btn1: TButton;
    lbl1: TLabel;
    procedure clrbx1Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm3.clrbx1Change(Sender: TObject);
begin
Form1.shp1.Brush.Color:=clrbx1.Selected;
Form1.shp2.Brush.Color:=clrbx1.Selected;
end;





end.
 