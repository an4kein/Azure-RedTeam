
Identifying Potential Privileged Azure AD Objects via DisplayName Keyword Scanning

`$keywords = 'admin','create','run'; az ad signed-in-user list-owned-objects --output json | ConvertFrom-Json | Where-Object { foreach ($word in $keywords) { if ($_.description -match $word -or $_.displayName -match $word) { return $true } }; return $false } | Format-Table displayName, description, objectId`

`$keywords = 'admin','automation','run','vault','key','write','ops'; az ad signed-in-user list-owned-objects --output json | ConvertFrom-Json | Where-Object { foreach ($word in $keywords) { if ($_.displayName -match $word) { return $true } }; return $false } | Format-Table displayName, objectId`


![image](https://github.com/user-attachments/assets/7ea515aa-68ad-45e3-8aa7-fe2c74e4f77f)

Esse comando:

Filtra objetos do usuário logado no Azure AD que contenham palavras-chave como admin, create ou run no displayName ou description.

Retorna uma tabela com displayName, description e objectId.
