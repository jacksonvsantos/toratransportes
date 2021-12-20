unit model.Produto;

interface

  type

    TEstoque = class
    private
      FIdProduto: Integer;
      FNome: String;
      FValor: Currency;
      { private declarations }
    protected
      { protected declarations }
    public
      property IdProduto: Integer read FIdProduto write FIdProduto;
      property Nome: String read FNome write FNome;
      property Valor: Currency read FValor write FValor;

    published
      { published declarations }
    end;

implementation

end.
