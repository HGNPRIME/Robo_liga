#NoEnv  					 ; Recommended for performance and compatibility with future AutoHotkey releases.
							 ; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  			 ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SendMode, Input
DetectHiddenWindows, On
#SingleInstance, Force
#WinActivateForce
#Include lib\GenericFunctions.ahk
#Include lib\WebFunctions.ahk
#include vars.ahk



BuscaGrimorio("cartas a procurar.txt")
x := DECKLIST.length()
Loop {
	z := A_Index
	AcessaLoja(A_Index)
	h := LOJASESCOLHIDAS.length()
	if(A_index > h) {
		break
	}
	loop {
		if(A_Index > x) {
			break
		}
		BuscaCarta(DECKLIST[A_Index])
		CsvDecklist(DECKLIST[A_Index], z)
	}
}

F10::
MsgBox, encerrado pelo usuario
ExitApp


;*********************************************Inicio funcoes*****************************************
BuscaGrimorio(pathDeck) {
	try {
		logger("BuscaGrimorio() : Vou iniciar a leitura do deck")
		FileRead, deck,% pathDeck 									;Realiza a leitura do deck do arquivo TXT
		logger("BuscaGrimorio() : Realizei a leitura do deck")
		deck := RegExReplace(deck, "\d", "") 						;Elimina a quantidade das cartas do texto
		logger("BuscaGrimorio() : Eliminei a quantidade de cartas")
		deck := RegExReplace(deck, "\R", "|") 						;Coloca o delimitador
		logger("BuscaGrimorio() : Separei as cartas")
		deck := RegExReplace(deck, "/", "//") 						;Troca barra simples por barras duplas para que o LigaMagic entenda
		logger("BuscaGrimorio() : Realizei correcao ortogafica para melhor entendimento do sistema")
		DECKLIST := StrSplit(deck,"|") 								;Joga todas as cartas em um array
		logger("BuscaGrimorio() : Organizei as cartas")
		deckSize := (DECKLIST.length() + 5) 						;Pega o tamanho do deck e aumenta em 5 espacos para n�o haver erros na remocao de espacos em branco
		iLimparDecklist := 1
		Loop {
			if(A_Index == deckSize) {
				break
			}
			DECKLIST[iLimparDecklist] := Trim(DECKLIST[iLimparDecklist])
			if(DECKLIST[iLimparDecklist] == "" || DECKLIST[iLimparDecklist] == "Island" || DECKLIST[iLimparDecklist] == "Swamp" || DECKLIST[iLimparDecklist] == "Plains" || DECKLIST[iLimparDecklist] == "Mountain" || DECKLIST[iLimparDecklist] == "Forest") {								   ;Verifica se a carta em questao esta vazia ou terreno basico para assim remover
				logger("BuscaGrimorio() : Limpei uma busca desnecessaria")
				DECKLIST.RemoveAt(iLimparDecklist) 					;Realiza o delete da busca
				iLimparDecklist := (iLimparDecklist - 1) 			;corrigi o index
			}
			iLimparDecklist++
		}		
		deckSize := DECKLIST.length() 								;Determina o tamnho do deck apos a correcao
		loop {
			if(A_Index > deckSize) {
				break
			}
			DECKLIST[A_Index] := Trim(DECKLIST[A_Index]) 			;Apara os espacos vazios no inicio e fim da carta para melhor busca
		}
	} catch e {
		MsgBox,% "Houve algum erro ao ler o deck, favor enviar o log e txt do deck para o desenvolvedor"
		logger("BuscaGrimorio() : erro = " e.message)
		ExitApp
	}
}

AlimentaConfigLojas() {
	try {
		FileRead, config, config.ini ;Abrindo o arquivo com as lojas
		LOJASESCOLHIDAS := StrSplit(config,",")
		loop { ;Separando todas as lojas escolhidas em um array para buscar depois
			if(LOJASESCOLHIDAS[A_index] == "") {
				break
			}
			LOJASESCOLHIDAS[A_index] := Trim(LOJASESCOLHIDAS[A_index])
		}
	} catch e{
		MsgBox,% "Houve um erro ao ler o arquivo CONFIG, por favor separar as lojas por virgula, caso o problema persistir favor enviar o log para o desenvolvedor."
		logger("AlimentaConfigLojas() : erro = " e.message)
		ExitApp
	}
}


logger(texto) {
	loop {
		If(FileExist("C:\Log_liga"), "D") { 						;Verifica se a pasta existe
				FormatTime , dataHora , DDMMYYYYHH 					;Define a hora
				FileAppend,% dataHora " - " texto "`n" , %PATHLOG% 	;Regista o log
				break
		}else{
			FileCreateDir, C:\Log_liga\ 							;Caso a pasta n�o exista cria uma
		}
	}
}

FullClearText(texto) {
	texto := RegExReplace(texto, ")\n","")
	texto := RegExReplace(texto, ")\R","")
	texto := RegExReplace(texto, ")\s", "")
	texto := StrReplace(texto, "  ", "", countSpace)
	texto := StrReplace(texto, "$", "")
	texto := Trim(texto)
	return,% texto
}

EncontraSite(loja) {
	if(Instr(loja, "Bazar de Bagda")) {
		return,% "https://bazardebagda.com.br/"
	}else if (Instr(loja, "Medieval Cards")){
		return,% "https://www.medievalcards.com.br/"
	}else if (Instr(loja, "MTG Cards Games")){
		return,% "https://www.mtgcardsgames.com.br/"
	}else if (Instr(loja, "Ascens�o")){
		return,% "https://www.ascensaocards.com.br/"
	}else if (Instr(loja, "Elder Dragon Brasil")){
		return,% "https://elderdragonbrasil.com.br/"
	}else if (Instr(loja, "Livraria do Infinito - MagicJebb")){
		return,% "https://www.livrariadoinfinito.com.br/"
	}else if (Instr(loja, "Power9")){
		return,% "https://www.power9.com.br/"
	}else if (Instr(loja, "WCG - World Card Games")){
		return,% "https://www.worldcardgames.com.br/"
	}else if (Instr(loja, "Magicdomain")){
		return,% "https://magicdomain.com.br/"
	}else if (Instr(loja, "MTG Brasil")){
		return,% "https://www.mtgbrasil.com.br/"
	}else if (Instr(loja, "VampireX TCG")){
		return,% "https://www.vampirextcg.com.br/"
	}else if (Instr(loja, "Player Stop")){
		return,% "https://playersstoptcg.com/"
	}else if (Instr(loja, "Load or Cast")){
		return,% "https://loadorcast.com/"
	}else if (Instr(loja, "Epic Game")){
		return,% "https://www.epicgame.com.br/"
	}else if (Instr(loja, "Magicbembarato")){
		return,% "https://www.magicbembarato.com.br/"
	}else if (Instr(loja, "Cards Of Paradise")){
		return,% "https://www.cardsofparadise.com.br/"
	}else{
		logger("EncontraSite() : Loja nao mapeada = " loja)
		MsgBox,% "Finalizado"
		;~ MsgBox,% "Nao consegui identificar o loja, por favor envie o log para o desenvolvedor"
		ExitApp
	}
}



ReconstroiPreco(valor) {
	valorPrimario := SubStr(valor, 1 , -2)
	valorSecundario := SubStr(valor, -1)
	valorCorrigido := valorPrimario . "," . valorSecundario
	return valorCorrigido
}


CsvDecklist(nomeCarta, indiceLoja) {
	valor := PRECO[1]
	valor := ReconstroiPreco(valor)
	PRECO.Pop()
	nomeLoja := LOJASESCOLHIDAS[indiceLoja]
	if(valor == ",") {
		valor := "A carta nao esta disponivel na loja"
	}else{
		valor := "R$ " . valor
	}
	If(FileExist("Preco_deck"), "D") { 						;Verifica se a pasta existe
		FileAppend, %nomeCarta% = %valor%`n, Preco_deck\precoDeck %nomeLoja%.txt
	}else{
		FileCreateDir, Preco_deck 							;Caso a pasta n�o exista cria uma
	}
}
