#Advent of Code problem 05
#Written by Padure Sergio

#Requires -Version 5.1
#Requires -PSEdition Desktop


$scriptdir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$dateandtime = Get-Date -Format "dd_MM_yyyy_HH-mm"
$data = Get-Content -Path "$scriptdir\01.txt"
$count = 0

function Get-SeatID {
    param (
        [Parameter(Mandatory)]
        [string]$BoardingPass
    )
    $chars = $BoardingPass.toCharArray()
    $row = $chars[0..6] -replace 'F', '0' -replace 'B', '1'
    $column = $chars[7..9] -replace 'R', '1' -replace 'L', '0'
    
}

Get-SeatID -BoardingPass "FFFBFBFRRR"