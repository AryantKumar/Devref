$File = $args[0]
$MapFile = $args[1]

$content = Get-Content $File -Raw
$lines = Get-Content $MapFile

foreach ($line in $lines) {
    if ($line.Trim() -eq '') { continue }
    $parts = $line.Split('|')
    $sid = $parts[0].Trim()
    $sec = $parts[1].Trim()
    
    $pattern = "(\.\." + "snippetId = '" + $sid + "'[\s\S]*?)(\.\." + "isSaved)"
    $replacement = "`$1..section = '" + $sec + "'`n      `$2"
    $content = [regex]::Replace($content, $pattern, $replacement, 'Singleline')
}

$content | Set-Content $File -Encoding UTF8 -NoNewline
Write-Host "Updated $File"
