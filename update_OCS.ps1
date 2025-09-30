$PSToolsPath = "C:\Users\kiara.arosemena\OneDrive - cfe.com.pa\Escritorio\KROSEMENA\PSTools"
$OCSAgentSource = "\\192.168.10.1\compartida\OCS-agent11.exe"

Get-Content "C:\Users\kiara.arosemena\OneDrive - cfe.com.pa\Documentos\scripting\lista-computadoras.txt" | ForEach-Object {
    $computer = $_.Trim()
    Write-Host "computadora: $computer"
    Write-Host "Entrando a Pstools"
    Push-Location $PSToolsPath
    try {
        Copy-Item $OCSAgentSource "\\$computer\C$\WINDOWS\Temp\OCS-agent11.exe" -ErrorAction Stop
        .\PsExec.exe \\$computer -s "\\$computer\C$\Windows\Temp\OCS-agent11.exe" /SERVER=http://leliel.cfe.local/ocsinventory /S /NOSPLASH /NOW /force
    } catch {
        Write-Host "Error al ejecutar PsExec en $computer : $_"
    }
    Pop-Location
}