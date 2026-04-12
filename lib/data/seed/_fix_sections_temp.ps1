$File = $args[0]
$MapFile = $args[1]

$content = Get-Content $File -Raw
$lines = Get-Content $MapFile

foreach ($line in $lines) {
    if ($line.Trim() -eq '') { continue }
    $parts = $line.Split('|')
    $sid = $parts[0].Trim()
    $sec = $parts[1].Trim()
    
    # Check if section already exists for this snippetId
    # It's tricky to check per snippet, so let's just replace difficulty with difficulty AND section
    # ONLY if we match the snippetId block.
    
    # We find snippetId = 'xx', then everything up to difficulty = 'yy', then we inject section.
    # To prevent double injection, we can look for "section" between difficulty and isSaved, 
    # but the simplest clean way is to wipe out any existing section first, or just assume it is absent.
    # Since only Kotlin has it (maybe partially), let's strip "..section = '...'" globally from the file first.
    
}
