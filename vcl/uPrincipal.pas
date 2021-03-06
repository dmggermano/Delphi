unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    pnlBottom: TPanel;
    MainMenu1: TMainMenu;
    CadastroGeral1: TMenuItem;
    JSONteste1: TMenuItem;
    Sada1: TMenuItem;
    StatusBar1: TStatusBar;
    tmrHora: TTimer;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure Sada1Click(Sender: TObject);
    procedure tmrHoraTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure JSONteste1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    procedure f_frmJson;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses ufuncoes, uJson, ubuscaCEPJson;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
    statusbar1.panels[1].text:='Vers�o: '+ufuncoes.ObterVersaoWindows;;
    statusbar1.panels[2].text:='Usu�rio: '+ufuncoes.GetUsuarioSO;;
end;

procedure TfrmPrincipal.Image1Click(Sender: TObject);
begin
        if (frmJson=nil) then
        begin
          application.CreateForm(tfrmJson,frmJson);
        end;
end;

procedure TfrmPrincipal.JSONteste1Click(Sender: TObject);
begin
      f_frmJson;
end;

procedure TfrmPrincipal.Sada1Click(Sender: TObject);
begin
  Close;
end;

procedure tfrmPrincipal.f_frmJson;
begin
        if (frmJson=nil) then
        begin
          application.CreateForm(tfrmJson,frmJson);
        end;
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
    f_frmJson;
end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
        if (fBuscaCEP=nil) then
        begin
          application.CreateForm(tfBuscaCEP,fBuscaCEP);
        end;
end;

procedure TfrmPrincipal.tmrHoraTimer(Sender: TObject);
begin
  statusbar1.panels[0].text:='Data/Hora: '+DateTimeToStr(now);
end;

end.
