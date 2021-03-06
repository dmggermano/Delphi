unit uJson;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  
  // unit do CRM
  ufuncoes,

  // units para JSON MODELO 1
  System.json,

  // units para JSON MODELO 2
  system.json.types, system.json.writers, system.json.Builders;

type
  TfrmJson = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Splitter1: TSplitter;
    mmJson: TMemo;
    SpeedButton1: TSpeedButton;
    dmtFuncionario: TFDMemTable;
    dmtFuncionarioid: TIntegerField;
    dmtFuncionarionome: TStringField;
    dmtFuncionariosalario: TFloatField;
    dsFuncionario: TDataSource;
    DBGrid1: TDBGrid;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtID: TEdit;
    edtNome: TEdit;
    edtSalario: TEdit;
    sbtIncluiReg: TSpeedButton;
    Label4: TLabel;
    edtEmail: TEdit;
    dmtFuncionarioemail: TStringField;
    Panel5: TPanel;
    sbtModelo1: TSpeedButton;
    sbtModelo2: TSpeedButton;
    sbtModelo3: TSpeedButton;
    chkFormatar: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtModelo1Click(Sender: TObject);
    procedure sbtIncluiRegClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbtModelo2Click(Sender: TObject);
    procedure sbtModelo3Click(Sender: TObject);
  private
      /// <summary>
      ///   verifica se os campos edit foram informados e seta o foco no erro
      /// </summary>
      function fValidarDados : boolean;
      /// <summary>
      ///   limpa os campo edit para nova inclusao
      /// </summary>
      procedure limpaEdit;
  public
      /// <summary>
      ///   inclui os dados na tabela
      /// </summary>
      function incluiReg(tid,tnome,tsalario,temail:string):boolean;
    { Public declarations }
  end;

var
  frmJson: TfrmJson;

implementation

{$R *.dfm}

procedure TfrmJson.FormActivate(Sender: TObject);
begin
    sbtIncluiRegClick(sender);
end;

procedure TfrmJson.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        action:=cafree;
        frmJson:=nil;
end;

procedure TfrmJson.sbtModelo1Click(Sender: TObject);
var
  jjsonFuncionario : tjsonObject;
  jjsonFuncionarios : TJSONArray;
  erro : Boolean;
begin
  if (dmtFuncionario.RecordCount <= 0) then
  begin
    showmessage('N�o h� dados. Favor incluir primeiro.');
    exit;
  end;

  erro:=false;
  try
      try
          jjsonFuncionarios := TJSONArray.Create;
          dmtFuncionario.First;
          while not dmtFuncionario.Eof do
          begin
              jjsonFuncionario := tjsonObject.Create;
              jjsonFuncionario.AddPair(dmtFuncionarioid.FieldName.ToLower, dmtFuncionarioid.AsString);
              jjsonFuncionario.AddPair(dmtFuncionarioNome.FieldName.ToLower, dmtFuncionarionome.AsString);
              jjsonFuncionario.AddPair(dmtFuncionarioSalario.FieldName.ToLower, TJSONNumber.create(dmtFuncionarioSalario.asfloat));
              jjsonFuncionario.AddPair(dmtFuncionarioemail.FieldName.ToLower, dmtFuncionarioemail.AsString);
              jjsonFuncionarios.AddElement(jjsonFuncionario);
              dmtFuncionario.Next;
          end;
      except
            erro:=true;
      end;
      mmJson.Text:=jjsonFuncionarios.ToString;
  finally
    begin
      jjsonFuncionarios.Free;
      if erro = true then
          showmessage('Erro ao criar JSON!');
    end;
  end;
end;

procedure TfrmJson.sbtModelo2Click(Sender: TObject);
var
  jjsonTextW : TJsonTextWriter;

begin

    try
      jjsonTextW := TJsonTextWriter.Create(TStringWriter.Create,true);
      // para a JSON ficar mais apresent�vel
      if (chkFormatar.Checked) then
          jjsonTextW.Formatting := TJsonFormatting(1)
      else
          jjsonTextW.Formatting := TJsonFormatting(0);
      jjsonTextW.WriteStartArray;
      dmtFuncionario.First;
      while not dmtFuncionario.Eof do
      begin
            jjsonTextW.WriteStartObject;

            jjsonTextW.WritePropertyName('id');
            jjsonTextW.WriteValue(dmtFuncionarioid.AsInteger);
            jjsonTextW.WritePropertyName('nome');
            jjsonTextW.WriteValue(dmtFuncionarionome.AsString);
            jjsonTextW.WritePropertyName('salario');
            jjsonTextW.WriteValue(dmtFuncionariosalario.AsFloat);
            jjsonTextW.WritePropertyName('email');
            jjsonTextW.WriteValue(dmtFuncionarioemail.AsString);

            jjsonTextW.WriteEndObject;
            dmtFuncionario.Next;
      end;
      jjsonTextW.WriteEnd;
      mmJson.Text:=jjsonTextW.Writer.ToString;
    finally
      jjsonTextW.Free;
    end;
end;

procedure TfrmJson.SpeedButton1Click(Sender: TObject);
begin
  try
      ForceDirectories('c:\temp');
      ufuncoes.salvaImagemDoForm('c:\temp\telaJSON.jpeg', Screen.ActiveForm);
      salvaArquivoTXT('c:\temp\dadosJSON.json',mmJson.Text,'S');
      ShowMessage('Arquivo(S) salvos na pasta c:\temp.  IMAGEM e JSON');
  except
      showmessage('� necess�rio a pasta criada em c:\temp. Onde salva os arquivos.');
  end;
end;

procedure TfrmJson.sbtModelo3Click(Sender: TObject);
var
  jjsonTextW : TJsonTextWriter;

begin


    try
      try
          jjsonTextW := TJsonTextWriter.Create(TStringWriter.Create,true);
          jjsonTextW.WriteStartObject;

          // para a JSON ficar mais apresent�vel
          if (chkFormatar.Checked) then
              jjsonTextW.Formatting := TJsonFormatting(1)
          else
              jjsonTextW.Formatting := TJsonFormatting(0);


          jjsonTextW.WritePropertyName('funcionarios');

                jjsonTextW.WriteStartArray;
                dmtFuncionario.First;
                while not dmtFuncionario.Eof do
                begin

                  jjsonTextW.WriteStartObject;
                      jjsonTextW.WritePropertyName('id');
                      jjsonTextW.WriteValue(dmtFuncionarioid.AsInteger);
                      jjsonTextW.WritePropertyName('nome');
                      jjsonTextW.WriteValue(dmtFuncionarionome.AsString);
                      jjsonTextW.WritePropertyName('salario');
                      jjsonTextW.WriteValue(dmtFuncionariosalario.AsFloat);
                      jjsonTextW.WritePropertyName('email');
                      jjsonTextW.WriteValue(dmtFuncionarioemail.AsString);
                  jjsonTextW.WriteEndObject;

                  dmtFuncionario.Next;
                end;
                jjsonTextW.WriteEnd;

          jjsonTextW.WriteEndObject;

          mmJson.Text:=jjsonTextW.Writer.ToString;
      except
          showmessage('Erro ao gerar JSON.');
      end;
    finally
      jjsonTextW.Free;
    end;
end;

procedure TfrmJson.sbtIncluiRegClick(Sender: TObject);
begin
  if fValidarDados = false then
  begin
     showmessage('Favor verificar os dados!');
     exit;
  end;
  if incluiReg(edtid.Text,edtnome.Text,edtsalario.Text,edtEmail.Text) then
  begin
      limpaEdit;
  end;
end;


procedure TfrmJson.FormCreate(Sender: TObject);
begin
  dmtFuncionario.Open;
end;

function TfrmJson.fValidarDados : boolean;
var
  i:integer;
begin
    result:=true;
    for I := 0 to ComponentCount-1 do
    begin
        if (Components[i] is TEdit) then
        begin
          if (length(trim(TEdit(Components[i]).Text)) <= 0) then
          begin
            result:=false;
            TEdit(Components[i]).SetFocus;
            break;
          end;
        end;
    end;
end;

function TfrmJson.incluiReg(tid, tnome, tsalario, temail: string): boolean;
begin
    try
         dmtFuncionario.Append;
         dmtFuncionario.FieldByName('id').Value:=tid;
         dmtFuncionario.FieldByName('nome').Value:=tnome;
         dmtFuncionario.FieldByName('salario').Value:=tsalario;
         dmtFuncionario.FieldByName('email').Value:=temail;
         dmtFuncionario.Post;
    except
          showmessage('Erro na inclus�o da tabela.'+#13+'Campos ID e Salario devem ser num�ricos.');
          result:=false;
    end;
    result:=true;
end;

procedure TfrmJson.limpaEdit;
var
  i:integer;
begin
    for I := 0 to ComponentCount-1 do
    begin
        if (Components[i] is TEdit) then
        begin
            TEdit(Components[i]).Clear;
        end;
    end;
    edtid.setfocus;
end;

end.
