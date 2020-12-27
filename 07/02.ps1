#Advent of Code problem 07
#Written by Padure Sergio

#Requires -Version 5.1
#Requires -PSEdition Desktop
#reference: https://www.reddit.com/r/PowerShell/comments/k8bhj0/advent_of_code_day_7_bag_inception/geyiriz/

$scriptdir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$dateandtime = Get-Date -Format "dd_MM_yyyy_HH-mm"
$data = Get-Content -Path "$scriptdir\01.txt"


$reduceddata = $data | ForEach-Object {
    $_ -replace ' bag(s)?\.' -replace ' bag(s)?(( contain )|(, ))', '|'
}

function Get-SelfAndChildren {
    param(
        [string[]]$Color,
        [hashtable]$Rules
    )
    foreach ($c in $Color) {
        $c
        Get-SelfAndChildren $Rules[$c] $Rules
    }
}

# Make a hashtable from the data largely as-is except multiply the
# child colors by their count
$p2rules = @{}
$reduceddata | ForEach-Object {
    $key,[string[]]$vals = $_.Split('|')
    if ($vals[0] -ne 'no other') {
        $vals | ForEach-Object {
            $num = [int]$_[0].ToString()
            $color = $_.Substring(2)
            $p2rules[$key] += @($color) * $num
        }
    }
}

(Get-SelfAndChildren 'shiny gold' $p2rules).Count - 1
