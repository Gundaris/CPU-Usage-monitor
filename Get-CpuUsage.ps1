filter timestamp {"$(Get-Date -Format G): $_"}
$Sleep = 10
$RunTime = 36000
$timeout = New-TimeSpan -Seconds $RunTime
$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
do {
    $CPU = Get-WmiObject Win32_Processor | Measure-Object -Property LoadPercentage -Average | Select Average
    ($CPU).average | Timestamp | out-file "C:\Users\hermang\Documents\CPUUsage.txt" -Append
    ($CPU).average | Timestamp
    start-sleep $Sleep
} while ($stopwatch.elapsed -lt $timeout)
