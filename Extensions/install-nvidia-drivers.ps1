#region Power Bi Desktop
try {
    #$powerBi = "Microsoft Power BI Desktop"
    #$powerBiInstalled = ((Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*) | Where-Object { $_.DisplayName -like "*$powerBi*" })
    #if($powerBiInstalled){
       # Write-Log "Microsoft Power BI Desktop is already install"
        #Write-Output "Microsoft Power BI Desktop is already install"
    #}else{
       # Write-Log "Installing Nvidia Drivers"
        New-Item -Name "Nvidia_T4_Driver" -ItemType Directory -Force
        Invoke-WebRequest -Uri "https://labresourcesclientsa.blob.core.windows.net/labconfig/Nvidia_T4_Driver/15-2.zip?sp=r&st=2023-06-16T13:17:38Z&se=2023-06-16T21:17:38Z&spr=https&sv=2022-11-02&sr=b&sig=ld7oxxZujLbQkhTUA8z4svE3GDWyiYIKQKs3mH3p94Q%3D" -OutFile C:\15-2.zip
        Expand-Archive -Path "C:\15-2.zip" -DestinationPath "C:\Nvidia_T4_Driver\"
        Write-Output "Installing Nvidia Drivers"        
        $nvidiaArgs = @('/s')
        Start-Process -FilePath "C:\Nvidia_T4_Driver\15-2\setup.exe" -ArgumentList $nvidiaArgs -Wait
        #if($powerBiInstalled){
           # Write-Log "Microsoft Power BI Desktop installation succeded"
        #    Write-Output "Microsoft Power BI Desktop installation succeded"
        #}
    #}
}
catch [System.Exception] {
    Write-Warning $_.Exception.Message
    #Write-Log "Error installing Microsoft Power BI Desktop: $ErrorMessage"
    Write-Output "Error installing Nvidia Drivers: $ErrorMessage"
}

#endregion