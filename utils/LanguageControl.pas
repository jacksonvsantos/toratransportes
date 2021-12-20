unit LanguageControl;

interface

implementation

  uses
    Windows, Consts;

  procedure HookResourceString(ResStringRec: pResStringRec; NewStr: pChar);
  var
    OldProtect: DWORD;
  begin
    VirtualProtect(ResStringRec, SizeOf(ResStringRec^), PAGE_EXECUTE_READWRITE,
      @OldProtect);
    ResStringRec^.Identifier := Integer(NewStr);
    VirtualProtect(ResStringRec, SizeOf(ResStringRec^), OldProtect,
      @OldProtect);
  end;

initialization

  HookResourceString(@SCannotOpenClipboard,
    'Incapaz de abrir a �rea de transfer�ncia');
  HookResourceString(@SMsgDlgWarning, '    ATEN��O');
  HookResourceString(@SMsgDlgError, 'Erro');
  HookResourceString(@SMsgDlgInformation, 'Informa��o');
  HookResourceString(@SMsgDlgConfirm, 'Confirme');
  HookResourceString(@SMsgDlgYes, '&Sim');
  HookResourceString(@SMsgDlgNo, '&N�o');
  HookResourceString(@SMsgDlgOK, 'OK');
  HookResourceString(@SMsgDlgCancel, 'Cancela');
  HookResourceString(@SMsgDlgHelp, '&Ajuda');
  HookResourceString(@SMsgDlgHelpNone, 'N�o possui Ajuda');
  HookResourceString(@SMsgDlgHelpHelp, 'Ajuda');
  HookResourceString(@SMsgDlgAbort, '&Abortar');
  HookResourceString(@SMsgDlgRetry, 'Tentar Novamente');
  HookResourceString(@SMsgDlgIgnore, '&Ignorar');
  HookResourceString(@SMsgDlgAll, '&Todos');
  HookResourceString(@SMsgDlgNoToAll, 'N�o para Todos');
  HookResourceString(@SMsgDlgYesToAll, 'Sim para Todos');
  HookResourceString(@SMsgDlgClose, 'Fechar');

end.
