object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Servi'#231'os'
  ClientHeight = 476
  ClientWidth = 1041
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelCliente2: TPanel
    Left = 0
    Top = 198
    Width = 1041
    Height = 307
    Caption = 'PanelCliente2'
    TabOrder = 0
    object Label2: TLabel
      Left = 9
      Top = 10
      Width = 91
      Height = 13
      Caption = 'Servi'#231'os do Cliente'
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 29
      Width = 1039
      Height = 277
      Align = alBottom
      DataSource = DSServicos
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object PanelCliente1: TPanel
    Left = 0
    Top = 0
    Width = 1041
    Height = 195
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 9
      Top = 19
      Width = 84
      Height = 13
      Caption = 'C'#243'digo do Cliente'
    end
    object lblCliente: TLabel
      Left = 220
      Top = 40
      Width = 100
      Height = 14
      Caption = 'Nome do Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnServiços: TSpeedButton
      Left = 108
      Top = -1
      Width = 102
      Height = 28
      Caption = 'Lista Servi'#231'os'
      Visible = False
      OnClick = btnServiçosClick
    end
    object btnSelecionarCliente: TButton
      Left = 104
      Top = 33
      Width = 106
      Height = 28
      Caption = 'Selecionar Cliente'
      TabOrder = 0
      OnClick = btnSelecionarClienteClick
    end
    object edtIDCliente: TEdit
      Left = 9
      Top = 36
      Width = 86
      Height = 21
      Hint = 
        'Posicione no ID do cliente na Lista abaixo e clique em Seleciona' +
        'r Cliente'
      NumbersOnly = True
      TabOrder = 1
    end
    object dbgContas: TDBGrid
      Left = 0
      Top = 69
      Width = 1041
      Height = 126
      Align = alBottom
      DataSource = DSClientes
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object DSClientes: TDataSource
    DataSet = DM.QryCliente
    Left = 696
    Top = 104
  end
  object DSServicos: TDataSource
    DataSet = DM.QryServicos
    Left = 744
    Top = 200
  end
end
