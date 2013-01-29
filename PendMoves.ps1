﻿function Get-PendingFileRenameOperation
{
    $Renames = (Get-ItemProperty "HKLM:\System\CurrentControlSet\Control\Session Manager" -Name PendingFileRenameOperations).PendingFileRenameOperations

    $Renames = $Renames.Split([Environment]::NewLine)

    for($i = 0; $i -lt $Renames.Length; $i+=2)
    {
        [PSCustomObject]@{Path=$Renames[$i];Destination=$Renames[$i +1];Delete=[String]::IsNullOrEmpty($Renames[$i + 1])}
    }
}