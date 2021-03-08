unit ufuncoes;

interface

uses
   Windows, Messages, SysUtils, Classes,  Controls,  Dialogs, Vcl.Forms,
   Vcl.Imaging.jpeg, Vcl.Graphics,   IdHTTP, IdSSLOpenSSL;
/// <summary>
///   pega o nome do usuario do windows
/// </summary>
  function GetUsuarioSO : string;

/// <summary>
///   pega a versao do sistema operacional
/// </summary>
  function ObterVersaoWindows: string;

///	<summary>
///	  Funcao que salva copia da tela no arquivo informado ('XARQVO.JPEG',Screen.ActiveForm)
///	</summary>
procedure  salvaImagemDoForm(const sNomeArquivo: string; oForm : TForm);

///	<summary>
///	  Funcao para salvar arquivo texto: xnomeArquivo, xtexto a ser valvo e xpermiteExcluir se arquivo ja existe. retorna False se arquiva ja existe e nao foi excluido
///	</summary>
function salvaArquivoTXT(xnomeArquivo, xtexto, xpermiteExcluir:string ):boolean;

/// <summary>
///   Busca endere pelo numero do CEP no correio
/// </summary>
function fBuscarPorCEP(cep:string):string;

implementation

function GetUsuarioSO : string;
var
  Size: dword;
begin
  // retorna o login do usu�rio do sistema operacional
  Size := 1024;
  SetLength(result, Size);
  GetUserName(PChar(result), Size);
  SetLength(result, Size - 1);
end;

function ObterVersaoWindows: string;
begin
  case System.SysUtils.Win32MajorVersion of
    5:
      case System.SysUtils.Win32MinorVersion of
        1: result := 'Windows XP';
      end;
    6:
      case System.SysUtils.Win32MinorVersion of
        0: result := 'Windows Vista';
        1: result := 'Windows 7';
        2: result := 'Windows 8';
        3: result := 'Windows 8.1';
      end;
    10:
      case System.SysUtils.Win32MinorVersion of
        0: result := 'Windows 10';
      end;
  end;
end;

procedure  salvaImagemDoForm(const sNomeArquivo: string; oForm : TForm);
var
  Bitmap: Vcl.Graphics.TBitmap;
  JPEG: TJpegImage;
begin
  JPEG := TJpegImage.Create;
  try
    Bitmap := oForm.GetFormImage;
    JPEG.Assign(Bitmap);
    JPEG.SaveToFile(sNomeArquivo);
  finally
    JPEG.Free;
    Bitmap.Free;
  end;
end;


function salvaArquivoTXT(xnomeArquivo, xtexto, xpermiteExcluir:string ):boolean;
var
        f,ff:textfile;
begin
        result:=true;
        if fileexists(xnomeArquivo)=true then
        begin
            if xpermiteExcluir='S' then
            begin
               try
                  deletefile(xnomeArquivo)
               except
                     begin
                        messagedlg('Não foi possivel excluir o arquivo.',mtInformation,[mbAbort],0);
                        result:=false;
                        exit;
                     end;
               end;
            end
            else
            begin
                messagedlg('Arquivo já existe!',mtInformation,[mbAbort],0);
                result:=false;
                exit;
            end;
        end;
        try
              assignfile(f,xnomeArquivo);
              rewrite(f);
              writeln(f,xtexto);
              closefile(f);
              messagedlg('Arquivo salvo com o nome:'+#13+#13+xnomeArquivo,mtConfirmation,[mbclose],0);
        except
               begin
                  messagedlg('Não foi possível salvar o arquivo.',mtInformation,[mbAbort],0);
                  result:=false;
                  exit;
               end;
        end;
end;

function fBuscarPorCEP(cep:string):string;
const
  _url = 'https://viacep.com.br/ws/';
  _urlCompl = '/json/';
var
  txt:string;
  xidhttp1: TIdHTTP;
  xidSSL: TIdSSLIOHandlerSocketOpenSSL;
  xjson: string;

begin
  txt:=_url+cep+_urlCompl;
  xidHTTP1 := TIdHTTP.Create;
  try
    try
      xidSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
      xidSSL.SSLOptions.Method := sslvSSLv23;
      xidSSL.SSLOptions.SSLVersions := [sslvTLSv1_2];

      //criação do request para a API (necessário para atribuir  UserAgent)
      xidHTTP1.Request.UserAgent := 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';
      xidHTTP1.IOHandler := xidSSL;

      //popula o xjson com os dados da API
      xjson := xIdHTTP1.Get(txt);
    finally
      xidSSL.Free;
    end;
  finally
    xIdHTTP1.Free;
  end;
  result:=xjson;
end;

end.
