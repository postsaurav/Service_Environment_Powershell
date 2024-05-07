#Author - Saurav Dhyani
#Blog - https://saurav-nav.blogspot.com
#Twitter - sauravdhyani
#Facebook - https://www.facebook.com/SauravMSDYN365BC/
#Linked In - https://www.linkedin.com/in/sauravdhyani/

#Search and Replace Following Parameter.
#1. Search Customer Database and Replace with Database Name that you want.
#2. Search D:\Databases and Replace with Location where you want to Save Database Files.
#3. Search localhost and Replace with SQL Server Name.
#4. Search BC150Blog and Replace with Service Name mapped to database.

## Commands ##

#1 Install Business Central Module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\150\Service\NavAdminTool.ps1'

#2 Create new Database
New-NAVApplicationDatabase -DatabaseName "Customer Database" -DatabaseLocation "D:\Databases" -DatabaseServer "localhost"

## Start and Configure NAV Service & Web Server ##

#3 Change License in Database
Import-NAVServerLicense -LicenseFile "C:\Install\BC15.flf" -ServerInstance BC150Blog

#4 Restart Service Tier
Restart-NAVServerInstance -ServerInstance BC150Blog

#5 Set Application Version for the database.
Set-NAVApplication -ApplicationVersion 15.0.36649.0 -ServerInstance BC150BLOG -Force

#6 Set Application Family for the database.
Set-NAVApplication -ApplicationFamily NA -ServerInstance BC150BLOG -Force

#7 Sync Database
Sync-NAVTenant -ServerInstance BC150BLOG -Mode Sync

#8. Publish System App Symbols
Publish-NAVApp -Path "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment\System.app" -ServerInstance BC150BLOG -PackageType SymbolsOnly

#9. Publish Microsoft_System Application
#** Change Path as per location of Microsoft_System Application path.
Publish-NAVApp -Path "C:\Install\System Application\Source\Microsoft_System Application.app" -ServerInstance BC150BLOG

#10. Sync & Install System App
Sync-NAVApp -Name "System Application" -ServerInstance BC150BLOG
Install-NAVApp -Name "System Application" -ServerInstance BC150BLOG

#11. Publish Microsoft_Base Application
#** Change Path as per location of Microsoft_Base Application path in Product DVD.
Publish-NAVApp -Path "C:\Install\BaseApp\Source\Microsoft_Base Application.app" -ServerInstance BC150BLOG

#12. Sync & Install Base App
Sync-NAVApp -Name "Base Application" -ServerInstance BC150BLOG
Install-NAVApp -Name "Base Application" -ServerInstance BC150BLOG

#13. Restart NAV Service Tier.
Restart-NAVServerInstance -ServerInstance BC150BLOG

#14. Create New Company in Database.
New-NAVCompany -CompanyName PROD -ServerInstance BC150BLOG -CompanyDisplayName PROD
