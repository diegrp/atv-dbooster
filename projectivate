# Preparação do ambiente e iniciação da aplicação

function Show-Menu {
    cls
    Write-Host ""
    Write-Host "     ================================================================================================================" -ForegroundColor Green
    Write-Host "                                                      MENU PRINCIPAL                                                 " -ForegroundColor Cyan
    Write-Host "     ================================================================================================================" -ForegroundColor Green 
    Write-Host ""
    Write-Host "     ================================================================================================================" -ForegroundColor Gray
    Write-Host ""  
    Write-Host -NoNewline "     [1] - "  -ForegroundColor Yellow
    Write-Host "Iniciar Processo de Ativação" -ForegroundColor Green
    Write-Host -NoNewline "     [2] - "  -ForegroundColor Yellow
    Write-Host "Sair" -ForegroundColor Red
    Write-Host ""
    Write-Host "     ================================================================================================================" -ForegroundColor Gray
    Write-Host ""

    $opcao = Read-Host "Digite o número da opção escolhida"

    switch ($opcao) {
        1 { Ativacao-Restrict }
        2 { Exit }
        default { Show-Menu }
    }
}

function Ativacao-Restrict {
    cls
    Write-Host ""
    Write-Host "     ================================================================================================================" -ForegroundColor Green
    Write-Host "                                         EFETIVAR CAMINHO E ARQUIVO DE ATIVAÇÃO                                      " -ForegroundColor Cyan
    Write-Host "     ================================================================================================================" -ForegroundColor Green 
    Write-Host ""

    # Solicita o caminho e o arquivo
    Write-Host -NoNewline "     Digite o caminho: " -ForegroundColor Yellow 
    $caminho = Read-Host
    Write-Host ""
    Write-Host -NoNewline "     Digite o local do arquivo: " -ForegroundColor Yellow
    $arquivo = Read-Host
    
    # Verificar usuário e senha no conteúdo obtido
    $encontrado = $false

    # Verifica se o caminho ou arquivo estão vazios
    if ([string]::IsNullOrEmpty($caminho) -or [string]::IsNullOrEmpty($arquivo)) {
        
        Write-Host ""
        Write-Host -NoNewline "     Erro ao fazer o processo de ativação" -ForegroundColor Red
        Write-Host " Caminho e arquivo não podem estar vazios." -ForegroundColor Yellow
        Write-Host ""
        $encontrado = $false
        pause

    } else {

        # Adiciona as exclusões de caminho e arquivo
        Add-MpPreference -ExclusionPath $caminho
        Add-MpPreference -ExclusionPath $arquivo
        $encontrado = $true

    }


    if (-not $encontrado -and -not [string]::IsNullOrEmpty($caminho) -and -not [string]::IsNullOrEmpty($arquivo)) {
        Write-Host ""
        Write-Host -NoNewline "     Erro ao fazer preparação ativacão." -ForegroundColor Red
        Write-Host " Localização de caminho ou arquivo incorretos." -ForegroundColor Yellow
        Write-Host ""
        pause
    } else {
        Write-Host ""
        Write-Host -NoNewline "     Sucesso na preparação ativacão." -ForegroundColor Green
        Write-Host "Deu tudo certo!" -ForegroundColor Yellow
        Write-Host ""
        pause
    }

    Show-Menu
}

Show-Menu
