object frmJson: TfrmJson
  Left = 0
  Top = 0
  Caption = 'Tela teste JSON'
  ClientHeight = 577
  ClientWidth = 939
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 529
    Top = 41
    Width = 16
    Height = 495
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 939
    Height = 41
    Align = alTop
    Caption = 'Brincando com JSON'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 529
    Height = 495
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 169
      Width = 527
      Height = 225
      Align = alClient
      DataSource = dsFuncionario
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -29
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold, fsItalic]
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -24
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold, fsItalic]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -24
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold, fsItalic]
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'salario'
          Title.Caption = 'sal'#225'rio'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -24
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold, fsItalic]
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'email'
          Title.Caption = 'e-mail'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -24
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold, fsItalic]
          Visible = True
        end>
    end
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 527
      Height = 168
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = 37
        Top = 14
        Width = 17
        Height = 16
        Caption = 'ID:'
      end
      object Label2: TLabel
        Left = 16
        Top = 50
        Width = 38
        Height = 16
        Caption = 'Nome:'
      end
      object Label3: TLabel
        Left = 9
        Top = 86
        Width = 45
        Height = 16
        Caption = 'Sal'#225'rio:'
      end
      object sbtIncluiReg: TSpeedButton
        Left = 333
        Top = 1
        Width = 193
        Height = 166
        HelpType = htKeyword
        Align = alRight
        Caption = 'Incluir Registro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = sbtIncluiRegClick
        ExplicitLeft = 329
        ExplicitTop = 5
      end
      object Label4: TLabel
        Left = 9
        Top = 119
        Width = 40
        Height = 16
        Caption = 'E-Mail:'
      end
      object edtID: TEdit
        Left = 60
        Top = 14
        Width = 121
        Height = 24
        TabOrder = 0
        Text = '1'
      end
      object edtNome: TEdit
        Left = 60
        Top = 48
        Width = 121
        Height = 24
        TabOrder = 1
        Text = 'Germano'
      end
      object edtSalario: TEdit
        Left = 60
        Top = 84
        Width = 121
        Height = 24
        TabOrder = 2
        Text = '3000'
      end
      object Edit1: TEdit
        Left = 60
        Top = 117
        Width = 173
        Height = 24
        TabOrder = 3
        Text = 'dmggermano@gmail.com'
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 394
      Width = 527
      Height = 100
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 2
      object sbtModelo1: TSpeedButton
        Left = 4
        Top = 5
        Width = 169
        Height = 48
        HelpType = htKeyword
        Caption = 'Gerar JSON - Mod 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = sbtModelo1Click
      end
      object sbtModelo2: TSpeedButton
        Left = 178
        Top = 6
        Width = 169
        Height = 48
        HelpType = htKeyword
        Caption = 'Gerar JSON - Mod 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = sbtModelo2Click
      end
      object sbtModelo3: TSpeedButton
        Left = 351
        Top = 5
        Width = 169
        Height = 48
        HelpType = htKeyword
        Caption = 'Gerar JSON - Mod 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = sbtModelo3Click
      end
      object chkFormatar: TCheckBox
        Left = 203
        Top = 62
        Width = 319
        Height = 25
        Caption = 'Formata'#231#227'o Padr'#227'o'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 536
    Width = 939
    Height = 41
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 2
    object SpeedButton1: TSpeedButton
      Left = 745
      Top = 1
      Width = 193
      Height = 39
      Align = alRight
      Caption = 'Salvar JSON'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
      ExplicitLeft = 224
      ExplicitTop = 6
      ExplicitHeight = 25
    end
  end
  object Panel4: TPanel
    Left = 545
    Top = 41
    Width = 394
    Height = 495
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 3
    object mmJson: TMemo
      Left = 1
      Top = 1
      Width = 392
      Height = 493
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object dmtFuncionario: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 512
    Top = 105
    object dmtFuncionarioid: TIntegerField
      FieldName = 'id'
    end
    object dmtFuncionarionome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object dmtFuncionariosalario: TFloatField
      FieldName = 'salario'
      currency = True
    end
    object dmtFuncionarioemail: TStringField
      FieldName = 'email'
    end
  end
  object dsFuncionario: TDataSource
    DataSet = dmtFuncionario
    Left = 512
    Top = 153
  end
end
