#Advent of Code problem 03
#Written by Padure Sergio

#Requires -Version 5.1
#Requires -PSEdition Desktop


$scriptdir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$dateandtime = Get-Date -Format "dd_MM_yyyy_HH-mm"
$data = Import-Csv -Path "$scriptdir\01.csv"
$compliantpw = 0


foreach ($line in $data) {
    $hits = 0
    $first = ($line | Select-Object -ExpandProperty 'first') - 1
    $last = ($line | Select-Object -ExpandProperty 'last') - 1
    $letter = $line | Select-Object -ExpandProperty 'letter'
    $password = $line | Select-Object -ExpandProperty 'password'
    $pwletters = $password.toCharArray()
    if ($pwletters[$first] -eq $letter) {
        $hits += 1
    }
    if ($pwletters[$last] -eq $letter) {
        $hits += 1        
    }
    if ($hits -eq 1) {
        $compliantpw += 1
    }
}





$compliantpw






<#
Debug

$stopwatch = [system.diagnostics.stopwatch]::StartNew()

#stopwatch
$stopwatch.Elapsed
$stopwatch.Stop()


    #$range
    #($range).GetType().FullName
    #$hits
    #($hits).GetType().FullName
    #($range2).GetType().FullName
    #($range).GetType().FullName
    #(3..9).GetType().FullName
#>