# Verifica se há atualizações disponíveis
$updateSession = New-Object -ComObject Microsoft.Update.Session
$updateSearcher = $updateSession.CreateUpdateSearcher()
$updates = $updateSearcher.Search("IsInstalled=0")

 

if ($updates.Updates.Count -eq 0) {
    Write-Host "Não há atualizações disponíveis."
}
else {
    Write-Host "Há atualizações disponíveis."

 

    # Instala as atualizações disponíveis
    $updateInstaller = $updateSession.CreateUpdateInstaller()
    $updateInstaller.Updates = $updates.Updates
    $installationResult = $updateInstaller.Install()

 

    # Verifica se a instalação foi bem-sucedida
    if ($installationResult.ResultCode -eq "2") {
        Write-Host "As atualizações foram instaladas com sucesso."
    }
    else {
        Write-Host "Ocorreu um erro ao instalar as atualizações."
    }
}

 

# Espera 5 segundos antes de fechar o PowerShell
Start-Sleep -Seconds 5