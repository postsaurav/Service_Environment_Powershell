# How to Setup SSL Certificate in Business Central 2024 Release Wave 1
# Credential Types - NavUserPassword
# Author - Saurav Dhyani
# Date - 07-May-2024

#Create a Self Signed Certificate
New-SelfSignedCertificate -FriendlyName userpasscert2 -DnsName WIN-MV8NGEG3C64 -KeyUsage DigitalSignature

# Import Modules
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\240\Service\NavAdminTool.ps1'

$ServiceName = 'BC240'
# Adding User in Database
New-NAVServerUser -ServerInstance $ServiceName -UserName saurav -FullName "Saurav Dhyani" -Password (Read-Host "Enter Password" -AsSecureString)
New-NAVServerUserPermissionSet -ServerInstance $ServiceName -UserName saurav -PermissionSetId SUPER

# Update Service Parameters
$ServiceName = 'BC240'
Set-NAVServerConfiguration -ServerInstance $ServiceName -KeyName ClientServicesCredentialType -KeyValue NavUserPassword
Set-NAVServerConfiguration -ServerInstance $ServiceName -KeyName ServicesCertificateThumbprint -KeyValue 5576F1B6A8E569FD9DAC684383DD0EE44E128159
Set-NAVServerConfiguration -ServerInstance $ServiceName -KeyName ClientServicesSSLEnabled -KeyValue true
Restart-NAVServerInstance -ServerInstance $ServiceName

#Updating the Web Service Client Parameters
$ServiceName = 'BC240'
Set-NAVWebServerInstanceConfiguration -WebServerInstance $ServiceName -KeyName ClientServicesCredentialType -KeyValue NavUserPassword
Set-NAVWebServerInstanceConfiguration -WebServerInstance $ServiceName -KeyName ServerHttps -KeyValue true
Set-NAVWebServerInstanceConfiguration -WebServerInstance $ServiceName -KeyName DnsIdentity -KeyValue WIN-MV8NGEG3C64
Set-NAVWebServerInstanceConfiguration -WebServerInstance $ServiceName -KeyName RequireSsl -KeyValue true