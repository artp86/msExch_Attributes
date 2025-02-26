# msExch_Attributes
# Script PowerShell pour extraire les attributs msExch des utilisateurs Active Directory

Ce script PowerShell extrait les attributs Active Directory commençant par "msExch" pour chaque utilisateur ayant ces attributs renseignés et les enregistre dans des fichiers texte individuels.

## Fonctionnalités

* Récupère tous les utilisateurs Active Directory.
* Filtre les utilisateurs ayant des attributs "msExch" non vides.
* Crée un fichier texte par utilisateur, contenant ses attributs "msExch".
* Enregistre les fichiers dans un répertoire spécifié.
* Création automatique du dossier de sortie si celui-ci n'existe pas.

## Prérequis

* Compte utilisateur avec les droits de lecture sur Active Directory.
* Le module `ActiveDirectory` de PowerShell doit être installé (inclus dans les outils d'administration de serveur distant).

## Comment l'utiliser

1.  **Téléchargez le script** : Téléchargez le fichier `Extract-MsExchAttributes.ps1` depuis ce dépôt.
2.  **Ouvrez PowerShell** : Exécutez PowerShell.
3.  **Modifiez le chemin de sortie (optionnel)** : Si vous souhaitez modifier le répertoire de sortie par défaut ("C:\Users\arthur\_puzenat-adm\Documents\Exc"), éditez la variable `$cheminSortie` dans le script.
4.  **Exécutez le script** : Exécutez le script PowerShell.

    ```powershell
    .\Extract-MsExchAttributes.ps1
    ```

5.  **Vérifiez le répertoire de sortie** : Les fichiers texte contenant les attributs des utilisateurs seront enregistrés dans le répertoire spécifié.

## Attention

* Ce script extrait les attributs "msExch" de tous les utilisateurs du domaine. Si le domaine est volumineux, l'exécution du script peut prendre du temps.
