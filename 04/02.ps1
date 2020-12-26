#Advent of Code problem 03
#Written by Padure Sergio

#Requires -Version 5.1
#Requires -PSEdition Desktop

#Based on: https://www.reddit.com/r/PowerShell/comments/k6fjdt/advent_of_code_day_4_the_passport_problem/

function Test-Passport {
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [ValidateRange(1920, 2002)]
        [Alias('byr')]
        [int]$BirthYear,

        [Parameter(Mandatory)]
        [ValidateRange(2010, 2020)]
        [Alias('iyr')]
        [int]$IssueYear,

        [Parameter(Mandatory)]
        [ValidateRange(2020, 2030)]
        [Alias('eyr')]
        [int]$ExpirationYear,

        [Parameter(Mandatory)]
        [ValidateScript(
            {
                if ($_ -notmatch "\d(cm){1}|(in){1}") {
                    throw
                }
                $measurement = $_.Substring($_.Length - 2)
                $number = $_.Substring(0, $_.Length - 2)
                if (($measurement -eq 'cm' -and ($number -lt 150 -or $number -gt 193)) -or ($measurement -eq 'in' -and ($number -lt 59 -or $number -gt 76))) {
                    throw
                }
                return $true
            }
        )]
        [Alias('hgt')]
        [string]$Height,

        [Parameter(Mandatory)]
        [ValidatePattern('^[#][0-9a-f]{6}$')]
        [Alias('hcl')]
        [string]$HairColor,

        [Parameter(Mandatory)]
        [ValidateSet('amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth')]
        [Alias('ecl')]
        [string]$EyeColor,

        [Parameter(Mandatory)]
        [ValidatePattern('^[0-9]{9}$')]
        [Alias('pid')]
        [string]$PassportId,

        [Parameter()]
        [Alias('cid')]
        [string]$CountryId
    )

    return 1
}

$scriptdir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$dateandtime = Get-Date -Format "dd_MM_yyyy_HH-mm"
$data = Get-Content -Path "$scriptdir\02.txt" -Raw

$passports = $data -split "`r`n`r`n"
$validFields = 'byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid'#, 'cid'
$validPassports = 0

foreach ($passport in $passports) {
    $passportHashtable = @{ }
    $passport2 = $passport -split "`r`n" -split " "
    foreach ($pass in $passport2){
        $hashtableValues = $pass -split ":"
        $passportHashtable += @{$hashtableValues[0] = $hashtableValues[1]}
    }
    $checkValidFields = 0
    foreach ($passportValue in $passportHashtable.GetEnumerator()) {
        #check valid fields
        if ($validFields -contains $passportValue.Key) {
            $checkValidFields ++
        }
    }
    if ($checkValidFields -eq $validFields.Count) {
        try {
            $validPassports += Test-Passport @passportHashtable -ErrorAction Stop
        }
        catch {
            #Write-Warning $_
        }
    }
}
$validPassports