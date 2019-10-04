#NoTrayIcon
IniRead, ConfigLigado        , ParametrosP1.txt, CONFIGURACOES, Ligado
IniRead, ConfigDias          , ParametrosP1.txt, CONFIGURACOES, DiasBloqueio
IniRead, ConfigDescricao     , ParametrosP1.txt, CONFIGURACOES, DescricaoDesbloqueio
IniRead, ConfigNumeroFaturas , ParametrosP1.txt, CONFIGURACOES, NumeroFaturas
IniRead, ConfigFaixaMenor    , ParametrosP1.txt, CONFIGURACOES, FaixaMenor
IniRead, ConfigFaixaMaior    , ParametrosP1.txt, CONFIGURACOES, FaixaMaior
IniRead, ConfigFilas         , ParametrosP1.txt, CONFIGURACOES, Filas

IF (ConfigLigado == "SIM"){
   Escolha := "Choose1"
}ELSE{
   Escolha := "Choose2"
}

Gui Font, Bold
Gui, Add, Text, x150 y29 w260 h20 , % "INFORME OS PARAMETROS PARA O ROBÔ"
Gui Font

Gui, Add, Text, x32 y70 w210 h20 , % "Ligar/desligar Analise de perfil pelo robô:"
Gui, Add, DropDownList, x260 y70 w210 vLigar %Escolha%, % "SIM|NÃO"

Gui, Add, Text, x32 y100 , % "Número de dias do desbloqueio do cartão:" 
Gui, Add, Edit, x260 y100 w100 h20 +Number vDias, % ConfigDias 

Gui, Add, Text, x32 y150 , % "Descrições que identificam um desbloqueio:"
Gui, Add, Edit, x260 y150 w300 h60 vDescricoesDesbloqueio, % ConfigDescricao

Gui, Add, Text, x32 y235 , % "Quantidade de faturas pagas a analisar:"
Gui, Add, Edit, x260 y235 w100 h20 vFaturas, % ConfigNumeroFaturas

Gui, Add, Text, x32 y270 , % "Faixa de Valores:                                                                    % a menor                        % a maior"
Gui, Add, Edit, x260 y270 w50 h20 +Number vFaixaaMenor, % ConfigFaixaMenor
Gui, Add, Edit, x380 y270 w50 h20 +Number vFaixaaMaior, % ConfigFaixaMaior

Gui, Add, Text, x32 y300 , % "Filas monitoradas pelo robô:"
Gui, Add, Edit, x260 y300 w300 h60 vFilasMonitoradas, % ConfigFilas 


Gui, Add, Button, x190 y410 w100 h30 ,% "Salvar"
Gui, Add, Button, x295 y410 w100 h30 ,% "Sair"
Gui, Show, w573 h464,% "FIS - Parametros Mesa Case P1"
Gui, Submit, NoHide
Return

GuiClose:
ExitApp

ButtonSalvar:
   Gui, submit, nohide
   IniWrite, % Ligar                  , ParametrosP1.txt, CONFIGURACOES, Ligado
   IniWrite, % Dias                   , ParametrosP1.txt, CONFIGURACOES, DiasBloqueio
   IniWrite, % DescricoesDesbloqueio  , ParametrosP1.txt, CONFIGURACOES, DescricaoDesbloqueio
   IniWrite, % Faturas                , ParametrosP1.txt, CONFIGURACOES, NumeroFaturas
   IniWrite, % FaixaaMenor            , ParametrosP1.txt, CONFIGURACOES, FaixaMenor
   IniWrite, % FaixaaMaior            , ParametrosP1.txt, CONFIGURACOES, FaixaMaior  
   IniWrite, % FilasMonitoradas       , ParametrosP1.txt, CONFIGURACOES, Filas
   ExitApp
ButtonSair:
   ExitApp
Return