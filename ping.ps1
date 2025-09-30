Get-Content "C:\Users\kiara.arosemena\OneDrive - cfe.com.pa\Documentos\scripting\lista-computadoras.txt" | ForEach-Object {
    $computer = $_.Trim()
    
    $pingResult = ping -n 1 -w 1000 $computer
    if ($pingResult -match "TTL=") {
        Write-Host "$computer is reachable."
    } else {
        Write-Host "$computer is not reachable."
    }
}