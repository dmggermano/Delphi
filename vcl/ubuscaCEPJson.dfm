object fBuscaCEP: TfBuscaCEP
  Left = 0
  Top = 0
  BiDiMode = bdLeftToRight
  Caption = 'fBuscaCEP'
  ClientHeight = 529
  ClientWidth = 626
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  ParentBiDiMode = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 193
    Width = 626
    Height = 16
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 133
    ExplicitWidth = 447
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 626
    Height = 41
    Align = alTop
    Caption = 'Brincando com JSON  - Delphi 10.3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 0
  end
  object plTop2: TPanel
    Left = 0
    Top = 41
    Width = 626
    Height = 152
    Align = alTop
    TabOrder = 1
    object Panel4: TPanel
      Left = 217
      Top = 1
      Width = 408
      Height = 150
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 222
      ExplicitTop = -4
      ExplicitHeight = 96
      object LCep: TLabel
        Left = 24
        Top = 5
        Width = 24
        Height = 13
        Caption = 'LCep'
      end
      object LLogradouro: TLabel
        Left = 24
        Top = 24
        Width = 31
        Height = 13
        Caption = 'Label1'
      end
      object LBairro: TLabel
        Left = 24
        Top = 43
        Width = 33
        Height = 13
        Caption = 'LBairro'
      end
      object LCidade: TLabel
        Left = 24
        Top = 62
        Width = 38
        Height = 13
        Caption = 'LCidade'
      end
      object LUF: TLabel
        Left = 24
        Top = 81
        Width = 38
        Height = 13
        Caption = 'LCidade'
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 216
      Height = 150
      Align = alLeft
      TabOrder = 1
      ExplicitHeight = 96
      object Label2: TLabel
        Left = 8
        Top = 5
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Caption = 'Digite o CEP:'
      end
      object SpeedButton1: TSpeedButton
        Left = 1
        Top = 108
        Width = 214
        Height = 41
        Align = alBottom
        Caption = 'Buscar CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        OnClick = SpeedButton1Click
        ExplicitTop = 54
      end
      object medtCEP: TMaskEdit
        Left = 8
        Top = 27
        Width = 119
        Height = 21
        EditMask = '99999-999;0'
        MaxLength = 9
        TabOrder = 0
        Text = '18057132'
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 209
    Width = 626
    Height = 320
    Align = alClient
    TabOrder = 2
    ExplicitTop = 155
    ExplicitHeight = 374
    object mmJson: TMemo
      Left = 1
      Top = 1
      Width = 624
      Height = 318
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 372
    end
  end
end
