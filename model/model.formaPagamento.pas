unit model.formaPagamento;

interface

  type

    TFormaPagamento = class
    private
      FIdPagamento: Integer;
      FNome: String;
      { private declarations }
    protected
      { protected declarations }
    public
      property IdPagamento: Integer read FIdPagamento write FIdPagamento;
      property Nome: String read FNome write FNome;

    published
      { published declarations }
    end;

implementation

end.
