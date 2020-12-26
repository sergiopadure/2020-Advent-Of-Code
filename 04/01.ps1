#Advent of Code problem 03
#Written by Padure Sergio

#Requires -Version 5.1
#Requires -PSEdition Desktop


$scriptdir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$dateandtime = Get-Date -Format "dd_MM_yyyy_HH-mm"
$data = Get-Content -Path "$scriptdir\01.txt"
$count = 0

foreach ($line in $data){
    if(
        ($line -like "*byr*") -and
        ($line -like "*iyr*") -and 
        ($line -like "*eyr*") -and
        ($line -like "*hgt*") -and
        ($line -like "*hcl*") -and
        ($line -like "*ecl*") -and
        ($line -like "*pid*")    
    ){
        $count += 1
    }
}
$count