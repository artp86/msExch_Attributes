# Spécifiez le chemin du répertoire où vous souhaitez stocker les fichiers texte
$cheminSortie = "C:\Users\arthur_puzenat-adm\Documents\Exc"

# Vérifiez si le répertoire de sortie existe, sinon, créez-le
if (-not (Test-Path -Path $cheminSortie -PathType Container)) {
    New-Item -Path $cheminSortie -ItemType Directory
}

# Obtenez la liste des utilisateurs avec des attributs "msExch" non vides
$utilisateurs = Get-ADUser -Filter * -Properties * | Where-Object { $_.PSObject.Properties | Where-Object { $_.Name -like 'msExch*' -and $_.Value -ne $null } }

# Parcourez la liste des utilisateurs et créez un fichier texte par utilisateur
foreach ($utilisateur in $utilisateurs) {
    $nomUtilisateur = $utilisateur.SamAccountName
    $attributs = $utilisateur.PSObject.Properties | Where-Object { $_.Name -like 'msExch*' -and $_.Value -ne $null }
    
    # Créez un fichier texte avec les attributs de l'utilisateur
    $fichierSortie = Join-Path -Path $cheminSortie -ChildPath "$nomUtilisateur.txt"
    $attributs | ForEach-Object { "$($_.Name): $($_.Value)" } | Out-File -FilePath $fichierSortie -Encoding UTF8
}

Write-Host "Extraction terminée. Les fichiers texte sont enregistrés dans : $cheminSortie"
