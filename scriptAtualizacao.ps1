
function Check-PacketProvider{
    
    [CmdletBinding()]
    
    param()

    Write-Warning "Checando a existência do provedor de pacotes NuGet"

    if(Get-PackageProvider -ListAvailable | Where-Object {$_.Name -like "NuGet"}){
        Write-Verbose "NuGet encontrado"
    } else{
        Write-Verbose "NuGet não encontrado. Iniciando tentativa de instalação"
        Install-NuGet
    }
}

function Enable-TLS12{
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
}

function Install-NuGet{
    Write-Warning "Instalando o provedor de pacotes NuGet"
    Enable-TLS12
    
    try{
        Install-PackageProvider -Name NuGet -Scope AllUsers -Confirm -ErrorAction Stop -ErrorVariable NugetInstallationFail
    } catch {
        Write-Error "Erro durante a instalação do NuGet. Verifique o arquivo de logs no mesmo diretório do script"
        "$(Get-Date -Format dd-MM-yyyy_HH:mm:ss): $($NugetInstallationFail)`n" | Out-File ".\PowershellPackInstallationErrorLog.txt" -Encoding utf8 -Append
        Read-Host "Pressione qualquer tecla para encerrar"
        Exit
    }
    Write-Warning "Provedor de pacotes NuGet instalado com sucesso"
}

function Check-PSWindowsUpdate{
    
    [CmdletBinding()]
    param()
    
    Write-Warning "Checando a existência do módulo PSWindowsUpdate"
    
    if (Get-Module -ListAvailable | Where-Object {$_.Name -like "PSWindowsUpdate"}){
        Write-Verbose "Módulo PSWindowsUpdate disponível"
    } else{
        Write-Verbose "Módulo PSWindowsUpdate não encontrado. Iniciando tentativa de instalação"
        Install-PSWindowsUpdateModule
    }
}

function Install-PSWindowsUpdateModule{
    Write-Warning "Instalando o módulo PSWindowsUpdate"
    try{    
        Install-Module -Name PSWindowsUpdate -Scope AllUsers -Confirm -ErrorAction Stop -ErrorVariable ModuleInstallationFail
    } catch{
        Write-Error "Erro durante a instalação do módulo. Verifique o arquivo de logs no mesmo diretório do script"
        "$(Get-Date -Format dd-MM-yyyy_HH:mm:ss): $($ModuleInstallationFail)`n" | Out-File ".\PowershellPackInstallationErrorLog.txt" -Encoding utf8 -Append
        Read-Host "Pressione qualquer tecla para encerrar"
        Exit
    }
    Write-Warning "Módulo PSWindowsUpdate instalado com sucesso"
}

function Get-WindowsAvailableUpdates{

    Write-Warning "Checando atualizações disponíveis"

    try{

        $availableUpdates = Get-WindowsUpdate -ErrorAction Stop -ErrorVariable UpdateCheckError

        if($availableUpdates.count -gt 0){
            
            Get-WindowsUpdate -AcceptAll -Install -AutoReboot -ErrorAction Stop -ErrorVariable UpdateCheckError

        } else{
            Write-Host "Não há atualizações pendentes neste computador ($(`"$env:COMPUTERNAME`"))" -ForegroundColor Green
        }
    } catch{
        Write-Error "Erro durante a verificação de atualizações. Verifique o arquivo de logs no mesmo diretório do script"    
        "$(Get-Date -Format dd-MM-yyyy_HH:mm:ss): $($UpdateCheckError)`n" | Out-File ".\PowershellPackInstallationErrorLog.txt" -Encoding utf8 -Append
        Read-Host "Pressione qualquer tecla para encerrar"
        Exit
    }

}

function Main{

    <#
    1 - Checar o provedor NuGet
    2 - Checar o módulo PSWindowsUpdate
    3 - Checar e instalar atualizações disponíveis
    #>

    Check-PacketProvider
    Check-PSWindowsUpdate
    Get-WindowsAvailableUpdates
}

Main