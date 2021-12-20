unit torainfoMain;

interface

  uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
    Vcl.DBGrids,
    Vcl.Buttons, Vcl.ExtCtrls,
    DModule, model.servicos;

  type
    TfrmMain = class(TForm)
      PanelCliente2: TPanel;
      PanelCliente1: TPanel;
      btnSelecionarCliente: TButton;
      edtIDCliente: TEdit;
      Label1: TLabel;
      lblCliente: TLabel;
      dbgContas: TDBGrid;
      DSClientes: TDataSource;
      DSServicos: TDataSource;
      DBGrid1: TDBGrid;
      btnServiços: TSpeedButton;
      Label2: TLabel;
      procedure btnSelecionarClienteClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure btnServiçosClick(Sender: TObject);
    private
      FController: TServico;
      procedure CapturaErro(Sender: TObject; E: Exception);
      procedure ValidarCliente;
    public
      { Public declarations }
    end;

  var
    frmMain: TfrmMain;

implementation

{$R *.dfm}

  procedure TfrmMain.btnServiçosClick(Sender: TObject);
  begin
    ValidarCliente;

    FController.Listar;
  end;

  procedure TfrmMain.btnSelecionarClienteClick(Sender: TObject);
  begin
    if edtIDCliente.Text = EmptyStr then
      begin
        MessageDlg('Favor informar o código do cliente', mtInformation,
          [mbok], 0);
        exit;
      end;

    FController := TServico.Create;
    lblCliente.Caption := FController.GetCliente(edtIDCliente.Text);

    btnServiços.Click;

  end;

  procedure TfrmMain.CapturaErro(Sender: TObject; E: Exception);
  begin
    MessageDlg(E.Message, mtWarning, [mbok], 0);
    lblCliente.Caption := EmptyStr;
    dm.QryServicos.close;
  end;

  procedure TfrmMain.FormCreate(Sender: TObject);
  begin
    Application.OnException := CapturaErro;
  end;

  procedure TfrmMain.FormShow(Sender: TObject);
  begin
    lblCliente.Caption := EmptyStr;
    dm.QryServicos.close;
  end;

  procedure TfrmMain.ValidarCliente;
  begin
    if lblCliente.Caption = EmptyStr then
      begin
        MessageDlg('Favor selecionar o cliente', mtWarning, [mbok], 0);
        Abort;
      end;
  end;

end.
