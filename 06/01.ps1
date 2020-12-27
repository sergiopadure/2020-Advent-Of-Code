#Advent of Code problem 06
#Written by Padure Sergio

#Requires -Version 5.1
#Requires -PSEdition Desktop


$scriptdir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$dateandtime = Get-Date -Format "dd_MM_yyyy_HH-mm"
$data = Get-Content -Path "$scriptdir\01.txt" -raw
$count = 0
$newline = [Environment]::NewLine
$groups = ($data -split "$newline$newline")

foreach ($group in $groups){
    $tempcount = 0
    $chars = $group -replace "$newline", ""
    $chars = $chars.toCharArray()
    $chars = $chars | Sort-Object | get-unique
    $count += $chars.count
}
$count


<#
    $group
    foreach ($answer in $answers){
        if ($group -contains $answer){
            $tempcount += 1
        }
    }
    $tempcount
    $count += $tempcount
#>