#Advent of Code problem 05
#Written by Padure Sergio

#Requires -Version 5.1
#Requires -PSEdition Desktop


$scriptdir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$dateandtime = Get-Date -Format "dd_MM_yyyy_HH-mm"
$data = Get-Content -Path "$scriptdir\01.txt"
$count = @()

function Get-SeatID {
    param (
        [Parameter(Mandatory)]
        [string]$BoardingPass
    )
    #$chars = $BoardingPass.toCharArray()
    $row = $BoardingPass.substring(0, 7) -replace 'F', '0' -replace 'B', '1'
    $column = $BoardingPass.substring(7, 3) -replace 'R', '1' -replace 'L', '0'
    ([convert]::ToInt32($row, 2) * 8) + [convert]::ToInt32($column, 2)
}

foreach ($line in $data) {
    $count += Get-SeatID -BoardingPass $line
}
$seats = $count | Sort-Object
$fullrange = $seats[0]..$seats[-1]
foreach ($number in $fullrange){
    if ($number -notin $seats){
        $number
    }
}