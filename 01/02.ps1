#Advent of Code problem 02
#Written by Padure Sergio

#Requires -Version 5.1
#Requires -PSEdition Desktop

$stopwatch =  [system.diagnostics.stopwatch]::StartNew()

$scriptdir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$dateandtime = Get-Date -Format "dd_MM_yyyy_HH-mm"
$input = Get-Content -Path "$scriptdir\input.txt"

$multiplication = 0
foreach ($number in $input) {
    [int32]$number = $number
    foreach ($number1 in $input) {
        [int32]$number1 = $number1
        foreach ($number2 in $input) {
            [int32]$number2 = $number2
            $result = 2020 - $number - $number1 - $number2
            if ($result -eq 0){
                $tempmult = $number * $number1 * $number2
                $multiplication = $tempmult
            }
        }
    }
}
$multiplication

$stopwatch.Elapsed
$stopwatch.Stop()
