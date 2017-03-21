param($installPath, $toolsPath, $package, $project)

$installPath
$toolsPath
$project

$item = $project.ProjectItems.AddFromFile((Join-Path $toolsPath "test.exe"))
$item.Properties.Item("CopyToOutputDirectory").Value = [int]2;