

<#

foreach ($line in $data) {
    $charline = $line.toCharArray()
    if ($charline[$x] -eq "#") {
        $trees += 1
    }
    #Clever thing picked up from ka-splam on reddit, using modulo to do the wraparound
    $x = ($x + 3) % $linewidth
}

$trees
$i = 0
do {
    $x = $x + 3
    if ($x -ge $linewidth) {
        $x = $x - $linewidth
    }

    if ($data[$i].ToCharArray()[$x] -eq "#") {
        $trees++
    }

    $i++

} while ($i -le ($data.count - 1))

$trees

#>