# How to Setup Credentail Type NavUserPassword in Business Central 2024 Release Wave 1
# Credential Types - NavUserPassword
# Author - Saurav Dhyani
# Date - 07-May-2024

# Import Modules
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\240\Service\NavAdminTool.ps1'

#Add User To Business central Environment
$ServiceName = 'BC240'
New-NAVServerUser -ServerInstance $ServiceName -UserName saurav -FullName "Saurav Dhyani" -Password (Read-Host "Enter Password" -AsSecureString)
New-NAVServerUserPermissionSet -PermissionSetId SUPER -ServerInstance $ServiceName -UserName saurav

#Changing Client Service Credential Type
$ServiceName = 'BC240'
Set-NAVServerConfiguration -ServerInstance $ServiceName -KeyName ClientServicesCredentialType -KeyValue NavUserPassword
Restart-NAVServerInstance -ServerInstance $ServiceName


#Change Client Web Service Credential Type
Set-NAVWebServerInstanceConfiguration -WebServerInstance $ServiceName -KeyName ClientServicesCredentialType -KeyValue NavUserPassword