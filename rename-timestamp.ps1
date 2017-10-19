PS C:\> $stamp = Get-Date -F yyyy-MM-dd_HH-mm
PS C:\> Get-ChildItem *.$arg | ForEach { Rename-Item -Path $_.FullName -NewName "$($_.DirectoryName)\$($_.BaseName)_$stamp$($_.Extension)" }
