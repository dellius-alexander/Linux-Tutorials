#Requires -PSEdition Core
#Requires -Version 5.0
##########################################################################
##########################################################################
# setup-pc function
function global:install-packages {

<#
.SYNOPSIS
    
.DESCRIPTION
    
.PARAMETER URL
    
.PARAMETER PATH
    The [OPTIONAL] PATH parameter provides a PATH destination for your downloaded 
    object; default download location is the current directory of the executing script
.INPUTS
    Yes... I do accept pipeline input 
    e.g. 
.OUTPUTS 
    
.EXAMPLE
    
.EXAMPLE
    
.EXAMPLE
        
.NOTES
    Author: Dellius Alexander
    Last Edit: 2020-06-11
    Version 1.0 - download single object
    Version 1.1 - download to a spacified PATH & added pipeline input
#>
##########################################################################
# Specifies a array of objects to one locations.
[CmdletBinding()]
param (
    [Parameter(Mandatory=$true,
    Position=0,
    ParameterSetName="objects",
    ValueFromPipeline=$true,
    ValueFromPipelineByPropertyName=$true,
    HelpMessage="Dictionary")]
    [ValidateNotNullOrEmpty()]
    [string[string[]]]
    $objects)
##########################################################################

Write-Output $objects


}


# One-liner to install or update PowerShell 6 on Windows 10
#Set-ExecutionPolicy Bypass -Scope Process -Force; iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI"