# Generate 1000 PIN numbers twelve digits long
# update "$genNumbofPins" "1000" to the number of pins you want to generate ie 1..10 for Ten PINS or 1..100 for One Hundred
$pinLength = '12'
$genNumbofPins = 1..1000  #ie 1..10 or 1..100000
$genNumbofPins | % {(1..99 | %{ Get-Random -Maximum 9 } | ?{$_ -ne $prev} | %{$prev = $_; Write-Output $_ } | `
 Select-Object -First $pinLength ) -join '' } | out-file pins.txt
 
