[void][System.Reflection.Assembly]::LoadWithPartialName("envdte.dll")
[void][System.Reflection.Assembly]::LoadWithPartialName("envdte80.dll")
$dte = [System.Runtime.InteropServices.Marshal]::GetActiveObject("VisualStudio.DTE.14.0")
$project = $dte.Solution.Projects | Where-Object {$_.Name -eq "TargetProject"} | Select-Object -First 1

$scriptDir = Split-Path -parent $PSCommandPath
$installScript = Join-Path $scriptDir "./install.ps1"
$installPath = Split-Path -parent $scriptDir
$toolsPath = $scriptDir

& $installScript -installPath $installPath -toolsPath $toolsPath -project $project