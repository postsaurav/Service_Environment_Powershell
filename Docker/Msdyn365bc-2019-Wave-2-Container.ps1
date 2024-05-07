#Author - Saurav Dhyani
#Refrence Blog - MSDYN365BC 2019 Wave 2 - Set up Docker Container?
#Blog URL - 

#Set Execution Policy
Set-ExecutionPolicy RemoteSigned -Force

# Install Nav Container Helper Module
Install-Module -Name navcontainerhelper

#Setup Docker Container.
#Change Values for $imageName, $ContainerName, username, Password, $LicenseFile & Memory Limit as per your requirment.

$imageName = "mcr.microsoft.com/businesscentral/onprem:15.0.36560.0-w1"
$containerName = "BC365Wave2"
$auth = "UserPassword"
$credential = New-Object pscredential 'admin', (ConvertTo-SecureString -String 'P@ssword1' -AsPlainText -Force)
$licenseFile = "D:\BC15Lic.flf"

New-BCContainer -accept_eula `
                -imageName $imageName `
                -containerName $containerName `
                -auth $auth `
                -credential $credential `
                -licenseFile $licenseFile `
                -updateHosts `
                -includeAL `
                -memoryLimit 3G