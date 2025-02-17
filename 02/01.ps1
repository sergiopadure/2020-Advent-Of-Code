#Advent of Code problem 03
#Written by Padure Sergio

#Requires -Version 5.1
#Requires -PSEdition Desktop

$stopwatch = [system.diagnostics.stopwatch]::StartNew()

$scriptdir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$dateandtime = Get-Date -Format "dd_MM_yyyy_HH-mm"
$data = Import-Csv -Path "$scriptdir\01.csv"
$compliantpw = 0
foreach ($line in $data) {
    $hits = 0
    $first = $line | Select-Object -ExpandProperty 'first'
    $last = $line | Select-Object -ExpandProperty 'last'
    $letter = $line | Select-Object -ExpandProperty 'letter'
    $password = $line | Select-Object -ExpandProperty 'password'
    $pwletters = $password.toCharArray()
    $range = $first..$last
    foreach ($pwletter in $pwletters) {
        if ($pwletter -eq $letter) {
            $hits += 1
        }
    }
    #$range
    #($range).GetType().FullName
    #$hits
    #($hits).GetType().FullName
    if ($range -contains $hits){
        $compliantpw += 1
    }
    #($range2).GetType().FullName
    #($range).GetType().FullName
    #(3..9).GetType().FullName
}
$compliantpw




$stopwatch.Elapsed
$stopwatch.Stop()
