# touch-windows
Unix touch command implemented in windows

# touch examples

**Examples:**

Change the Creation + Modification + Last Access Date/time and if the file does not already exist, create it:
```powershell
PS C:\> touch foo.txt```

Change only the modification time:
```powershell
PS C:\> touch foo.txt -only_modification```

Change only the last access time.
```powershell
PS C:\> touch foo.txt -only_access```

Change multiple files:
```powershell
PS C:\> touch *.bak
PS C:\> dir . -recurse -filter "*.xls" | touch```

# Adding to the Global Powershell environment $Profile
$Profile - touch.ps1

Configure the PowerShell environment.
The PowerShell $Profile is run automatically when the shell session is started, it can be used to run scripts and set variables.

The $profile automatic variable will show the location of your touch.ps1 file:
PS > "$Profile"

To edit the profile with notepad:
PS > notepad $Profile

To reload the profile into the current session:
PS > .$Profile

By default, the profile file does not exist, even though PowerShell has a filename for it, the file can be created using New-Item or notepad.

The search order of commands is Alias > Function > Cmdlet

Functions defined in $Profile will take precedence over built-in cmdlets with the same name. However to replace an Alias you must first remove the built-in Alias with Remove-Item. The built-in aliases are 'sticky', unless they are removed from every session (by adding a Remove-Item command to $Profile) then they will re-appear the next time you start PowerShell.

Below are a few functions you may want to add to your $Profile:

i.e. touch
