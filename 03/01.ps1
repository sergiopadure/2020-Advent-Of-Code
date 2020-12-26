#Advent of Code problem 03
#Written by Padure Sergio

#Requires -Version 5.1
#Requires -PSEdition Desktop


$scriptdir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$dateandtime = Get-Date -Format "dd_MM_yyyy_HH-mm"
$data = Import-Csv -Path "$scriptdir\01.csv"
$compliantpw = 0

