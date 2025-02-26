$backupFile = "keycloak_backup.sql"

Write-Host "Creating full backup of Keycloak database"

docker exec -i postgres pg_dump -U keycloak -d keycloak | Out-File -FilePath $backupFile -Encoding utf8

Write-Host "Backup saved as $backupFile"