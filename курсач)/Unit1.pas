unit Unit1;
                       //увеличение шейпов и имджа при растягивании(только) от нулевого
interface                //добавить стрелки
                       //добавить вертексы на концах автосоединения
uses                   //параллелограмм
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, StdCtrls,jpeg, ExtDlgs, ComCtrls;

type
  TForm1 = class(TForm)
    img1: TImage;
    mm1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    lbl1: TLabel;
    cbb1: TComboBox;
    btn4: TButton;
    svpctrdlg1: TSavePictureDialog;
    shp1: TShape;
    btn6: TButton;
    shp2: TShape;
    btn9: TButton;
    btn10: TButton;
    img2: TImage;
    chk5: TCheckBox;
    btn11: TButton;
    img3: TImage;
    img4: TImage;
    img5: TImage;
    img6: TImage;
    img7: TImage;
    img8: TImage;
    img9: TImage;
    lbl3: TLabel;
    edt2: TEdit;
    btn1: TButton;
    img10: TImage;
    btn2: TButton;
    btn5: TButton;
    chk1: TCheckBox;
    img11: TImage;
    btn3: TButton;
    procedure img1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure img7Click(Sender: TObject);
    procedure img6Click(Sender: TObject);
    procedure img4Click(Sender: TObject);
    procedure img3Click(Sender: TObject);
    procedure img5Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure edt2KeyPress(Sender: TObject; var Key: Char);
    procedure edt2Change(Sender: TObject);
    procedure img9MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img9MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure img9MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn1Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure img10Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure img11Click(Sender: TObject);



  private
    { Private declarations }
    BMP : TBitmap;
    JPG : TJPEGImage;
  public
    { Public declarations }
  end;
    var
    NumStr,NumStr_2,L,W : Integer;
    mmStr : array[0..1000] of string;
    mmStr_2 : array[0..1000] of string;
      rofl : Boolean; //убрать из проги
      fromX,fromY : integer;
      Rec : TRect;   x0,y0 : integer;
      ConnectDown, move,prefer_1 : Boolean;
      UsingElement,UsedElement : Byte;
      Vertex : array[0..1,0..10000] of integer;
    StepGrid : integer;
      N : Integer;//количество вершин в массиве
var
  Form1: TForm1;

implementation

uses Unit2, Unit3;

{$R *.dfm}

 procedure AddVertex(addX : Integer;addY : Integer);
 begin
    Vertex[0,N]:=addX;
    Vertex[1,N]:=addY;
    Inc(N);
 end;
procedure TForm1.img1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var i : integer;
  found : Boolean;
begin
  found:=False;
   fromX:=X;
   fromY:=Y;
   {
   if (N = 0) then
    begin
    img1.Canvas.MoveTo(fromX,fromY);
    AddVertex(X,Y);
     end
     else
     begin
       for i:=0 to (N-1) do
       begin
        if(Abs(Vertex[0,i]-X)<10)then
           begin
             if (Abs(Vertex[1,i]-Y)<10) then
               begin
                 img1.Canvas.MoveTo(Vertex[0,i],Vertex[1,i]);
                 fromX:=Vertex[0,i];
                 fromY:=Vertex[1,i];
                 found_1:=True;
                 found:=True;
               end;
           end;
       end;
       if (found = False) then
       begin
        img1.Canvas.MoveTo(fromX,fromY);
        AddVertex(X,Y);
       end;
     end;   }
end;

procedure TForm1.img1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var i,NewX,NewY,pastX,pastY: Integer;
  found_1,found_2,cheked : Boolean;
  procedure AddArrow(x1 :integer;y1 :Integer;x2 :integer;y2 :Integer);
  begin
    img1.Canvas.MoveTo(x2,y2);
    if (x1=x2) then
    begin
      if (y1 <y2) then
      begin
       img1.Canvas.LineTo(x2-5,y2-5);
       img1.Canvas.MoveTo(x2,y2);
       img1.Canvas.LineTo(x2+5,y2-5);
      end
      else
      begin
        img1.Canvas.LineTo(x2-5,y2+5);
        img1.Canvas.MoveTo(x2,y2);
        img1.Canvas.LineTo(x2+5,y2+5);
      end;
    end
    else
    begin
      if (x1<x2) then
      begin
        img1.Canvas.LineTo(x2-5,y2+5);
        img1.Canvas.MoveTo(x2,y2);
        img1.Canvas.LineTo(x2-5,y2-5);
      end
      else
      begin
        img1.Canvas.LineTo(x2+5,y2+5);
        img1.Canvas.MoveTo(x2,y2);
        img1.Canvas.LineTo(x2+5,y2-5);
      end;
    end;
  end;
begin
  found_1:=False;
  found_2:=False;
  cheked:=False;
  img2.Picture.Assign(img1.Picture);


     for i:=0 to (N-1) do //чекаем если у начала отрезка вертекс
       begin
        if(Abs(Vertex[0,i]-fromX)<10)then
           begin
             if (Abs(Vertex[1,i]-fromY)<10) then
               begin
                 pastX:=Vertex[0,i];      //записываем координаты найденного вертекса
                 pastY:=Vertex[1,i];
                 found_1:=True;//отмечаем найденный вертекс
               end;
           end;
       end;



     for i:=0 to (N-1) do    //чекаем для второго конца отрезка
       begin
        if(Abs(Vertex[0,i]-X)<10)then
           begin
             if (Abs(Vertex[1,i]-Y)<10) then
               begin
                 NewX:=Vertex[0,i];
                 NewY:=Vertex[1,i];
                 found_2:=True;
               end;
           end;
       end;

        if (chk5.Checked = False) then         //вертексы соединяют только до 1 из координат чекать нужно ли на 2 вершине соединение
        begin
                  if (found_1 = True)  then
                  begin
                       if (prefer_1 = True) then
                       begin
                          //000found_1 - true; pref_1 - true   соединять от первого вертекса
                          img1.Canvas.MoveTo(pastX,pastY);
                            if (Abs(X-pastX)>Abs(Y-pastY)) then
                            begin
                               img1.Canvas.LineTo(X,pastY);
                               AddVertex(X,pastY);
                               if chk1.Checked=True then
                               AddArrow(pastX,pastY,X,pastY);
                            end
                            else
                            begin

                              AddVertex(pastX,Y);
                               img1.Canvas.LineTo(pastX,Y);
                               if chk1.Checked=True then
                               AddArrow(pastX,pastY,pastX,Y);
                            end;
                           //000
                       end
                       else
                       begin
                           //found_1 - true; pref_1 - false
                            if (found_2 = True) then
                            begin
                                  //found_2 - true; pref_1 - false соединять от второго вертекса
                                  //001

                                  img1.Canvas.MoveTo(NewX,NewY);
                                      if (Abs(NewX-fromX)>Abs(NewY-fromY)) then
                                      begin

                                        AddVertex(fromX,NewY);
                                         img1.Canvas.LineTo(fromX,NewY);
                                         if chk1.Checked=True then
                                         AddArrow(fromX,NewY,NewX,NewY);
                                      end
                                      else
                                      begin

                                        AddVertex(NewX,fromY);
                                          img1.Canvas.LineTo(NewX,fromY);
                                          if chk1.Checked=True then
                                          AddArrow(NewX,fromY,NewX,NewY);
                                      end;
                                  //001
                            end
                            else
                            begin
                               //found_1 - true; pref1 - false; found_2 - false соединять от 1-го
                               //000

                              img1.Canvas.MoveTo(pastX,pastY);
                              if (Abs(X-pastX)>Abs(Y-pastY)) then
                              begin

                                AddVertex(X,pastY);
                               img1.Canvas.LineTo(X,pastY);
                               if chk1.Checked=True then
                               AddArrow(pastX,pastY,X,pastY);
                              end
                              else
                              begin

                                AddVertex(pastX,Y);
                               img1.Canvas.LineTo(pastX,Y);
                               if chk1.Checked=True then
                               AddArrow(pastX,pastY,pastX,Y);
                              end;
                               //000
                            end;
                       end;
                  end
                  else
                  begin
                    //found_1 - false
                    //если нашли 2-ой вертекс соединяес ним иначе соединяем 2 точки
                      if (found_2  = True) then
                      begin
                        //001

                         img1.Canvas.MoveTo(NewX,NewY);
                         if (Abs(NewX-fromX)>Abs(NewY-fromY)) then
                         begin

                           AddVertex(fromX,NewY);
                             img1.Canvas.LineTo(fromX,NewY);
                             if chk1.Checked=True then
                             AddArrow(fromX,NewY,NewX,NewY);
                         end
                         else
                         begin

                           AddVertex(NewX,fromY);
                             img1.Canvas.LineTo(NewX,fromY);
                             if chk1.Checked=True then
                             AddArrow(NewX,fromY,NewX,NewY);
                         end;

                        //001
                      end
                      else
                      begin
                        if (prefer_1 = True)then
                        begin
                          AddVertex(fromX,fromY);
                           img1.Canvas.MoveTo(fromX,fromY);
                             if (Abs(fromX-X)>Abs(fromY-Y)) then
                             begin

                               AddVertex(X,fromX);
                                img1.Canvas.LineTo(X,fromY);
                                if chk1.Checked=True then
                                AddArrow(fromX,fromY,X,fromY);
                             end
                             else
                             begin

                               AddVertex(fromX,Y);
                                img1.Canvas.LineTo(fromX,Y);
                                if chk1.Checked=True then
                                AddArrow(fromX,fromY,fromX,Y);
                             end;
                        end
                        else
                        begin
                          AddVertex(X,Y);
                            img1.Canvas.MoveTo(X,Y);
                            if (Abs(fromX-X)>Abs(fromY-Y))then
                            begin

                              AddVertex(fromX,Y);
                              img1.Canvas.LineTo(fromX,Y);
                              if chk1.Checked=True then
                              AddArrow(fromX,Y,X,Y);
                            end
                            else
                            begin

                              AddVertex(X,fromY);
                              img1.Canvas.LineTo(X,fromY);
                              if chk1.Checked=True then
                              AddArrow(X,fromY,X,Y);
                            end;
                        end;
                      end;
                  end;


        end
        else
        begin
          if (found_1 = False) then
          begin
           pastX:=fromX;
           pastY:=fromY;
          end;
          if (found_2 = False) then
          begin
           NewX:=X;
           NewY:=Y;
          end;


        if (ConnectDown = True) then //автосоединение
        begin

           if (NewY<pastY) then  //если вторая точка выше, а connect=down
           begin

              img1.Canvas.MoveTo(pastX,pastY);
              img1.Canvas.LineTo(NewX,pastY);
              img1.Canvas.MoveTo(NewX,pastY);
              img1.Canvas.LineTo(NewX,NewY);
              if chk1.Checked=True then
              AddArrow(NewX,pastY,NewX,NewY);
           end
           else
           begin //вторая точка ниже, а connect=down

              img1.Canvas.MoveTo(pastX,pastY);
              img1.Canvas.LineTo(pastX,NewY);
              img1.Canvas.MoveTo(pastX,NewY);
              img1.Canvas.LineTo(NewX,NewY);
              if chk1.Checked=True then
              AddArrow(pastX,NewY,NewX,NewY);
           end;
        end
        else
        begin
          if (NewY < pastY) then
          begin   //вторая точка выше, а connect=up

             img1.Canvas.MoveTo(pastX,pastY);
             img1.Canvas.LineTo(pastX,NewY);
             img1.Canvas.MoveTo(pastX,NewY);
             img1.Canvas.LineTo(NewX,NewY);
             if chk1.Checked=True then
             AddArrow(pastX,NewY,NewX,NewY);
          end
          else
          begin //вторая точка ниже, а connect=up
             img1.Canvas.MoveTo(pastX,pastY);
             img1.Canvas.LineTo(NewX,pastY);
             img1.Canvas.MoveTo(NewX,pastY);
             img1.Canvas.LineTo(NewX,NewY);
             if chk1.Checked=True then
             AddArrow(NewX,pastY,NewX,NewY);
          end;
        end;

        end;

     found_1:=False;
end;
 procedure DrawGrid;
 var i,Numsteps,asX : Integer;
 begin
   Numsteps:=(Form1.img1.Width div StepGrid);
   asX:=StepGrid;
   for i:=1 to Numsteps do
   begin
     Form1.img1.Canvas.MoveTo(asX,0);
     Form1.img1.Canvas.LineTo(asX,Form1.img1.Height);
     asX:=asX+StepGrid;
   end;
   Numsteps:=(Form1.img1.Height div StepGrid);
   asX:=StepGrid;
     for i:=0 to Numsteps do
     begin
       Form1.img1.Canvas.MoveTo(0,asX);
       Form1.img1.Canvas.LineTo(Form1.img1.Width,asX);
       asX:=asX+StepGrid;
     end;
 end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 // N5.Enabled:=False;
 StepGrid:=30;
 //DrawGrid;
 N6.Enabled:=False;
  prefer_1:=True;
  DoubleBuffered:=True;
  N:=0;
  NumStr:=0;
   move :=False;
  UsingElement:=0;UsedElement:=0;
  ConnectDown:=True;
  cbb1.ItemIndex:=1;
 // shp1.Brush.Color:=clRed;
 // shp2.Brush.Color:=clRed;
svpctrdlg1.Filter:='Bitmap Map (*.bmp)|*.bmp|JPEG Image (*.jpg)|*.jpg|PNG Image (*.png)|*.png|GIF Image (*.gif)|*.gif';
BMP :=TBitmap.Create();
JPG :=TJPEGImage.Create();
Form1.Align:=alClient;
shp1.Brush.Color:=cl3DDkShadow;
shp2.Brush.Color:=cl3DDkShadow;

end;

procedure TForm1.N3Click(Sender: TObject);
var f : integer;
  Function CheckExt(FileName: String; ExtIndex: Integer): String;
      Var Ext: String;
      Begin
      Result:=FileName;
      Case ExtIndex Of
            1:
                  Ext:='.bmp';
            2:
                  Ext:='.jpg';
            3:
                  Ext:='.png';
            4:
                  Ext:='.gif';
            End;
      If LowerCase(ExtractFileExt(FileName))<>Ext Then
            Result:=Result+Ext;
      End;
Begin
If img1.Picture.Bitmap=Nil Then
      Begin
      ShowMessage('Bitmap==Nil');
      Exit;
      End;
If img1.Picture.Bitmap.Empty Then
      Begin
      ShowMessage('Bitmap is Empty');
      Exit;
      End;
If svpctrdlg1.Execute Then
      Begin
      f:=svpctrdlg1.FilterIndex;
      Case f Of
            1:
                  Begin // BMP
                  BMP.Assign(img1.Picture.Bitmap);
                  BMP.SaveToFile(CheckExt(svpctrdlg1.FileName,f));
                  End;
            2:
                  Begin // JPG
                  JPG.Assign(img1.Picture.Bitmap);
                  JPG.SaveToFile(CheckExt(svpctrdlg1.FileName,f));
                  End;
                  {
            3:
                  Begin // PNG
                  PNG.Assign(img1.Picture.Bitmap);
                  // TODO: If (Image1.Picture.Bitmap.PixelFormat=pf32bit) Then ...
                  PNG.SaveToFile(CheckExt(svpctrdlg1.FileName,f));
                  End;
            4:
                  Begin // GIF
                  GIF.Assign(img1.Picture.Bitmap);
                  // TODO: If (Image1.Picture.Bitmap.Transparent) Then ...
                  GIF.SaveToFile(CheckExt(svpctrdlg1.FileName,f));
                  End;  }
            End;
      End;
  end;


procedure TForm1.btn6Click(Sender: TObject);
var i: Integer;

begin
    img2.Picture.Assign(img1.Picture);
  for i:=0 to (N-1) do
  begin
    Vertex[0,i]:=-1;
    Vertex[1,i]:=-1;
  end;
  N:=0;
img1.Picture:=nil;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
  img1.Picture.Assign(img2.Picture);
end;

procedure TForm1.btn11Click(Sender: TObject);
begin
if (ConnectDown = True) then
begin
  btn11.Caption:='соединять снизу';
  ConnectDown:=False;
end
else
begin
  ConnectDown:=True;
  btn11.Caption:='соединять сверху';
end;
  end;
procedure TForm1.img7Click(Sender: TObject);
begin
  UsingElement:=1;
Form1.img8.Picture.LoadFromFile('5th.bmp');
end;

procedure TForm1.img6Click(Sender: TObject);
begin
  UsingElement:=2;
Form1.img8.Picture.LoadFromFile('4th.bmp');
end;

procedure TForm1.img4Click(Sender: TObject);
begin
  UsingElement:=3;
Form1.img8.Picture.LoadFromFile('first.bmp');
end;

procedure TForm1.img3Click(Sender: TObject);
begin
  UsingElement:=4;
Form1.img8.Picture.LoadFromFile('second.bmp');
end;

procedure TForm1.img5Click(Sender: TObject);
begin
  UsingElement:=5;
Form1.img8.Picture.LoadFromFile('thrid.bmp');
end;
    procedure DrText(FInalOut : Boolean);
    var i,Dry,Drx : integer;
    begin

      if NumStr_2<>0 then
      begin
           if (UsedElement=5) then
             Dry:=(L div 2)+4
           else
           begin
             Dry:=8;
           end;
       for i:=0 to NumStr_2-1 do
       begin
            if (UsedElement<>5) then
            begin
              Drx:=(Form1.img9.Width - Form1.img9.Canvas.TextWidth(mmStr_2[i])) div 2;
            end
            else
             begin
              Drx:=(Form1.img9.Width div 4) + (((Form1.img9.Width div 2) - Form1.img9.Canvas.TextWidth(mmStr_2[i])) div 2);
              end;
         if (FInalOut = False) then
         begin
               Form1.img9.Canvas.TextOut(Drx,Dry,mmStr_2[i]);
         end
         else
         begin
          Form1.img1.Canvas.TextOut(Drx+Form1.img9.Left-Form1.img1.Left,Dry+Form1.img9.Top-Form1.img1.Top,mmStr_2[i]);
         end;
       Dry:=Dry+ Form1.img9.Canvas.TextHeight(mmStr_2[i])+4;
       end;
      end;
    end;
    function Search_L : integer;
    begin
     if (NumStr_2 <> 0 ) then
       if (UsedElement<>5) then
         Search_l:=12+ NumStr_2*4 + NumStr_2*Form1.img9.Canvas.TextHeight(mmStr_2[0])
       else
       begin
         Search_L:=1 + NumStr_2*4 + NumStr_2*Form1.img9.Canvas.TextHeight(mmStr_2[0]);
       end
     else
     begin
     Search_L:=20;
      end;
    end;
    procedure TakeSize;
     begin
             L:=Search_L;
       W:=StrToInt(Form1.edt2.Text);
       if UsedElement<>5 then
       Form1.img9.Height:=L+4
       else
       begin
         Form1.img9.Height:=2*L+4;
       end;
       Form1.img9.Width:=W;
     end;
 procedure DrowRectangle();
 begin
   TakeSize;
   Form1.img9.Canvas.Rectangle(1,2,W-1,L+2);
   DrText(False);
 end;
 procedure DrawEndCycle;
 begin
   TakeSize;
   Form1.img9.Canvas.MoveTo(1,2);
   Form1.img9.Canvas.LineTo(W-1,2);
   Form1.img9.Canvas.MoveTo(W-1,2);
   Form1.img9.Canvas.LineTo(W-1,L-8);
   Form1.img9.Canvas.MoveTo(W-1,L-8);
   Form1.img9.Canvas.LineTo(W-11,L+2);
   Form1.img9.Canvas.MoveTo(W-11,L+2);
   Form1.img9.Canvas.LineTo(11,L+2);
   Form1.img9.Canvas.MoveTo(11,L+2);
   Form1.img9.Canvas.LineTo(1,L-8);
   Form1.img9.Canvas.MoveTo(1,L-8);
   Form1.img9.Canvas.LineTo(1,2);
   DrText(False);
 end;
   procedure DrawStrCycle;
   begin
     TakeSize;
     Form1.img9.Canvas.MoveTo(11,2);
     Form1.img9.Canvas.LineTo(W-11,2);
     Form1.img9.Canvas.MoveTo(W-11,2);
     Form1.img9.Canvas.LineTo(W-1,12);
     Form1.img9.Canvas.MoveTo(W-1,12);
     Form1.img9.Canvas.LineTo(W-1,L+2);
     Form1.img9.Canvas.MoveTo(W-1,L+2);
     Form1.img9.Canvas.LineTo(1,L+2);
     Form1.img9.Canvas.MoveTo(1,L+2);
     Form1.img9.Canvas.LineTo(1,12);
     Form1.img9.Canvas.MoveTo(1,12);
     Form1.img9.Canvas.LineTo(11,2);
      DrText(false);

   end;
   procedure DrawRoundRect;
   begin
      TakeSize;
     Form1.img9.Canvas.RoundRect(1,2,W-1,L+2,50,50);
     DrText(False);
   end;
   procedure DrawProcedure;
   begin
     TakeSize;
     Form1.img9.Canvas.Rectangle(1,2,W-1,L+2);
     Form1.img9.Canvas.MoveTo(11,2);
     Form1.img9.Canvas.LineTo(11,L+2);
     Form1.img9.Canvas.MoveTo(W-11,2);
     Form1.img9.Canvas.LineTo(W-11,L+2);
     DrText(False);
   end;
     procedure DrawRhombus;
     begin
      TakeSize;
      Form1.img9.Canvas.MoveTo(W div 2,2);
      Form1.img9.Canvas.LineTo(W-1,L+2);
      Form1.img9.Canvas.MoveTo(W-1,L+2);
      Form1.img9.Canvas.LineTo(W div 2,2*L+2);
      Form1.img9.Canvas.MoveTo(W div 2,2*L+2);
      Form1.img9.Canvas.LineTo(1,L+2);
      Form1.img9.Canvas.MoveTo(1,L+2);
      Form1.img9.Canvas.LineTo(W div 2,2);
      DrText(False);
     end;
 procedure DrawParall;
 begin
   TakeSize;
   Form1.img9.Canvas.MoveTo(20,2);
   Form1.img9.Canvas.LineTo(W-1,2);
   Form1.img9.Canvas.MoveTo(W-1,2);
   Form1.img9.Canvas.LineTo(W-20,L+2);
   Form1.img9.Canvas.MoveTo(W-20,L+2);
   Form1.img9.Canvas.LineTo(1,L+2);
   Form1.img9.Canvas.MoveTo(1,L+2);
   Form1.img9.Canvas.LineTo(20,2);
   DrText(False);
 end;
  Procedure DrawYes;
  begin
    Form1.img9.Height:=Form1.img9.Canvas.TextHeight('да')+1;
    Form1.img9.Width:=Form1.img9.Canvas.TextWidth('да')+1;
    Form1.img9.Canvas.TextOut(1,1,'да');
  end;
  Procedure DrawNo;
  begin
    Form1.img9.Height:=Form1.img9.Canvas.TextHeight('нет')+1;
    Form1.img9.Width:=Form1.img9.Canvas.TextWidth('нет')+1;
    Form1.img9.Canvas.TextOut(1,1,'нет');
  end;
procedure TForm1.btn9Click(Sender: TObject);
var flag : Boolean;
i : integer;
begin
  img9.Picture:=nil;

  flag:=False;
  if edt2.Text ='' then
  begin
    ShowMessage('Необходимо указать ширинy элмента.');
  end
  else
  begin
       if StrToInt(edt2.Text) >=30 then
        flag:=True
        else
        begin
          ShowMessage('Ширина элемента мала');
        end;
  end;

  if (flag = True) then
  begin
     for i:=0 to NumStr do
     begin
       mmStr_2[i]:=mmStr[i];
     end;
     NumStr_2:=NumStr;
  img9.Left:=186;
  img9.Top:=146;
  img9.Enabled:=True;
  img9.Visible:=True;
 case UsingElement of
  0 : ShowMessage('Выберите элемент на верхней панели');
  1 :  begin
       UsedElement:=1;
       DrawEndCycle;
       end;
  2 :  begin
       UsedElement:=2;
       DrawStrCycle;
       end;
  3 :  begin
       UsedElement:=3;
       DrawRoundRect;
       end;
  4 :  begin
       UsedElement:=4;
       DrowRectangle;
       end;
  5 :  begin
       UsedElement:=5;
       Drawrhombus;
       end;
  6 :  begin
       UsedElement:=6;
       DrawProcedure;
       end;
  7 :  begin
       UsedElement:=7;
       DrawYes;
       end;
  8 :  begin
       UsedElement:=8;
       DrawNo;
       end;
  9 :  begin
        UsedElement:=9;
        DrawParall;
       end;
  end;
 end;
   if rofl = True then
   begin
     rofl:=False;
     btn9.Click;
   end
   else
   begin
     rofl:=True;
   end;
 end;


procedure TForm1.edt2KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9',#8]) then key:=#0
end;





procedure TForm1.edt2Change(Sender: TObject);
var j : integer;
begin
if edt2.Text <>'' then
begin

    j:=StrToInt(edt2.Text);
    if j>=(img1.Width) then
    begin
      ShowMessage('Ширина элемента не должна превышать размеров поля.');
      j:=Trunc(j/10);
      edt2.Text:=IntToStr(j);
    end;
  end;
end;

procedure TForm1.img9MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if button<>mbLeft then
  move:=false
  else
  begin
   move:=true;
   x0:=x;
   y0:=y;
   Rec:=img9.BoundsRect;
  end;
end;

procedure TForm1.img9MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if move then
begin
Form1.Canvas.DrawFocusRect(rec);
with Rec do
 begin
 left:=Left+x-x0;
 top:=Top+y-y0;
 right:=right+x-x0;
 bottom:=bottom+y-y0;
 x0:=x;
 y0:=y;
end;
 if (Rec.Left <=177) then
 Rec.Left:=178;
 if (Rec.Left+ img9.Width >= img1.Left+img1.Width) then
 Rec.Left:=img1.Left+img1.Width-img9.Width-1;
 if (Rec.Top <= 136) then
 Rec.Top:=137;
 if (Rec.Top + img9.Height >= img1.Top+img1.Height) then
 Rec.Top:=img1.Top+img1.Height-img9.Height-1;
 Form1.Canvas.DrawFocusRect(Rec);
 end;
end;

procedure TForm1.img9MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Form1.Canvas.DrawFocusRect(rec);
with img9 do begin
setbounds(rec.left+x-x0,rec.top+y-y0,width,height);
move:=false;
end;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  if edt2.Text='' then
  ShowMessage('Не указана ширина объекта')
  else
  begin
    if (UsingElement =6) then
    Form2.mmo1.Width:=StrToInt(edt2.Text)-20
    else
    begin
        if (UsingElement =5) then
        Form2.mmo1.Width:=StrToInt(edt2.Text) div 2
        else
          begin
            if (UsingElement = 9) then
              if ( StrToInt(edt2.Text) > 60 )then
               begin
                Form2.mmo1.Width:=StrToInt(edt2.Text)-40;
              end
              else
              begin
               Form2.mmo1.Width:=StrToInt(edt2.Text) - 24 ;
              end
            else
            begin
              Form2.mmo1.Width:=StrToInt(edt2.Text);
            end;

          end;
    end;
    Form2.mmo1.Clear;
    Form2.Show;
  end;
end;
 procedure HideImg;
 begin
   Form1.img9.Visible:=False;
   Form1.img9.Enabled:=True;
   Form1.img9.Width:=500;
   Form1.img9.Height:=500;
   Form1.img9.Left:=-500;
 end;

   procedure ReDraw;
   var W,L:Integer;
   begin
     Form1.img2.Picture.Assign(Form1.img1.Picture);
     W:=StrToInt(Form1.edt2.Text);
     L:=Search_L;
      case UsedElement of
      1 : begin
               Form1.img1.Canvas.MoveTo(1 + Form1.img9.Left-Form1.img1.Left,2 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.LineTo(W-1 + Form1.img9.Left-Form1.img1.Left,2 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.MoveTo(W-1 + Form1.img9.Left-Form1.img1.Left,2 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.LineTo(W-1 + Form1.img9.Left-Form1.img1.Left,L-8 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.MoveTo(W-1 + Form1.img9.Left-Form1.img1.Left,L-8 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.LineTo(W-11 + Form1.img9.Left-Form1.img1.Left,L+2 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.MoveTo(W-11 + Form1.img9.Left-Form1.img1.Left,L+2 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.LineTo(11 + Form1.img9.Left-Form1.img1.Left,L+2 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.MoveTo(11 + Form1.img9.Left-Form1.img1.Left,L+2 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.LineTo(1 + Form1.img9.Left-Form1.img1.Left,L-8 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.MoveTo(1 + Form1.img9.Left-Form1.img1.Left,L-8 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.LineTo(1 + Form1.img9.Left-Form1.img1.Left,2 + Form1.img9.Top-Form1.img1.Top);
          end;

      2 : begin

               Form1.img1.Canvas.MoveTo(11 + Form1.img9.Left-Form1.img1.Left,2+ Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.LineTo(W-11 + Form1.img9.Left-Form1.img1.Left,2 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.MoveTo(W-11 + Form1.img9.Left-Form1.img1.Left,2 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.LineTo(W-1 + Form1.img9.Left-Form1.img1.Left,12 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.MoveTo(W-1 + Form1.img9.Left-Form1.img1.Left,12 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.LineTo(W-1 + Form1.img9.Left-Form1.img1.Left,L+2 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.MoveTo(W-1 + Form1.img9.Left-Form1.img1.Left,L+2 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.LineTo(1 + Form1.img9.Left-Form1.img1.Left,L+2 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.MoveTo(1 + Form1.img9.Left-Form1.img1.Left,L+2 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.LineTo(1 + Form1.img9.Left-Form1.img1.Left,12 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.MoveTo(1 + Form1.img9.Left-Form1.img1.Left,12 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.LineTo(11 + Form1.img9.Left-Form1.img1.Left,2 + Form1.img9.Top-Form1.img1.Top);

          end;

      3 : begin
           Form1.img1.Canvas.RoundRect(1+ Form1.img9.Left-Form1.img1.Left,2 + Form1.img9.Top-Form1.img1.Top,W-1 + Form1.img9.Left-Form1.img1.Left,L+2 + Form1.img9.Top-Form1.img1.Top,50,50);
          end;
      4 : begin
           Form1.img1.Canvas.Rectangle(Form1.img9.Left+1-Form1.img1.Left,Form1.img9.Top+2-Form1.img1.Top,Form1.img9.Left-1+W-Form1.img1.Left,Form1.img9.Top+L+2-Form1.img1.Top);
          end;

      5 : begin
             Form1.img1.Canvas.MoveTo(W div 2 + Form1.img9.Left-Form1.img1.Left,2 + Form1.img9.Top-Form1.img1.Top);
             Form1.img1.Canvas.LineTo(W-1 + Form1.img9.Left-Form1.img1.Left,L+2 + Form1.img9.Top-Form1.img1.Top);
             Form1.img1.Canvas.MoveTo(W-1 + Form1.img9.Left-Form1.img1.Left,L+2 + Form1.img9.Top-Form1.img1.Top);
             Form1.img1.Canvas.LineTo(W div 2 + Form1.img9.Left-Form1.img1.Left,2*L+2 + Form1.img9.Top-Form1.img1.Top);
             Form1.img1.Canvas.MoveTo(W div 2 + Form1.img9.Left-Form1.img1.Left,2*L+2 + Form1.img9.Top-Form1.img1.Top);
             Form1.img1.Canvas.LineTo(1 + Form1.img9.Left-Form1.img1.Left,L+2 + Form1.img9.Top-Form1.img1.Top);
             Form1.img1.Canvas.MoveTo(1 + Form1.img9.Left-Form1.img1.Left,L+2 + Form1.img9.Top-Form1.img1.Top);
             Form1.img1.Canvas.LineTo(W div 2 + Form1.img9.Left-Form1.img1.Left,2 + Form1.img9.Top-Form1.img1.Top);
             AddVertex(Form1.img9.Left-Form1.img1.Left + 1,Form1.img9.Top-Form1.img1.Top+ (Form1.img9.Height div 2));
             AddVertex(Form1.img9.Left-Form1.img1.Left + Form1.img9.Width -1,Form1.img9.Top-Form1.img1.Top+ (Form1.img9.Height div 2));
          end;

      6 : begin
               Form1.img1.Canvas.Rectangle(1 + Form1.img9.Left-Form1.img1.Left,2 + Form1.img9.Top-Form1.img1.Top,W-1 + Form1.img9.Left-Form1.img1.Left,L+2 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.MoveTo(11 + Form1.img9.Left-Form1.img1.Left,2 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.LineTo(11 + Form1.img9.Left-Form1.img1.Left,L+2 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.MoveTo(W-11 + Form1.img9.Left-Form1.img1.Left,2 + Form1.img9.Top-Form1.img1.Top);
               Form1.img1.Canvas.LineTo(W-11 + Form1.img9.Left-Form1.img1.Left,L+2 + Form1.img9.Top-Form1.img1.Top);
          end;
      9 : begin
                Form1.img1.Canvas.MoveTo(20 + Form1.img9.Left-Form1.img1.Left,2 + Form1.img9.Top-Form1.img1.Top);
                Form1.img1.Canvas.LineTo(W-1 + Form1.img9.Left-Form1.img1.Left,2 + Form1.img9.Top-Form1.img1.Top);
                Form1.img1.Canvas.MoveTo(W-1 + Form1.img9.Left-Form1.img1.Left,2 + Form1.img9.Top-Form1.img1.Top);
                Form1.img1.Canvas.LineTo(W-20 + Form1.img9.Left-Form1.img1.Left,L+2 + Form1.img9.Top-Form1.img1.Top);
                Form1.img1.Canvas.MoveTo(W-20 + Form1.img9.Left-Form1.img1.Left,L+2 + Form1.img9.Top-Form1.img1.Top);
                Form1.img1.Canvas.LineTo(1 + Form1.img9.Left-Form1.img1.Left,L+2 + Form1.img9.Top-Form1.img1.Top);
                Form1.img1.Canvas.MoveTo(1 + Form1.img9.Left-Form1.img1.Left,L+2 + Form1.img9.Top-Form1.img1.Top);
                Form1.img1.Canvas.LineTo(20 + Form1.img9.Left-Form1.img1.Left,2 + Form1.img9.Top-Form1.img1.Top);

           end;
      end;
       DrText(True);
       AddVertex(Form1.img9.Left-Form1.img1.Left+(Form1.img9.Width div 2), Form1.img9.Top-Form1.img1.Top+2);
       AddVertex(Form1.img9.Left-Form1.img1.Left+(Form1.img9.Width div 2), Form1.img9.Top-Form1.img1.Top + Form1.img9.Height-2);
       HideImg;
   end;
     procedure ReDraw_elements;
     begin
       case  UsedElement of
       7 :  Form1.img1.Canvas.TextOut( Form1.img9.Left-Form1.img1.Left+1,Form1.img9.Top-Form1.img1.Top +1,'да');
       8 :  Form1.img1.Canvas.TextOut( Form1.img9.Left-Form1.img1.Left+1,Form1.img9.Top-Form1.img1.Top +1,'нет');
       end;
       HideImg;
     end;
procedure TForm1.btn10Click(Sender: TObject);
begin
 if (UsedElement<>0) then
 begin
   if (UsedElement <7) or (UsedElement=9) then
    ReDraw
    else
   begin
    ReDraw_elements;
   end;
 end
 else
 begin
   ShowMessage('Добавьте элемент на форму');
 end;
end;



procedure TForm1.cbb1Change(Sender: TObject);
begin
img1.Canvas.Pen.Width:=cbb1.ItemIndex;
end;





procedure TForm1.N4Click(Sender: TObject);
begin
Form1.Close;
end;

procedure TForm1.img10Click(Sender: TObject);
begin
  UsingElement:=6;
Form1.img8.Picture.LoadFromFile('6th.bmp');
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
UsingElement:=7;
img8.Picture:=nil;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
UsingElement:=8;
img8.Picture:=nil;
end;



procedure TForm1.N5Click(Sender: TObject);
begin
 Form3.Show;
end;





procedure TForm1.FormResize(Sender: TObject);
begin
shp2.Width:=Form1.Width;
shp1.Height:=Form1.Height;
img1.Height:=Form1.Height-img1.Top;
img1.Width:=Form1.Width-img1.Left;
end;

procedure TForm1.img11Click(Sender: TObject);
begin
  UsingElement:=9;
Form1.img8.Picture.LoadFromFile('7th.bmp');
end;

end.
