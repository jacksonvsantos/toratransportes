program TorainfoProject;

uses
  Vcl.Forms,
  torainfoMain in 'view\torainfoMain.pas' {frmMain} ,
  model.clientes in 'model\model.clientes.pas',
  model.servicos in 'model\model.servicos.pas',
  LanguageControl in 'utils\LanguageControl.pas',
  DModule in 'dataModule\DModule.pas' {DM: TDataModule} ,
  model.formaPagamento in 'model\model.formaPagamento.pas',
  model.Produto in 'model\model.Produto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;

end.
