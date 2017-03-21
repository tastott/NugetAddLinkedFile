param($installPath, $toolsPath, $package, $project)

function RemoveLinkedFile(){
    param($project, $filepath)

    $filename = Split-Path $filepath -Leaf

    "Removing $filename as linked file"

    $item = $project.ProjectItems | Where-Object { $_.Name -eq $filename } | Select-Object -First 1

    if ($item -ne $null){
        $item.Remove();
    }
}

"Removing linked files from $toolsPath from $($project.Name)"

Get-ChildItem $toolsPath -Exclude install.ps1,uninstall.ps1,init.ps1 |
ForEach-Object {
    RemoveLinkedFile $project $_.FullName
}




