unit DModule;

interface

  uses
    System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
    FireDAC.Stan.Param,
    FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
    Data.DB,
    FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient;

  type
    TDM = class(TDataModule)
      QryPagamento: TFDMemTable;
      QryPagamentoID: TIntegerField;
      QryPagamentoDescricaoPagamento: TStringField;
      QryEstoque: TFDMemTable;
      QryEstoqueID: TIntegerField;
      QryEstoqueDescricaoProduto: TStringField;
      QryEstoqueValorProduto: TCurrencyField;
      QryServicos: TFDMemTable;
      QryServicosIDCliente: TIntegerField;
      QryServicosIDProduto: TIntegerField;
      QryServicosIDPagamento: TIntegerField;
      QryServicosQuantidade: TIntegerField;
      QryCliente: TFDMemTable;
      IntegerField1: TIntegerField;
      StringField1: TStringField;
      QryServicosNomeProduto: TStringField;
      QryServicosValor: TCurrencyField;
      QryServicosFormaPagemento: TStringField;
      procedure DataModuleCreate(Sender: TObject);
    private
      procedure criar_clientes;
      procedure criar_pagamento;
      procedure criar_estoque;
    public
      procedure criar_venda;
    end;

  var
    DM: TDM;

implementation

  uses
    System.DateUtils;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

  procedure TDM.criar_clientes;
  var
    I, idCliente: Integer;
    nomeCliente: String;
  begin

    idCliente := 1;
    nomeCliente := 'Cleinte 1';

    QryCliente.Open;
    for I := 0 to 3 do
      begin
        QryCliente.Append;
        QryCliente.FieldByName('Idcliente').AsInteger := idCliente;
        QryCliente.FieldByName('Nome').AsString := nomeCliente;
        QryCliente.Post;

        Inc(idCliente);

        if idCliente = 2 then
          nomeCliente := 'Cliente 2'
        else if idCliente = 3 then
          nomeCliente := 'Cliente 3'
        else if idCliente = 4 then
          nomeCliente := 'Cliente 4';
      end;
  end;

  procedure TDM.criar_estoque;
  var
    I, IDProduto: Integer;
    DescricaoProduto: String;
    ValorProduto: Currency;
  begin
    IDProduto := 1;
    DescricaoProduto := 'Produto 1';
    ValorProduto := 1.00;

    QryEstoque.Open;
    for I := 0 to 3 do
      begin
        QryEstoque.Append;
        QryEstoque.FieldByName('IDProduto').AsInteger := IDProduto;
        QryEstoque.FieldByName('DescricaoProduto').AsString := DescricaoProduto;
        QryEstoque.FieldByName('ValorProduto').AsCurrency := ValorProduto;
        QryEstoque.Post;

        Inc(IDProduto);

        if IDProduto = 2 then
          begin
            DescricaoProduto := 'Produto 2';
            ValorProduto := 2.00;
          end
        else if IDProduto = 3 then
          begin
            DescricaoProduto := 'Produto 3';
            ValorProduto := 3.00;
          end
        else if IDProduto = 4 then
          begin
            DescricaoProduto := 'Produto 4';
            ValorProduto := 4.00;
          end;
      end;
  end;

  procedure TDM.criar_pagamento;
  var
    I, IDPagamento: Integer;
    DescricaoPagamento: String;
  begin
    IDPagamento := 1;
    DescricaoPagamento := 'Parcelado';

    QryPagamento.Open;
    for I := 0 to 3 do
      begin
        QryPagamento.Append;
        QryPagamento.FieldByName('IDPagamento').AsInteger := IDPagamento;
        QryPagamento.FieldByName('DescricaoPagamento').AsString :=
          DescricaoPagamento;
        QryPagamento.Post;

        Inc(IDPagamento);

        if IDPagamento = 2 then
          DescricaoPagamento := 'à vista'
        else if IDPagamento = 3 then
          DescricaoPagamento := 'a prazo'
        else if IDPagamento = 4 then
          DescricaoPagamento := 'bonificado';
      end;
  end;

  procedure TDM.criar_venda;
  var
    I, idCliente, IDProduto, IDPagamento, Quantidade: Integer;
  begin
    idCliente := 1;
    IDProduto := 1;
    IDPagamento := 1;

    Quantidade := 1;

    QryServicos.Open;
    for I := 0 to 3 do
      begin
        QryServicos.Append;
        QryServicos.FieldByName('IDCliente').AsInteger := idCliente;
        QryServicos.FieldByName('IDProduto').AsInteger := IDProduto;
        QryServicos.FieldByName('IDPagamento').AsInteger := IDPagamento;
        QryServicos.FieldByName('Quantidade').AsInteger := Quantidade;
        QryServicos.Post;

        Inc(idCliente);
        Inc(IDProduto);
        Inc(IDPagamento);
      end;
  end;

  procedure TDM.DataModuleCreate(Sender: TObject);
  begin
    criar_clientes;
    criar_pagamento;
    criar_estoque;
    criar_venda;
  end;

end.
