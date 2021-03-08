unit ubuscaCEPJson;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.StdCtrls, System.JSON;

type

  TfBuscaCEP = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    plTop2: TPanel;
    Panel3: TPanel;
    mmJson: TMemo;
    Panel4: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    medtCEP: TMaskEdit;
    SpeedButton1: TSpeedButton;
    LCep: TLabel;
    LLogradouro: TLabel;
    LBairro: TLabel;
    LCidade: TLabel;
    LUF: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    procedure pLimpaDAdos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBuscaCEP: TfBuscaCEP;

implementation

{$R *.dfm}

uses ufuncoes;

procedure TfBuscaCEP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        action:=cafree;
        fBuscaCEP:=nil;
end;

procedure TfBuscaCEP.FormCreate(Sender: TObject);
begin
  pLimpaDados;
end;

procedure TfBuscaCEP.pLimpaDAdos;
begin
    LCep.Caption := '';
    LLogradouro.Caption := '';
    LBairro.Caption := '';
    LCidade.Caption := '';
    LUF.Caption := '';
end;

procedure TfBuscaCEP.SpeedButton1Click(Sender: TObject);
var
  xobj: TJSONObject;
begin
  pLimpaDados;
  mmJson.text:=ufuncoes.fBuscarPorCEP(medtCEP.Text);
  //Strin para Objeto Json -> facilita capturar os valores
  xobj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(mmJson.Text),0) as TJSONObject;
  try
    LCep.Caption := xobj.GetValue<string>('cep');
    LLogradouro.Caption := xobj.GetValue<string>('logradouro');
    LBairro.Caption := xobj.GetValue<string>('bairro');
    LCidade.Caption := xobj.GetValue<string>('localidade');
    LUF.Caption := xobj.GetValue<string>('uf');
  finally
   xobj.Free;
  end;

end;


end.
