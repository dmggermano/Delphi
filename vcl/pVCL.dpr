program pVCL;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uJson in 'uJson.pas' {frmJson},
  ubuscaCEPJson in 'ubuscaCEPJson.pas' {fBuscaCEP},
  ufuncoes in 'ufuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
