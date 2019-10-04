AcessaLoja(iIndexLojas) {
	AlimentaConfigLojas()
	site := EncontraSite(LOJASESCOLHIDAS[iIndexLojas])
	try {
		CloseProcess("iexplore.exe") 								;Fecha o IE no inicio de cada execucao
		logger("AcessaLoja(iIndexLojas) : Fechei o IE")
		IE := ComObjCreate("InternetExplorer.Application") 			;Instancia um novo IE
		logger("AcessaLoja(iIndexLojas) : Criei o objeto IE")
		IE.visible := true 											;Deixa o IE novo visivel
		logger("AcessaLoja(iIndexLojas) : Deixei o navegador visivel")
		IE.Navigate(site) 											;Navega para a pagina da Loja
		logger("AcessaLoja(iIndexLojas) : Estou navegando para o site")
		AguardaCarregamentoIE() 									;Aguarda o carregamento do IE
		if (WinExist(IE.LocationName)) {
			WinMaximize, % IE.LocationName
			WinActivate, % IE.LocationName
		}
		AguardaCarregamentoIE()
	}catch e {
		MsgBox,% "Houve algum erro ao acessar o site, favor reiniciar o robô, se o erro persistir enviar o log para o desenvolvedor"
		logger("AcessaLoja(iIndexLojas) : erro = " . e.message)
	}
}

BuscaCarta(nomeCarta:="") {
	try {
		AguardaElementoName("barraBuscaCampo")
		logger("BuscaCarta(nomeCarta:="") : Estou aguardando o elemento = barraBuscaCampo")
		IE.document.getElementById("fSearch").focus()
		logger("BuscaCarta(nomeCarta:="") : Estou focando na barra de busca")
		IE.document.getElementById("fSearch").value := nomeCarta
		logger("BuscaCarta(nomeCarta:="") : Inseri o nome da carta na barra de busca")
		Send, {Enter}
		logger("BuscaCarta(nomeCarta:="") : Pressionei o ENTER para pesquisa")
		logger("BuscaCarta(nomeCarta:="") : Estou aguardando o IE carregar")
		AguardaCarregamentoIE()
		logger("BuscaCarta(nomeCarta:="") : IE carregou")
		logger("BuscaCarta(nomeCarta:="") : Estou aguardando o elemento = pProdItem")
		AguardaElementoName("pProdItem", 0)
		logger("BuscaCarta(nomeCarta:="") : encontrei o elemento = pProdItem")
		iIndexText := 0
		loop ,10 {
			Sleep, 150
			if(IE.document.getElementsByClassName("textoMaior").length > 0) {
				logger("BuscaCarta(nomeCarta:="") : Entrei na tela para buscar o elemento = textoMaior")
				loop {
					texto := IE.document.getElementsByClassName("itemNamePI ellipsis")[iIndexText].innerText
					logger("BuscaCarta(nomeCarta:="") : estou coletando o texto = " texto)
					if(texto == nomeCarta) {
						logger("BuscaCarta(nomeCarta:="") : Encontrei a carta certa, NomeCarta = " nomeCarta)
						;~ IE.document.getElementsByClassName("pProdItens pMarg")[iIndexText].children[0].click()
						IE.document.getElementsByClassName("itemNamePI ellipsis")[iIndexText].click()
						Sleep, 1000
						break
					}else{
						iIndexText++
					}
				}
			}else{
				try {
					nomeAltImg := IE.document.getElementById("imagemOriginal").children[0].alt
				} catch e {
				}
				if(nomeAltImg != "" && InStr(nomeAltImg, nomeCarta)) {
					break
				}else{
					Sleep, 500
				}
			}
		}
		AguardaElementoName("hmin30", 0)
		logger("BuscaCarta(nomeCarta:="") : Estou aguardando o elemento = botaoComprar botaoComprarSubstituicao ")
		verPreorder := IE.document.getElementsByClassName("itemMain")[0].children[0].children[0].children[0].children[1].children[2].children[0].innerText
		if(InStr(verPreorder,"PRE ORDER")) {
			tamanho := (IE.document.getElementsByClassName("itemMain")[0].children[0].children[0].children[0].children[1].children[2].children[1].children[0].rows.length) - 1
		}else {
			tamanho := (IE.document.getElementsByClassName("itemMain")[0].children[0].children[0].children[0].children[1].children[2].children[0].children[0].rows.length) - 1
		}
		logger("BuscaCarta(nomeCarta:="") : Coletei todos os precos = " tamanho)
		loop {
			if (A_index > tamanho) {
				X := PRECO[1]
				X := ReconstroiPreco(X)
				;~ MsgBox,% "o preco da carta: " nomeCarta " é = " X
				logger("BuscaCarta(nomeCarta:="") : " "o preco da carta: " nomeCarta " é = " X)
				break
			}
			informacaoCarta := IE.document.getElementsByClassName("itemMain")[0].children[0].children[0].children[0].children[1].children[2].children[0].children[0].children[A_Index].innerText ;Estou entrando na primeira linha das cartas para buscar os preços
			if(InStr(informacaoCarta, "Me avise quando chegar")) {
				continue
			}
			RegExMatch(informacaoCarta, ")(\$.*)" ,informacaoCarta)
			informacaoCarta := FullClearText(informacaoCarta)
			informacaoCarta := StrReplace(informacaoCarta, "." , "")
			informacaoCarta := StrReplace(informacaoCarta, "," , "")
			PRECO.Push(informacaoCarta)
			if(A_Index > 1) {
				A := PRECO[1]
				A := Trim(A)
				;~ MsgBox,% "O preço de A = " A
				B := PRECO[2]
				B := Trim(B)
				;~ MsgBox,% "O preço de B = " B
				if(B > A || B == A) {
					;~ MsgBox,% "preco B = " B " é >= ao preco de A = " A " Vou deletar" 
					PRECO.Pop()
				}else if (A > B) {
					;~ MsgBox,% "preco A = " A " é > que o preco de B = " B " Vou deletar"
					PRECO.RemoveAt(1)
				}else{
					MsgBox,% "Durante a busca da carta = " . nomeCarta . " Houve um erro desconhecido, favor enviar o log para o desenvolvedor"
					logger("BuscaCarta(nomeCarta) : Durante a busca da carta = " . nomeCarta . " Houve um erro desconhecido, favor enviar o log para o desenvolvedor")
					ExitApp
				}
			}
		}
	} catch e {
		MsgBox,% "Houve algum erro ao buscar a carta = " e.message  "Favor enviar o log para o desenvolvedor"
		logger("BuscaCarta(nomeCarta) : erro = " e.message)
		ExitApp
	}
}

AguardaCarregamentoIE(timeout = 60, forcaRetorno = false){
	while (IE.readyState < 4 && IE.busy){
		sleep, 1000													;aguarda meio segundo
		contador++													;incrementa contador timeout
		if(contador == timeout){									;60 segundos vai retornar que não foi possivel carregar a pagina
			if(!forçaRetorno){
				logger("AguardaCarregamentoIE() : Estorou o timeOut")
				MsgBox,% "Nao consegui carregar a pagina Web, por favor reinicie o robô. Se o erro persistir envie o log para o desenvolvedor"
				ExitApp
			}
			return,% false											;retorna falso
		}
	}
	return,% true
}

AguardaElementoName(name, index=""){
	;Valida se a tela já carregou de fato
	AguardaCarregamentoIE()
	countTime := 0
	while(countTime <= 60){
		try{
			
			if(index==""){
				IE.document.getElementsByClassName(name)
			} else {
				IE.document.getElementsByClassName(name)[index]
			}
			break
		}
		countTime++
		Sleep, 1000
	}
	if(countTime > 60){
		logger("AguardaElementoName() : Estorou o timeOut")
		MsgBox,% "Nao consegui carregar a pagina Web, por favor reinicie o robô. Se o erro persistir envie o log para o desenvolvedor"
		ExitApp
	}
}

AguardaCartaTela(carta) {
	loop {
		x := IE.document.getElementsByClassName("itemMain")[0].children[0].children[0].children[0].children[1].children[0].innerText
		if(InStr(x, carta)) {
			break
		}
		Sleep, 1000
		if(A_index > 60) {
			MsgBox,% "A pagina nao carregou em tempo habil, favor reiniciar o robô, se o erro persistir favor enviar o log para o desenvolvedor"
			logger("AguardaCartaTela(carta) : Estorou o timeOut")
			ExitApp
		}
	}
}