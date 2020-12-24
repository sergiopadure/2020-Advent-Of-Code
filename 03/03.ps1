#Advent of Code problem 03
#Written by Padure Sergio

#Requires -Version 5.1
#Requires -PSEdition Desktop

$stopwatch =  [system.diagnostics.stopwatch]::StartNew()

$scriptdir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$dateandtime = Get-Date -Format "dd_MM_yyyy_HH-mm"
$input = Import-Csv -Path "$scriptdir\03.csv"
$input