unit tbl_conv_pas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, LazUTF8;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  if opendialog1.Execute then
  begin
  listbox1.Clear;
  listbox1.Items.LoadFromFile(opendialog1.filename);
  end;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.Button1Click(Sender: TObject);
var i, j: integer;
  cur_letter: string;
  letter_found: boolean = false;
begin
  edit3.clear;
  for i:=1 to Utf8length(edit2.Text) do
  begin
        letter_found:=false;
	cur_letter:=UTF8Copy(edit2.Text,i,1);
	for j:=0 to listbox1.Items.count-1 do
	if utf8copy(listbox1.items[j],utf8pos('=',listbox1.items[j])+1,255)=cur_letter then
        begin
	edit3.text:=edit3.text+copy(listbox1.items[j],0,pos('=',listbox1.items[j])-1)+' ';
        letter_found:=true;
        end;
        if letter_found = false then edit3.text:=edit3.text+'!'+cur_letter+' ';
  end;
edit3.text:=trim(edit3.text);
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
  if checkbox1.Checked then
  begin
  if utf8length(edit2.text)>utf8length(edit1.text) then edit2.Font.Color:=clRed
  else
    edit2.Font.Color:=clBlack;
  end
  else
  edit2.Font.Color:=clBlack;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if utf8length(edit1.text)>0 then
  edit4.text:=inttostr(utf8length(edit1.text))
  else
    edit4.clear;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
  //if trim(edit2.text)<>'' then
  if checkbox1.Checked then
  begin
  if utf8length(edit2.text)>utf8length(edit1.text) then edit2.Font.Color:=clRed
  else
    edit2.Font.Color:=clBlack;
  end;
  if utf8length(edit2.text)>0 then
  edit5.text:=inttostr(utf8length(edit2.text))
  else edit5.clear;
end;

end.

