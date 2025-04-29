$keywords = 'admin','create','run'
az ad signed-in-user list-owned-objects --output json | ConvertFrom-Json | Where-Object {
    foreach ($word in $keywords) {
        if ($_.description -match $word -or $_.displayName -match $word) {
            return $true
        }
    }
    return $false
} | Format-Table displayName, description, objectId
