unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, inifiles, Psock, NMHttp, StdCtrls, OleCtrls, SHDocVw, ExtCtrls, XPMan, Shellapi,
  ComCtrls, Buttons;

type
  TForm1 = class(TForm)
    wb1: TWebBrowser;
    Timer1: TTimer;
    Memo1: TMemo;
    led1: TShape;
    XPManifest1: TXPManifest;
    Edit1: TEdit;
    StatusBar1: TStatusBar;
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    procedure wb1TitleChange(Sender: TObject;
      const Text: WideString);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wb1ProgressChange(Sender: TObject; Progress,
      ProgressMax: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure wb1DocumentComplete(Sender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
var
_URL: string;// = 'http://192.168.10.2:8082';
_LASTCAPTION: string;
procedure doAversRestart();
begin
Form1.Memo1.Lines.Add(TimeToStr(now)+' Restart AVERS & FireBird');
form1.Memo1.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+'logs.txt');
WinExec(PChar(Form1.Edit1.Text), SW_SHOW);
end;

procedure TForm1.wb1TitleChange(Sender: TObject;
  const Text: WideString);
begin
_LASTCAPTION:=text;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
//led1.Brush.Color:=cllime;
wb1.Navigate(_URL);
statusbar1.Panels[0].Text:=_URL;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
ini: tinifile;
begin
ini:=tinifile.Create(ExtractFilePath(Application.ExeName)+'config.txt');
_URL:=ini.ReadString('main', 'ip', 'http://dnevnik.gimnazia2nv.ru:8080');
edit1.Text:=ini.ReadString('main', 'script', 'c:\logonscripts\avers-restart.bat');
if FileExists(ExtractFilePath(Application.ExeName)+'logs.txt') then
memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+'logs.txt');
//wb1.Hide;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
ini: tinifile;
begin
ini:=tinifile.Create(ExtractFilePath(Application.ExeName)+'config.txt');
ini.WriteString('main', 'script', edit1.Text);
ini.WriteString('main', 'ip', _URL);
end;

procedure TForm1.wb1ProgressChange(Sender: TObject; Progress,
  ProgressMax: Integer);
begin

progressbar1.Max:=progressmax;
progressbar1.Position:=progress;

//showmessage('progress');
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
timer1.OnTimer(self);
end;

procedure TForm1.wb1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
//showmessage('!!!!1');
if _LASTCAPTION <> 'АИАС АВЕРС: Электронный Классный Журнал 2.5 (6995)' then
begin
memo1.Lines.Add('debug: '+_LASTCAPTION);
led1.Brush.Color:=clred;
doAversRestart;
end else led1.Brush.Color:=cllime;

end;

end.
