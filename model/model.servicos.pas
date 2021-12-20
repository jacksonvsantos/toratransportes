unit model.servicos;

interface

  uses model.clientes, model.Produto,
    model.formaPagamento;

  type
    IContaBancaria = interface
      ['{96DDF553-2BA0-4294-9338-A2EC24A60FD3}']
      function GetCliente(idCliente: String): String;
      function Listar: String;
    end;

    TServico = class(TInterfacedObject, IContaBancaria)
    private
      FCliente: ICliente;
      FFormaPagamento: TFormaPagamento;
      FProduto: TEstoque;

      function GetDadosPagamento(idPagamento: Integer): TFormaPagamento;
      function GetDadosEstoque(idProduto: Integer): TEstoque;

    protected
      FIdCliente: Integer;
      FValorTotal: Currency;
    public
      constructor Create;
      function GetCliente(idCliente: String): String;

      destructor Destroy;
      function Listar: String;
    end;

implementation

  uses
    System.SysUtils,
    DModule;

  { TServico }

  constructor TServico.Create;
  begin
    inherited;
  end;

  destructor TServico.Destroy;
  begin
    inherited;
  end;

  function TServico.Listar: String;
  var
    pagamento: TFormaPagamento;
    estoque: TEstoque;

  begin
    if not DM.QryServicos.Active then
      begin
        DM.QryServicos.Open;
        DM.criar_venda;
      end;

    DM.QryServicos.Filtered := False;
    DM.QryServicos.Filter := 'Idcliente = ' + IntToStr(FCliente.Id);
    DM.QryServicos.Filtered := True;

    try
      pagamento := GetDadosPagamento(DM.QryServicos.FieldByName('IdPagamento')
          .AsInteger);
      estoque := GetDadosEstoque(DM.QryServicos.FieldByName('IdProduto')
          .AsInteger);

      DM.QryServicos.Edit;
      DM.QryServicos.FieldByName('FormaPagamento').AsString := pagamento.Nome;
      DM.QryServicos.FieldByName('DescricaoProduto').AsString := estoque.Nome;
      DM.QryServicos.FieldByName('ValorProduto').AsCurrency := estoque.Valor;
      DM.QryServicos.Post;

    finally
      FreeAndNil(pagamento);
      FreeAndNil(estoque);
    end;
  end;

  function TServico.GetCliente(idCliente: String): String;
  begin
    if DM.qryCliente.Locate('Idcliente', idCliente) then
      begin

        FCliente := TCliente.Create;

        FCliente.Id(DM.qryCliente.FieldByName('Idcliente').AsInteger)
          .Nome(DM.qryCliente.FieldByName('Nome').AsString);

        Result := FCliente.Nome;
      end
    else
      raise Exception.Create('Cliente não encontrado');
  end;

  function TServico.GetDadosEstoque(idProduto: Integer): TEstoque;
  var
    estoque: TEstoque;
  begin

    if DM.QryEstoque.Locate('IdProduto', idProduto) then
      begin
        estoque := TEstoque.Create;

        estoque.idProduto := DM.QryEstoque.FieldByName('IdProduto').AsInteger;
        estoque.Nome := DM.QryEstoque.FieldByName('DescricaoProduto').AsString;
        estoque.Valor := DM.QryEstoque.FieldByName('valorproduto').AsCurrency;

        Result := estoque;

      end;

  end;

  function TServico.GetDadosPagamento(idPagamento: Integer): TFormaPagamento;
  var
    pagamento: TFormaPagamento;
  begin

    if DM.QryPagamento.Locate('IdPagamento', idPagamento) then
      begin
        pagamento := TFormaPagamento.Create;

        pagamento.idPagamento := DM.QryPagamento.FieldByName('IdPagamento')
          .AsInteger;
        pagamento.Nome := DM.QryPagamento.FieldByName
          ('DescricaoPagamento').AsString;

        Result := pagamento;

      end;

  end;

end.
