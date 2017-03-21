param($installPath, $toolsPath, $package, $project)

$installPath
$toolsPath
$project

function AddLinkedFile(){
    param($project, $filepath)

    $filename = Split-Path $filepath -Leaf

    $item = $project.ProjectItems | Where-Object { $_.Name -eq $filename } | Select-Object -First 1

    if ($item -ne $null){
        $item.Remove();
    }

    $item = $project.ProjectItems.AddFromFile($filepath)
    $item.Properties.Item("CopyToOutputDirectory").Value = [int]2;
}

AddLinkedFile $project (Join-Path $toolsPath "test.exe")



