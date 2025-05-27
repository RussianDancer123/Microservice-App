$backupFile = "keycloak_backup.sql"

Write-Host "Creating full backup of Keycloak database"

docker exec -i postgres-keycloak pg_dump -U keycloak -d keycloak | Out-File -FilePath $backupFile -Encoding utf8

Write-Host "Backup saved as $backupFile"
$backupFile = "player_character_backup.sql"

Write-Host "Creating full backup of player character database"

docker exec -i postgres-character pg_dump -U user -d character | Out-File -FilePath $backupFile -Encoding utf8

Write-Host "Backup saved as $backupFile"