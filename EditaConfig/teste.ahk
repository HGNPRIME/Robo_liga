Gui Font, Bold
Gui, Add, Text, x150 y29 w260 h20 , % "INFORME OS PARAMETROS PARA O ROB�"
Gui Font

Gui, Add, Text, x32 y70 w210 h20 , % "Ligar/desligar Analise de perfil pelo rob�:"
Gui, Add, CheckBox, x32 y70 w210 h20 , "Ship to billing address?"
Gui, Show, w573 h464,% "FIS - Parametros Mesa Case P1"
Gui, Submit, NoHide
return