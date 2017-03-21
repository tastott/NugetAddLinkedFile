param($installPath, $toolsPath, $package, $project)

$installPath
$toolsPath
$project

function AddLinkedFile(){
    param($project, $filepath)

    $filename = Split-Path $filepath -Leaf

    "Adding $filename as linked file"

    $item = $project.ProjectItems | Where-Object { $_.Name -eq $filename } | Select-Object -First 1

    if ($item -ne $null){
        $item.Remove();
    }

    $item = $project.ProjectItems.AddFromFile($filepath)
    $item.Properties.Item("CopyToOutputDirectory").Value = [int]2;
}

"Adding linked files from $toolsPath to $($project.Name)"

Get-ChildItem $toolsPath -Exclude install.ps1,uninstall.ps1,init.ps1 |
ForEach-Object {
    AddLinkedFile $project $_.FullName
}




