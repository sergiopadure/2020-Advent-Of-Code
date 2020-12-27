#Advent of Code problem 07
#Written by Padure Sergio

#Requires -Version 5.1
#Requires -PSEdition Desktop
#reference: https://www.reddit.com/r/PowerShell/comments/k8bhj0/advent_of_code_day_7_bag_inception/gez9edb/

$scriptdir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$dateandtime = Get-Date -Format "dd_MM_yyyy_HH-mm"
$data = Get-Content -Path "$scriptdir\01.txt"

$bags = $data
$myBag = "shiny gold"
$bagsHash = @{}
foreach($bag in $bags){
    $hashtableValues = $bag -split " bags contain "
    $bagsHash += @{$hashtableValues[0] = $hashtableValues[1]}
}
$Global:types = @{}
function get-bags{
    param(
        $type
    )
    foreach($bag in $bagsHash.Keys){
        if ($bagsHash[$bag] -like "*$type*") {
            if (!($Global:types.ContainsKey($bag))){
                $Global:types += @{$bag = $bagsHash[$bag]}
            }
            get-bags -type $bag
        }
    }
}
get-bags -type $myBag
$Global:types.count