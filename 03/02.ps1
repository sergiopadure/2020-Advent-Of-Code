#Advent of Code problem 03
#Written by Padure Sergio

#Requires -Version 5.1
#Requires -PSEdition Desktop


$scriptdir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$dateandtime = Get-Date -Format "dd_MM_yyyy_HH-mm"
$data = Get-Content -Path "$scriptdir\01.txt"

#Function to do the processing for both challenge 1 and challenge 2
#Inspired by https://www.reddit.com/r/PowerShell/comments/k5r8ce/advent_of_code_day_3_discussion_thread/geh58fw/
function CountTrees {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true)]
        $XStep,
        [Parameter(Mandatory = $true)]
        $Ystep
    )
    $trees = 0
    $x = 0
    $y = 0
    $linewidth = $data[0].Length
    $datalength = $data.Count
    while ($y -lt $datalength) {
        if ($data[$y][$x] -eq '#') {
            $trees++
        }
        $y = $y + $Ystep
        #Clever thing using the module to wraparound
        $x = ($x + $XStep) % $linewidth
    }
    $trees
}

$a = CountTrees -XStep 1 -Ystep 1
$b = CountTrees -XStep 3 -Ystep 1
$c = CountTrees -XStep 5 -Ystep 1
$d = CountTrees -XStep 7 -Ystep 1
$e = CountTrees -XStep 1 -Ystep 2

$total = $a * $b * $c * $d * $e

$total