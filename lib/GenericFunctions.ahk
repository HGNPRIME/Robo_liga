/*
	Title: Command Functions
		A wrapper set of functions for commands which have an output variable.
	License:
		- Version 1.41 <http://www.autohotkey.net/~polyethene/#functions>
		- Dedicated to the public domain (CC0 1.0) <http://creativecommons.org/publicdomain/zero/1.0/>
*/
#Include lib\Gdip_All.ahk

Functions() {
	Return, true
}

IfBetween(ByRef var, LowerBound, UpperBound) {
	If var between %LowerBound% and %UpperBound%
		Return, true
}

IfNotBetween(ByRef var, LowerBound, UpperBound) {
	If var not between %LowerBound% and %UpperBound%
		Return, true
}

IfIn(ByRef var, MatchList) {
	If var in %MatchList%
		Return, true
}

IfNotIn(ByRef var, MatchList) {
	If var not in %MatchList%
		Return, true
}

IfContains(ByRef var, MatchList) {
	If var contains %MatchList%
		Return, true
}

IfNotContains(ByRef var, MatchList) {
	If var not contains %MatchList%
		Return, true
}

IfIs(ByRef var, type) {
	If var is %type%
		Return, true
}

IfIsNot(ByRef var, type) {
	If var is not %type%
		Return, true
}

ControlGet(Cmd, Value = "", Control = "", WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "") {
	ControlGet, v, %Cmd%, %Value%, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return, v
}

ControlGetFocus(WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "") {
	ControlGetFocus, v, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return, v
}

ControlGetText(Control = "", WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "") {
	ControlGetText, v, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return, v
}

DriveGet(Cmd, Value = "") {
	DriveGet, v, %Cmd%, %Value%
	Return, v
}

DriveSpaceFree(Path) {
	DriveSpaceFree, v, %Path%
	Return, v
}

EnvGet(EnvVarName) {
	EnvGet, v, %EnvVarName%
	Return, v
}

FileGetAttrib(Filename = "") {
	FileGetAttrib, v, %Filename%
	Return, v
}

FileGetShortcut(LinkFile, ByRef OutTarget = "", ByRef OutDir = "", ByRef OutArgs = "", ByRef OutDescription = "", ByRef OutIcon = "", ByRef OutIconNum = "", ByRef OutRunState = "") {
	FileGetShortcut, %LinkFile%, OutTarget, OutDir, OutArgs, OutDescription, OutIcon, OutIconNum, OutRunState
}

FileGetSize(Filename = "", Units = "") {
	FileGetSize, v, %Filename%, %Units%
	Return, v
}

FileGetTime(Filename = "", WhichTime = "") {
	FileGetTime, v, %Filename%, %WhichTime%
	Return, v
}

FileGetVersion(Filename = "") {
	FileGetVersion, v, %Filename%
	Return, v
}

FileRead(Filename) {
	FileRead, v, %Filename%
	Return, v
}

FileReadLine(Filename, LineNum) {
	FileReadLine, v, %Filename%, %LineNum%
	Return, v
}

FileSelectFile(Options = "", RootDir = "", Prompt = "", Filter = "") {
	FileSelectFile, v, %Options%, %RootDir%, %Prompt%, %Filter%
	Return, v
}

FileSelectFolder(StartingFolder = "", Options = "", Prompt = "") {
	FileSelectFolder, v, %StartingFolder%, %Options%, %Prompt%
	Return, v
}

FormatTime(YYYYMMDDHH24MISS = "", Format = "") {
	FormatTime, v, %YYYYMMDDHH24MISS%, %Format%
	Return, v
}

GetKeyState(WhichKey , Mode = "") {
	GetKeyState, v, %WhichKey%, %Mode%
	Return, v
}

GuiControlGet(Subcommand = "", ControlID = "", Param4 = "") {
	GuiControlGet, v, %Subcommand%, %ControlID%, %Param4%
	Return, v
}

ImageSearch(ByRef OutputVarX, ByRef OutputVarY, X1, Y1, X2, Y2, ImageFile) {
	ImageSearch, OutputVarX, OutputVarY, %X1%, %Y1%, %X2%, %Y2%, %ImageFile%
}

IniRead(Filename, Section, Key, Default = "") {
	IniRead, v, %Filename%, %Section%, %Key%, %Default%
	Return, v
}

Input(Options = "", EndKeys = "", MatchList = "") {
	Input, v, %Options%, %EndKeys%, %MatchList%
	Return, v
}

InputBox(Title = "", Prompt = "", HIDE = "", Width = "", Height = "", X = "", Y = "", Font = "", Timeout = "", Default = "") {
	InputBox, v, %Title%, %Prompt%, %HIDE%, %Width%, %Height%, %X%, %Y%, , %Timeout%, %Default%
	Return, v
}

MouseGetPos(ByRef OutputVarX = "", ByRef OutputVarY = "", ByRef OutputVarWin = "", ByRef OutputVarControl = "", Mode = "") {
	MouseGetPos, OutputVarX, OutputVarY, OutputVarWin, OutputVarControl, %Mode%
}

PixelGetColor(X, Y, RGB = "") {
	PixelGetColor, v, %X%, %Y%, %RGB%
	Return, v
}

PixelSearch(ByRef OutputVarX, ByRef OutputVarY, X1, Y1, X2, Y2, ColorID, Variation = "", Mode = "") {
	PixelSearch, OutputVarX, OutputVarY, %X1%, %Y1%, %X2%, %Y2%, %ColorID%, %Variation%, %Mode%
}

Random(Min = "", Max = "") {
	Random, v, %Min%, %Max%
	Return, v
}

RegRead(RootKey, SubKey, ValueName = "") {
	RegRead, v, %RootKey%, %SubKey%, %ValueName%
	Return, v
}

Run(Target, WorkingDir = "", Mode = "") {
	Run, %Target%, %WorkingDir%, %Mode%, v
	Return, v	
}

SoundGet(ComponentType = "", ControlType = "", DeviceNumber = "") {
	SoundGet, v, %ComponentType%, %ControlType%, %DeviceNumber%
	Return, v
}

SoundGetWaveVolume(DeviceNumber = "") {
	SoundGetWaveVolume, v, %DeviceNumber%
	Return, v
}

StatusBarGetText(Part = "", WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "") {
	StatusBarGetText, v, %Part%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return, v
}

SplitPath(ByRef InputVar, ByRef OutFileName = "", ByRef OutDir = "", ByRef OutExtension = "", ByRef OutNameNoExt = "", ByRef OutDrive = "") {
	SplitPath, InputVar, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
}

StringGetPos(ByRef InputVar, SearchText, Mode = "", Offset = "") {
	StringGetPos, v, InputVar, %SearchText%, %Mode%, %Offset%
	Return, v
}

StringLeft(ByRef InputVar, Count) {
	StringLeft, v, InputVar, %Count%
	Return, v
}

StringRight(ByRef InputVar, Count) {
	StringRight, v, InputVar, %Count%
	Return, v
}

StringTrimLeft(ByRef InputVar, Count) {
	StringTrimLeft, v, InputVar, %Count%
	Return, v
}

StringTrimRight(ByRef InputVar, Count) {
	StringTrimRight, v, InputVar, %Count%
	Return, v
}

StringLower(ByRef InputVar, T = "") {
	StringLower, v, InputVar, %T%
	Return, v
}

StringUpper(ByRef InputVar, T = "") {
	StringUpper, v, InputVar, %T%
	Return, v
}

SysGet(Subcommand, Param3 = "") {
	SysGet, v, %Subcommand%, %Param3%
	Return, v
}

Transform(Cmd, Value1, Value2 = "") {
	Transform, v, %Cmd%, %Value1%, %Value2%
	Return, v
}

WinGet(Cmd = "", WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "") {
	WinGet, v, %Cmd%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return, v
}

WinGetActiveTitle() {
	WinGetActiveTitle, v
	Return, v
}

WinGetClass(WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "") {
	WinGetClass, v, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return, v
}

WinGetText(WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "") {
	WinGetText, v, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return, v
}

WinGetTitle(WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "") {
	WinGetTitle, v, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return, v
}

/*
	Function: DateParse
		Converts almost any date format to a YYYYMMDDHH24MISS value.
	Parameters:
		str - a date/time stamp as a string
	Returns:
		A valid YYYYMMDDHH24MISS value which can be used by FormatTime, EnvAdd and other time commands.
	Example:
	> time := DateParse("2:35 PM, 27 November, 2007")
	License:
		- Version 1.05 <http://www.autohotkey.net/~polyethene/#dateparse>
		- Dedicated to the public domain (CC0 1.0) <http://creativecommons.org/publicdomain/zero/1.0/>
*/
CalcDateAndFormat(dateStart,totalDays,formatTo:="dd/MM/yyyy",formatFrom:="dd/MM/yyyy"){
	
	if(dateStart == "" || totalDays == "" || formatTo == "" || formatFrom == ""){
		return, % "Parametros não podem estar vazios"
	}
	
	if(InStr(dateStart,"/") <= 0 && InStr(dateStart,"-") <= 0){
		FormatTime, dateStart, %dateStart%, % formatTo
	}
	
	if(InStr(dateStart,"/") > 0 ){
		arrDateStart := StrSplit(dateStart, "/")
	} else {
		if(InStr(dateStart,"-") > 0 ){
			arrDateStart := StrSplit(dateStart, "-")
		} else {
			return, % "Separador do Formato do parametro dateStart Invalido"
		}
	}
	if(InStr(formatTo,"/") > 0 ){
		arrFormat := StrSplit(formatTo, "/")
	} else {
		if(InStr(formatTo,"-") > 0 ){
			arrFormat := StrSplit(formatTo, "-")
		} else {
			return, % "Separador do Formato do parametro format Invalido"
		}
	}
	
	if(StringLower(arrFormat[1]) == "dd" && StringLower(arrFormat[2]) == "mm" && StringLower(arrFormat[3]) == "yyyy"){
		startTmp := arrDateStart[3] . arrDateStart[2] . arrDateStart[1]
	} else {
		if(StringLower(arrFormat[1]) == "yyyy" && StringLower(arrFormat[2]) == "mm" && StringLower(arrFormat[3]) == "dd"){
			startTmp := arrDateStart[1] . arrDateStart[2] . arrDateStart[3]
		} else {
			if(StringLower(arrFormat[1]) == "mm" && StringLower(arrFormat[2]) == "dd" && StringLower(arrFormat[3]) == "yyyy"){
				startTmp := arrDateStart[1] . arrDateStart[2] . arrDateStart[3]
			} else {
				return, % "Formato da Data Invalido"
			}
		}
	}
	
	endTmp := startTmp
	endTmp += totalDays, Days
	
	FormatTime, endTmp, %endTmp%, % formatFrom
	
	return, % endTmp
}
DateParse(str) {
	static e2 = "i)(?:(\d{1,2}+)[\s\.\-\/,]+)?(\d{1,2}|(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\w*)[\s\.\-\/,]+(\d{2,4})"
	str := RegExReplace(str, "((?:" . SubStr(e2, 42, 47) . ")\w*)(\s*)(\d{1,2})\b", "$3$2$1", "", 1)
	If RegExMatch(str, "i)^\s*(?:(\d{4})([\s\-:\/])(\d{1,2})\2(\d{1,2}))?"
		. "(?:\s*[T\s](\d{1,2})([\s\-:\/])(\d{1,2})(?:\6(\d{1,2})\s*(?:(Z)|(\+|\-)?"
		. "(\d{1,2})\6(\d{1,2})(?:\6(\d{1,2}))?)?)?)?\s*$", i)
		d3 := i1, d2 := i3, d1 := i4, t1 := i5, t2 := i7, t3 := i8
	Else If !RegExMatch(str, "^\W*(\d{1,2}+)(\d{2})\W*$", t)
		RegExMatch(str, "i)(\d{1,2})\s*:\s*(\d{1,2})(?:\s*(\d{1,2}))?(?:\s*([ap]m))?", t)
			, RegExMatch(str, e2, d)
	f = %A_FormatFloat%
	SetFormat, Float, 02.0
	d := (d3 ? (StrLen(d3) = 2 ? 20 : "") . d3 : A_YYYY)
		. ((d2 := d2 + 0 ? d2 : (InStr(e2, SubStr(d2, 1, 3)) - 40) // 4 + 1.0) > 0
			? d2 + 0.0 : A_MM) . ((d1 += 0.0) ? d1 : A_DD) . t1
			+ (t1 = 12 ? t4 = "am" ? -12.0 : 0.0 : t4 = "am" ? 0.0 : 12.0) . t2 + 0.0 . t3 + 0.0
	SetFormat, Float, %f%
	Return, d
}

; Script by brutosozialprodukt
; http://ahkscript.org/boards/viewtopic.php?f=6&t=1674

; Revision: joedf
; Changes:  - Changed progress bar style & colors
;           - Changed Display Information
;           - Commented-out Size calculation
;           - Added ShortURL()
;           - Added short delay 100 ms to show the progress bar if download was too fast
;           - Added ProgressBarTitle
;           - Try-Catch "backup download code"
; ----------------------------------------------------------------------------------

DownloadFile(UrlToFile, SaveFileAs, Overwrite := True, UseProgressBar := True, ProgressBarTitle:="Downloading...") {
    ;Check if the file already exists and if we must not overwrite it
      If (!Overwrite && FileExist(SaveFileAs))
          Return
    ;Check if the user wants a progressbar
      If (UseProgressBar) {
          _surl:=ShortURL(UrlToFile)
          ;Initialize the WinHttpRequest Object
            WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
          ;Download the headers
            WebRequest.Open("HEAD", UrlToFile)
            WebRequest.Send()
          ;Store the header which holds the file size in a variable:
          try
            FinalSize := WebRequest.GetResponseHeader("Content-Length")
          catch
          {
            ;throw Exception("could not get Content-Length for URL: " UrlToFile)
            Progress, CWFEFEF0 CT111111 CB468847 w330 h52 B1 FS8 WM700 WS700 FM8 ZH12 ZY3 C11, , %ProgressBarTitle%, %_surl%
            UrlDownloadToFile, %UrlToFile%, %SaveFileAs%
            Sleep 100
            Progress, Off
            return
          }
          ;Create the progressbar and the timer
            Progress, CWFEFEF0 CT111111 CB468847 w330 h52 B1 FS8 WM700 WS700 FM8 ZH12 ZY3 C11, , %ProgressBarTitle%, %_surl%
            SetTimer, __UpdateProgressBar, 100
      }
    ;Download the file
      UrlDownloadToFile, %UrlToFile%, %SaveFileAs%
    ;Remove the timer and the progressbar because the download has finished
      If (UseProgressBar) {
          Sleep 100
          Progress, Off
          SetTimer, __UpdateProgressBar, Off
      }
    Return
    
    ;The label that updates the progressbar
      __UpdateProgressBar:
         ;Get the current filesize and tick
            CurrentSize := FileOpen(SaveFileAs, "r").Length ;FileGetSize wouldn't return reliable results
            CurrentSizeTick := A_TickCount
          ;Calculate the downloadspeed
            ;Speed := Round((CurrentSize/1024-LastSize/1024)/((CurrentSizeTick-LastSizeTick)/1000)) . " Kb/s"
          ;Save the current filesize and tick for the next time
            ;LastSizeTick := CurrentSizeTick
            ;LastSize := FileOpen(SaveFileAs, "r").Length
          ;Calculate percent done
            PercentDone := Round(CurrentSize/FinalSize*100)
          ;Update the ProgressBar
          _csize:=Round(CurrentSize/1024,1)
          _fsize:=Round(FinalSize/1024)
            Progress, %PercentDone%, Downloading:  %_csize% KB / %_fsize% KB  [ %PercentDone%`% ], %_surl%
      Return
}

ShortURL(p,l=50) {
    VarSetCapacity(_p, (A_IsUnicode?2:1)*StrLen(p) )
    DllCall("shlwapi\PathCompactPathEx"
        ,"str", _p
        ,"str", p
        ,"uint", abs(l)
        ,"uint", 0)
    return _p
}
;---------------------------------------------------OCR------------------------------------------------------------------

GetAllTextWindowOCR( winTitle ){
    textWindow := ""
    oldWinTitle := WinGetActiveTitle()
    AssertWindow(winTitle)
    ;Pega as posições iniciais e tamanho da janela
    WinGetPos, x_inicio, y_inicio, width, height,% winTitle
    
    ;Calcula a posicao final
    x_fim := % x_inicio + width
    y_fim := % y_inicio + height
    
    textWindow := OCR(x_inicio, y_inicio, x_fim, y_fim)
    
    AssertWindow(oldWinTitle)
    
    return, textWindow
}

WaitTelaTextOCR(x_inicio, y_inicio, x_fim, y_fim, textWait, tempo){
    sair := false
    contTempo := 0
    while (sair <> true and contTempo < tempo){
        textWindowOcr := OCR(x_inicio, y_inicio, x_fim, y_fim)
        if( InStr(textWindowOcr, textWait) > 0 ){
            sair := true
        }
        else
        {
            contTempo ++
            Sleep,1000
        }
    } 
    ;if(contTempo >= tempo){
        ;throw Exception("Timeout aguardando busca do processo na Logare.", A_LineNumber)
    ;}
	return, sair
}

OCR(x_inicio, y_inicio, x_fim, y_fim, multLine = 0, language = "Portuguese")
{
	pathOCR:= "..\..\..\tools\OCR"
	fileResult:= % pathOCR "\Result.txt"
	try{
		FileDelete, % fileResult
	}
	
	lineBreak := multLine = 0 ? "":" --line-breaks"
	result := multLine = 0 ? "" :Object()
	exeOCR:= % pathOCR "\Capture2Text_CLI --screen-rect """ x_inicio " " y_inicio " " x_fim " " y_fim """ -o """ fileResult """ --language """ language """" lineBreak
	
	RunWait, % exeOCR,,Hide
	
	Loop, read, % fileResult
	{
		line := A_LoopReadLine
		if(multLine = 0)
		{
			result:=line
			break
		}
		result.Insert(line)
	}
	
	FileDelete, % fileResult
	return, % result
}

/*
Zip/Unzip file(s)/folder(s)/wildcard pattern files
Requires: Autohotkey_L, Windows > XP
URL: http://www.autohotkey.com/forum/viewtopic.php?t=65401
Credits: Sean for original idea


;; --------- 	EXAMPLE CODE	-------------------------------------
;~ FilesToZip = D:\Projects\AHK\_Temp\Test\  ;Example of folder to compress
;~ FilesToZip = D:\Projects\AHK\_Temp\Test\*.ahk  ;Example of wildcards to compress
;~ FilesToZip := A_ScriptFullPath   ;Example of file to compress
;~ sZip := A_ScriptDir . "\Test.zip"  ;Zip file to be created
;~ sUnz := A_ScriptDir . "\ext\"      ;Directory to unzip files

;~ Zip(FilesToZip,sZip)
;~ Sleep, 500
;~ Unz(sZip,sUnz)
;; --------- 	END EXAMPLE 	-------------------------------------

*/

Zip(FilesToZip,sZip)
{
If Not FileExist(sZip)
	CreateZipFile(sZip)
psh := ComObjCreate( "Shell.Application" )
pzip := psh.Namespace( sZip )
if InStr(FileExist(FilesToZip), "D")
	FilesToZip .= SubStr(FilesToZip,0)="\" ? "*.*" : "\*.*"
loop,%FilesToZip%,1
{
	zipped++
	ToolTip Zipping %A_LoopFileName% ..
	pzip.CopyHere( A_LoopFileLongPath, 4|16 )
	Loop
	{
		done := pzip.items().count
		if done = %zipped%
			break
	}
	done := -1
}
ToolTip
}

CreateZipFile(sZip)
{
	Header1 := "PK" . Chr(5) . Chr(6)
	VarSetCapacity(Header2, 18, 0)
	file := FileOpen(sZip,"w")
	file.Write(Header1)
	file.RawWrite(Header2,18)
	file.close()
}

Unz(sZip, sUnz)
{
    fso := ComObjCreate("Scripting.FileSystemObject")
    If Not fso.FolderExists(sUnz)  ;http://www.autohotkey.com/forum/viewtopic.php?p=402574
       fso.CreateFolder(sUnz)
    psh  := ComObjCreate("Shell.Application")
    zippedItems := psh.Namespace( sZip ).items().count
    psh.Namespace( sUnz ).CopyHere( psh.Namespace( sZip ).items, 4|16 )
    Loop {
        sleep 50
        unzippedItems := psh.Namespace( sUnz ).items().count
        ToolTip Unzipping in progress..
        IfEqual,zippedItems,%unzippedItems%
            break
    }
    ToolTip
}
;---------------- END Functions ZIP -----------------------------------

;------------------ NETWORK FOLDERS -----------------------------------

MappingFolderNetwork(localServerShare, caminhoServerShare, userName, password){
	NetworkObject := ComObjCreate("WScript.Network")
	folderMapped := false

	if( SubStr(localServerShare, StrLen(localServerShare), StrLen(localServerShare)) == "\" ){
		localServerShare := SubStr(localServerShare, 1, StrLen(localServerShare)-1)
	}
	if( SubStr(caminhoServerShare, StrLen(caminhoServerShare), StrLen(caminhoServerShare)) == "\" ){
		caminhoServerShare := SubStr(caminhoServerShare, 1, StrLen(caminhoServerShare)-1)
	}
	
	try{
		try{
			NetworkObject.MapNetworkDrive( localServerShare, caminhoServerShare, false, userName, password )
			folderMapped := true
		} catch e {
			try{
				if(InStr(e.message, "The local device name is already in use.") == 0){
					if( InStr(e.message, "Multiple connections to a server or shared resource by the same user, using more than one user name, are not allowed. Disconnect all previous connections to the server or shared resource and try again.") > 0 || InStr(e.message, "The user name or password is incorrect.") > 0) {
						NetworkObject.MapNetworkDrive( localServerShare, caminhoServerShare, false )
						folderMapped := true
					} else {
						throw Exception(e.number, e.message)
					}
				} else { 
					folderMapped := true
				}
			} catch e {
				NetworkObject.RemoveNetworkDrive( localServerShare, true, false )
				try{
					NetworkObject.MapNetworkDrive( localServerShare, caminhoServerShare, false, userName, password )
				} catch e {
					if(InStr(e.message, "Multiple connections to a server or shared resource by the same user, using more than one user name, are not allowed. Disconnect all previous connections to the server or shared resource and try again.") > 0 ){
						NetworkObject.MapNetworkDrive( localServerShare, caminhoServerShare, false )
					} else {
						throw Exception(e.number, e.message)
					}
				}
				folderMapped := true
			}
		}
	} catch e {
		folderMapped := false
	}
	return, % folderMapped
}

RemoveFolderNetwork(localServerShare){
	NetworkObject := ComObjCreate("WScript.Network")
	folderRemoved := false
	
	if( SubStr(localServerShare, StrLen(localServerShare), StrLen(localServerShare)) == "\" ){
		localServerShare := SubStr(localServerShare, 1, StrLen(localServerShare)-1)
	}
	
	try{
		NetworkObject.RemoveNetworkDrive( localServerShare, true, true )
		folderRemoved := true
	} catch e {
		folderRemoved := false
	}

	return, % folderRemoved
}
;------------------ END NETWORK FOLDERS -----------------------------------
;==============================================================================================================================
; Retorna uma imagem na pasta selecionada 
; 	parametros:
;   FullFilePath - Caminho inteiro do arquivo na qual deseja ser salvo. Ex: C:\exemplo.png
;
;   Nota: Necessario a bibioteca "Gdip.ahk" na pasta padrao do ahk
;         Ou usar o #Include para chama-la manualmente no codigo
;==============================================================================================================================
FullPrintScreen(FullFilePath){   
	
   ;Pega o caminho do arquivo e cria uma pasta caso nao esteja criada
   SplitPath, FullFilePath, OutFileName
   path := StrReplace(FullFilePath, "\" . OutFileName, "") ;retira o nome do arquivo e deixa somente as pastas
   FileCreateDir, %path% ; Crias todas as pastas necessarias.

   pToken  := Gdip_Startup() ; "Liga" a biblioteca 
   pBitmap := Gdip_BitmapFromScreen() ; Printa a tela
   Gdip_SaveBitmapToFile(pBitmap, FullFilePath) ; salva o arquivo na pasta escolhida
   Gdip_Shutdown(pToken) ; "Desliga" a biblioteca
   
   ;verifica se o arquivo ja foi gravado
   while NOT FileExist(FullFilePath)
      Sleep, 10
   
   return
}


CloseProcess(strProcessName, strExceptPIDs="") {
    ;[Parameters]
    ;   strProcesName : the proess name to be closed. e.g. AutoHotkey.exe
    ;   strExceptPIDs : a list of eception PIDs not to be closed delimited by commas. e.g. 1234,5678,987
    ;[Return Value]
    ;   the count of closed processes.
	nCount := 0
	Loop {
		nClosedPID := False
		for process in ComObjGet("winmgmts:").ExecQuery("Select Name,ProcessID from Win32_Process Where Name='" strProcessName "'") {
			nLoopPID := process.ProcessID
			if nLoopPID not in %strExceptPIDs%
			{
				Process, Close, % process.ProcessID
				if (nClosedPID := ErrorLevel)
					nCount++
			}
		}
	} Until !nClosedPID
	Return nCount
}

;~ ##############################################################
;~ Preenchimento e captura de texto em tela
;~ ##############################################################
SendKey(key, qtde = 1, tempoEspera = 50) {
	loop, % qtde {
		Send, % key
		Sleep, % tempoEspera
	}
}

;Captura texto em inputs ja selecionado
GetTextSelected(selectText=true)
{
	Clipboard :=

	if(selectText == true) {
		Send, {Home}{ShiftDown}{End}{ShiftUp}
		Sleep, 100
	}
	Sleep, 100
	Send, {CtrlDown}c{CtrlUp}
	ClipWait, 1
	return, % Clipboard
}

;Captura texto em inputs via tab
GetTextTab(qtdTab = 0, selectText=true)
{
	Clipboard :=
	SendKey("{TAB}", qtdTab)

	if(selectText == true) {
		Send, {Home}{ShiftDown}{End}{ShiftUp}
		Sleep, 100
	}
	Sleep, 100
	Send, {CtrlDown}c{CtrlUp}
	ClipWait, 1
	return, % Clipboard
}

;Insere texto em inputs via tab
SetTextTab(pText, qtdTab = 0, deleteText = false)
{
	SendKey("{TAB}", qtdTab)
	
	if(deleteText == true) {
		Sleep, 100
		SendInput, {Home}{ShiftDown}{End}{ShiftUp}{Delete}
		Sleep, 100
	}	
	SendInput, % "{Raw}" pText
}

;Copia texto arrastando mouse
GetTextMouseDrag(x1, y1, x2, y2)
{
	Clipboard :=
	MouseClickDrag, Left, x1, y1, x2, y2, 5
	Sleep, 100
	Send {CtrlDown}c{CtrlUp}
	ClipWait, 1
	return, Clipboard
}

;Copia texto selecionando o texto com clicks mouse
GetTextMouseClick(x = 0, y = 0, clicks = 1, selectText = false)
{
	Clipboard :=
	MouseClick, Left, x, y, clicks

	if(selectText == true) {
		Send, {Home}{ShiftDown}{End}{ShiftUp}	
		Sleep, 100		
	}
	Sleep, 100
	Send {CtrlDown}c{CtrlUp}
	ClipWait, 1
	return, Clipboard
}

;Insere texto via mouseclick
SetTextMouseClick(pText, x = 0, y = 0, deleteText=false) {
	MouseClick, Left, x, y, 1, 5
	
	if(deleteText == true){
		Sleep, 100
		SendInput, {Home}{ShiftDown}{End}{ShiftUp}{Delete}
		Sleep, 100
	}
	Sleep, 200
	
	SendInput, % "{Raw}" pText
}

;~ ##############################################################
;~ Tratamento de Strings
;~ ##############################################################

;Retira todos os espaços duplos da string
FullTrim(pTexto){
	Loop{
		pTexto := Trim(pTexto)
		pTexto := RegExReplace(pTexto, "\s", " ")
		pTexto := StrReplace(pTexto, "  ", " ", countSpace)
		
		if countSpace = 0
			break
	}
	return, pTexto
}

;~ RemoveAcentos(string) {
    ;~ len := DllCall("Normaliz.dll\NormalizeString", "int", 2
        ;~ , "wstr", string, "int", StrLen(string)
        ;~ , "ptr", 0, "int", 0)  ; Get *estimated* required buffer size.
    ;~ Loop {
        ;~ VarSetCapacity(buf, len * 2)
        ;~ len := DllCall("Normaliz.dll\NormalizeString", "int", 2
            ;~ , "wstr", string, "int", StrLen(string)
            ;~ , "ptr", &buf, "int", len)
        ;~ if len >= 0
            ;~ break
        ;~ if (A_LastError != 122) ; ERROR_INSUFFICIENT_BUFFER
            ;~ return
        ;~ len *= -1  ; This is the new estimate.
    ;~ }
    ;~ ; Remove combining marks and return result.
    ;~ return, RegExReplace(StrGet(&buf, len, "UTF-16"), "\pM")
;~ }

;~ ##############################################################
;~ Tratamento em tela
;~ ##############################################################
;Verifica se existe o classNN na janela
ClassNNExists(title,classNN){
    hWndWindow := WinExist(WinTitle)
    WinGet, ClassNNList, ControlList, ahk_id %hWndWindow%
    Loop, PARSE, ClassNNList, `n
    {
      if ( A_LoopField = classNN)
         return, true
    }
    return, false
}
;Valida e ativa a tela com base no nome da tela
ValidaTelaNome(nomeTela, tentativas = 0, moveMouse=false)
{
	loop {
		if (moveMouse) {
			MouseMove, A_ScreenWidth / 2 + 1, A_ScreenHeight / 2 + 1, 2
			MouseMove, A_ScreenWidth / 2 - 1, A_ScreenHeight / 2 - 1, 2
		}
		
		if (WinExist(nomeTela)) {
			WinActivate, % nomeTela
			WinWaitActive, % nomeTela, , 60
			if ErrorLevel
			{
				return, false
			}
			
			sleep, 300
			return, true
			
		}else{
			Sleep, 1000
			tentativas--
		}
		
	} until (tentativas == 0)
	return, false
}

;Valida e ativa a tela com base no texto visivel da tela
ValidaTelaTexto(textoTela, tentativas = 0, moveMouse=false, nomeTela="")
{
	Loop {
		if (moveMouse) {
			MouseMove, A_ScreenWidth / 2 + 1, A_ScreenHeight / 2 + 1, 2
			MouseMove, A_ScreenWidth / 2 - 1, A_ScreenHeight / 2 - 1, 2
		}
		
		if (WinExist(nomeTela,textoTela)){
			WinActivate, % nomeTela, % textoTela
			WinWaitActive, % nomeTela, % textoTela
			sleep, 300
			return, true
		}else{
			Sleep, 1000
			tentativas--
		}
		
	} until (tentativas == 0)
	return, false
}

;Valida e ativa a tela com base no ClassNN visivel da tela
ValidaTelaClassNN(nomeTela = "", classNN = "", tentativas = 0, moveMouse=false)
{
	Loop {
		if (moveMouse) {
			MouseMove, A_ScreenWidth / 2 + 1, A_ScreenHeight / 2 + 1, 2
			MouseMove, A_ScreenWidth / 2 - 1, A_ScreenHeight / 2 - 1, 2
		}
		
		if (ClassNNExists(nomeTela ,classNN)){
			WinActivate,, % textoTela
			WinWaitActive,, % textoTela
			sleep, 300
			return, true
		}else{
			Sleep, 1000
			tentativas--
		}
		
	} until (tentativas == 0)
	return, false
}
AssertWindow(titulo) {
	WinActivate, %titulo%
	WinWaitActive, %titulo%
	sleep 1000
}

;~ ##############################################################
;~ Color Pixel
;~ ##############################################################
GetPixel(x, y, color="") {	
	PixelGetColor, OutPutColor, x, y
	v := color == "" ? OutPutColor : color == OutPutColor ? true : false
	return v
}

SearchPixel(X1, Y1, X2, Y2, color, variation=0, outPutPos=0){
	PixelSearch, vX, vY, X1, Y1, X2, Y2, % color, % variation, Fast
	if(!ErrorLevel){
		r := outPutPos == 1 ? [vX, vY] : true
	}else{
		r := false
	}
	return, r
}

ValidaCor(color, X1, Y1, X2=0, Y2=0, tentativas=0, moveMouse=true)
{
	Loop {
		if (moveMouse) {
			MouseMove, A_ScreenWidth / 2 + 1, A_ScreenHeight / 2 + 1, 2
			MouseMove, A_ScreenWidth / 2 - 1, A_ScreenHeight / 2 - 1, 2
		}
		
		if (X2 + Y2 != 0){
			PixelSearch, vX, vY, X1, Y1, X2, Y2, % color,, Fast
			if(!ErrorLevel){
				return true
			}
		}else{
			PixelGetColor, OutPutColor, X1, Y1
			if OutPutColor == color
				return true
		}
		
	} until (tentativas == 0)
	
	return, false
}

ValidaImagem(pathImg, X1, Y1, X2, Y2, tentativas=0, outPutPos=0, moveMouse = true)
{
	Loop {
		if (moveMouse) {
			MouseMove, A_ScreenWidth / 2 + 1, A_ScreenHeight / 2 + 1, 2
			MouseMove, A_ScreenWidth / 2 - 1, A_ScreenHeight / 2 - 1, 2
		}
		
		ImageSearch, OutputVarX, OutputVarY, X1, Y1, X2, Y2, % pathImg
		if(!ErrorLevel){
			r := outPutPos == 1 ? [OutputVarX, OutputVarY] : true
		}else{
			r := false
		}
		return, r
		
	} until (tentativas == 0)

	return, false
}

;~ ##############################################################
;~ Datas
;~ ##############################################################
;Feriados nacionais
holidays = 20180330,20180421,20180501,20180907,20181012,20181102,20181115,20181225,20190101,20190419,20190421,20190501,20190907,20191012,20191102,20191115,20191225,20200101,20200410,20200421,20200501,20200907,20201012,20201102,20201115,20201225,20210101,20210402,20210421,20210501,20210907,20211012,20211102,20211115,20211225

; incrementar ou decrementar o dia util 
; para decremetar usar numero negativo
; date := timestamp
WorkDay(date, utilsDays)
{
	global holidays
	next := date
	n := InStr(utilsDays, "-") ? "-" : "" 
	
	loop, % Abs(utilsDays)
	{
		loop
		{
			w_date := n == "-" ? w_date-- : w_date++
			incrementDay := n == "-" ? -1 : 1
			
			envadd, next, % incrementDay, days
			FormatTime, w_date, % next, WDay
			
			if (w_date = 7) {
				w_date := n == "-" ? 6 : 2
				incrementDay := n == "-" ? -1 : 2
				envadd, next, % incrementDay, days
			}
			if (w_date = 1) {
				w_date := n == "-" ? 6 : 2
				incrementDay := n == "-" ? -2 : 1
				envadd, next, % incrementDay, days
			}
			formattime, hnext, % next, yyyyMMdd
			if hnext not in % holidays
				break
		}
	}
	
	return hnext
}

;Ultimo dia do mês
endOfMonth(date)
{
	; get current month and year
	FormatTime, date, %date%, yyyyMM
	StringRight, month, date, 2
	FormatTime, year, %date%, yyyy
	; select first day of the following month
	If month < 12
	{
		month++
		If month < 10 ; add leading zero
			month = 0%month%
		date = %year%%month%01
	}
	Else
	{
		year++
		date = %year%0101
	}
	; select last day of actual month
	date += -1, Days
	; return date
	Return date
}
; --------------------------------------------------FUNCTIONS TIMER----------------------------------------------------------------------
; Create an object.
Timer := {}
; Store a value.
Timer.timeRun := A_TickCount
Timer.timeOut := 60000
; Create a method by storing a function reference.
Timer.Elapsed := Func("Timer_Elapsed")
Timer.GetProperty := Func("Timer_GetProperty")
Timer.SetProperty := Func("Timer_SetProperty")

; Functions of Timer Object
Timer_GetProperty(this, property)
{
	try{
		if(property == "timeOut"){
			return this.timeOut
		}else{
			if(%property% == "timeRun"){
				return this.timeRun
			}else{
				throw Exception("property don't finded", A_LineNumber)
			}
		}
	} catch e {
		throw Exception(e.message, A_LineNumber)
	}
}

Timer_SetProperty(this, property, value)
{
	try{
		if ( value != null ){
			
			if(property == "timeOut"){
				this.timeOut := value
			}else{
				if(%property% == "timeRun"){
					this.timeRun := value
				}else{
					throw Exception("property don't finded", A_LineNumber)
				}
			}
		}
		else{
			throw Exception("Error'Parameter' can not be Empyt", A_LineNumber)
		}
	} catch e {
		throw Exception(e.message, A_LineNumber)
	}
}

Timer_Elapsed(this) {
	endTime := A_TickCount
	totalTime := endTime - this.timeRun

	return, totalTime
}
;~ try{
	;~ timeOut := Timer.GetProperty("timeOut")
	;~ MsgBox, % timeOut
	;~ Timer.SetProperty("timeOut", 10000)
	;~ timeOut := Timer.GetProperty("timeOut")
	;~ MsgBox, % timeOut
	;~ i:=0
	;~ while(Timer.Elapsed() <= timeOut){
		;~ MsgBox, , Teste, Oi %i%, 1
		;~ i+=1
	;~ }
	;~ if(Timer.Elapsed() > timeOut){
		;~ throw Exception("TimeOut", A_LineNumber)
	;~ }
;~ } catch e {
	;~ MsgBox, % "Morto " e.message
;~ }

; ------------------------------------------------------------------------------------------------------------------------------------

SendKeys(key){
	Send, %key%
	Sleep, 500
}

RemoverAcentos(string) {
    len := DllCall("Normaliz.dll\NormalizeString", "int", 2
        , "wstr", string, "int", StrLen(string)
        , "ptr", 0, "int", 0)  ; Get *estimated* required buffer size.
    Loop {
        VarSetCapacity(buf, len * 2)
        len := DllCall("Normaliz.dll\NormalizeString", "int", 2
            , "wstr", string, "int", StrLen(string)
            , "ptr", &buf, "int", len)
        if len >= 0
            break
        if (A_LastError != 122) ; ERROR_INSUFFICIENT_BUFFER
            return
        len *= -1  ; This is the new estimate.
    }
    ; Remove combining marks and return result.
    return RegExReplace(StrGet(&buf, len, "UTF-16"), "\pM")
}