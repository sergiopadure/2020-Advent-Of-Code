#Advent of Code problem 07
#Written by Padure Sergio

#Requires -Version 5.1
#Requires -PSEdition Desktop


$scriptdir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$dateandtime = Get-Date -Format "dd_MM_yyyy_HH-mm"
$data = Get-Content -Path "$scriptdir\01.txt" -raw