<#

https://www.reddit.com/r/PowerShell/comments/k6fjdt/advent_of_code_day_4_the_passport_problem/gen3efp/

$PassportData = $data -split "`r`n`r`n" -replace " ", "`n" -replace ":","="
$Fields = @(
    "byr", # (Birth Year)
    "iyr", # (Issue Year)
    "eyr", # (Expiration Year)
    "hgt", # (Height)
    "hcl", # (Hair Color)
    "ecl", # (Eye Color)
    "pid", # (Passport ID)
    "cid"  # (Country ID)
)
$OptionalFields = @(
    "cid"
)

function Test-Passport {
    [CmdletBinding()]
    param (
        [ValidateRange(1920, 2002)]
        $byr,
        [ValidateRange(2010, 2020)]
        $iyr,
        [ValidateRange(2020, 2030)]
        $eyr,
        [ValidatePattern("^\d+(cm|in)")]
        [ValidateScript( {
                $num = $_ -replace "\D"
                if ($_ -match "cm") {
                    if ($num -ge 150 -and $num -le 193) { $true }
                }
                else {
                    if ($num -ge 59 -and $num -le 76) { $true }
                }
            })]
        $hgt,
        [ValidatePattern("^#[\da-f]{6}$")]
        $hcl,
        [ValidateSet("amb", "blu", "brn", "gry", "grn", "hzl", "oth")]
        $ecl,
        [ValidatePattern("^\d{9}$")]
        $pid_,
        $cid
    )
    if (
        $byr -and
        $iyr -and
        $eyr -and
        $hgt -and
        $hcl -and
        $ecl -and
        $pid_
    ) {
        $true
    }
}

foreach ($passport in $PassportData){
    try{
    Test-Passport @passport -ErrorAction stop
    } catch{
        something
    }
}

#>