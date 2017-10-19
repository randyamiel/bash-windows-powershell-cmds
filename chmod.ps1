
#   Set-Acl - Run Get-Help Set-Acl -Full

#    attrib.exe - Standard Windows tool for setting file attributes. Not Powershell-specific, but of course still works in Powershell.

#    icacls.exe - Standard Windows tool for setting ACLs. Not Powershell-specific, but of course still works in Powershell.



# Get the Access Control List from the file
# Be careful $acl is more a security descriptor with more information than ACL
$acl = Get-Acl "c:\temp\test.txt"


# Show here how to refer to useful enumerate values (see MSDN)
$Right = [System.Security.AccessControl.FileSystemRights]::FullControl
$Control = [System.Security.AccessControl.AccessControlType]::Allow

# Build the Access Control Entry ACE 
# Be careful you need to replace "everybody" by the user or group you want to add rights to
$ace = New-Object System.Security.AccessControl.FileSystemAccessRule ("everybody", $Right, $Control)

# Add ACE to ACL
$acl.AddAccessRule($ace)

# Put ACL to the file
Set-Acl "c:\temp\test.txt" $acl
(Get-Acl "c:\temp\test.txt").access
Read-Host "--------- Test Here --------------"

# Remove ACE from ACL
$acl.RemoveAccessRule($ace)
Set-Acl "c:\temp\test.txt" $acl
(Get-Acl "c:\temp\test.txt").access



