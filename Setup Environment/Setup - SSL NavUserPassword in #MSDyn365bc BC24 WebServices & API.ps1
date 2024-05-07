# How to Setup SSL Certificate in Business Central 2024 Release Wave 1 WebServices and API
# Credential Types - NavUserPassword
# Author - Saurav Dhyani
# Date - 08-May-2024

# Import Modules
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\240\Service\NavAdminTool.ps1'

# Update Service Parameters
$ServiceName = 'BC240'
Set-NAVServerConfiguration -ServerInstance $ServiceName -KeyName SOAPServicesEnabled -KeyValue true
Set-NAVServerConfiguration -ServerInstance $ServiceName -KeyName ODataServicesEnabled -KeyValue true
Set-NAVServerConfiguration -ServerInstance $ServiceName -KeyName SOAPServicesSSLEnabled -KeyValue true
Set-NAVServerConfiguration -ServerInstance $ServiceName -KeyName ODataServicesSSLEnabled -KeyValue true
Restart-NAVServerInstance -ServerInstance $ServiceName
