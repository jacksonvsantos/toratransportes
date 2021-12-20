object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 184
  Width = 357
  object QryPagamento: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 77
    Top = 32
    object QryPagamentoID: TIntegerField
      FieldName = 'IDPagamento'
    end
    object QryPagamentoDescricaoPagamento: TStringField
      FieldName = 'DescricaoPagamento'
      Size = 60
    end
  end
  object QryEstoque: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 152
    Top = 8
    object QryEstoqueID: TIntegerField
      FieldName = 'IDProduto'
    end
    object QryEstoqueDescricaoProduto: TStringField
      FieldName = 'DescricaoProduto'
      Size = 60
    end
    object QryEstoqueValorProduto: TCurrencyField
      FieldName = 'ValorProduto'
    end
  end
  object QryServicos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 232
    Top = 16
    object QryServicosIDCliente: TIntegerField
      FieldName = 'IDCliente'
    end
    object QryServicosIDProduto: TIntegerField
      FieldName = 'IDProduto'
    end
    object QryServicosIDPagamento: TIntegerField
      FieldName = 'IDPagamento'
    end
    object QryServicosNomeProduto: TStringField
      FieldName = 'DescricaoProduto'
      Size = 60
    end
    object QryServicosQuantidade: TIntegerField
      FieldName = 'Quantidade'
    end
    object QryServicosFormaPagemento: TStringField
      FieldName = 'FormaPagamento'
      Size = 30
    end
    object QryServicosValor: TCurrencyField
      FieldName = 'ValorProduto'
      DisplayFormat = 'R$ ###,###0.00'
    end
  end
  object QryCliente: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 144
    Top = 72
    object IntegerField1: TIntegerField
      FieldName = 'IDCliente'
    end
    object StringField1: TStringField
      FieldName = 'Nome'
    end
  end
end
