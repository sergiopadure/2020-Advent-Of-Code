

<#
foreach ($reduced in $reduceddata) {
    $split = $reduced -split '|'
    $key = $split[0]
    $key, [string[]]$vals = $reduced -split '|'
    if ($vals[0] -ne 'no other') {
        $vals | ForEach-Object {
            $num = [int]$_[0].ToString()
            $color = $_.Substring(2)
            $p2rules[$key] += @($color) * $num
        }
    }

}
#>



<#




#>



<#
$bags = $data
$myBag = "shiny gold"
$bagsHash = @{}
foreach($bag in $bags){
    $hashtableValues = $bag -split " bags contain "
    $bagsHash += @{$hashtableValues[0] = $hashtableValues[1]}
}
$Global:types = @{}
function find-bags{
    param(
        $bag
    )
    $nestedBags = $bagsHash[$bag] -split ", "

    foreach($nestedBag in $nestedBags){
        $number = $nestedBag.Split()[0]
        if ($number -eq "no"){
            continue
        }
        $Global:count = $Global:count + $number
        $type = $nestedBag.Split()[1,2] -join " "
        for($i = 0; $i -lt $number; $i++){
            find-bags -bag $type
        }
    }
}
find-bags -bag $myBag
$Global:count
#>