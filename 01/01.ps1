#Advent of Code problem 01
#Written by Padure Sergio

#Requires -Version 5.1
#Requires -PSEdition Desktop

$scriptdir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$dateandtime = Get-Date -Format "dd_MM_yyyy_HH-mm"

$input = Get-Content -Path "$scriptdir\input.txt"

$multiplication = 0

foreach ($number in $input){
    [int32]$number = $number
    $result = 2020 - $number
    #($number).GetType().FullName
    #($result).GetType().FullName
    if ($input -contains $result){
        $multiplication = $number * $result
    }
}
$multiplication
