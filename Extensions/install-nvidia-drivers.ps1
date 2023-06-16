#region Power Bi Desktop
try {
    #$powerBi = "Microsoft Power BI Desktop"
    #$powerBiInstalled = ((Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*) | Where-Object { $_.DisplayName -like "*$powerBi*" })
    #if($powerBiInstalled){
       # Write-Log "Microsoft Power BI Desktop is already install"
        #Write-Output "Microsoft Power BI Desktop is already install"
    #}else{
       # Write-Log "Installing Nvidia Drivers"
        Invoke-WebRequest -Uri "https://go.microsoft.com/fwlink/?linkid=874181" -OutFile C:\NvidiaGRID-15-2.exe
        Write-Output "Installing Nvidia Drivers"        
        $nvidiaArgs = @('/s')
        Start-Process -FilePath "C:\NvidiaGRID-15-2" -ArgumentList $nvidiaArgs -Wait
        #if($powerBiInstalled){
           # Write-Log "Microsoft Power BI Desktop installation succeded"
        #    Write-Output "Microsoft Power BI Desktop installation succeded"
        #}
    #}
}
catch [System.Exception] {
    Write-Warning $_.Exception.Message
    #Write-Log "Error installing Microsoft Power BI Desktop: $ErrorMessage"
    Write-Output "Error installing Microsoft Power BI Desktop: $ErrorMessage"
}

#endregion