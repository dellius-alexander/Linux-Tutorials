# Msi-Install function
function install-msi(){
    
    if ($null -eq $file){
        Write-Output 'You must enter an input msi file...'
        exit 1
    }
    else {
        Write-Output ('You entered "{0}"' -f ${1})
    }
    # $DataStamp = get-date -Format yyyyMMddTHHmmss
    # $logFile = '{0}-{1}.log' -f $file.fullname,$DataStamp
    # $MSIArguments = @(
    #     "/i"
    #     ('"{0}"' -f $file.fullname)
    #     "/qn"
    #     "/norestart"
    #     "/L*v"
    #     $logFile
    # )
    # Start-Process "msiexec.exe" -ArgumentList $MSIArguments -Wait -NoNewWindow
}
install-msi
    