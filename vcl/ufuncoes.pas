﻿unit ufuncoes;

interface

uses
   Windows, Messages, SysUtils, Classes,  Controls,  Dialogs, Vcl.Forms,
   Vcl.Imaging.jpeg, Vcl.Graphics;
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


end.
