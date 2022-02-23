# Starting Powershell as a different user

## Just starting it as a different user

The command
```
Start-Process -FilePath "powershell.exe" -Verb RunAsUser
```
will prompt you for a username and password, and then open a new
PS window, running as a different user. You can verify the new
user by executing the `whoami` command in the new window.

## Same user, but run as Administrator

The command
```
Start-Process -FilePath "powershell.exe" -Verb RunAs
```
will prompt you Yes/No for whether you really want to run as Admin,
and then open a new window with "Administrator: Windows PowerShell" in the
title bar.

## Different user, run as Administrator

The command
```
Start-Process -FilePath "powershell.exe" -Credential azrpocdev1\user32 -ArgumentList '-noprofile -command & {Start-Process -FilePath "powershell.exe" -Verb RunAs}'
```
will prompt you for the `user32` password, and then open a new PowerShell
window in Administrator mode.

_NOTE: Of course, you will replace "azrpocdev1\user32" with the domain and 
username of your choice._

## Different user, run as Administrator, but avoid prompts

Run this command once, to save the new user's password in encrypted form.
```
Read-Host -AsSecureString | ConvertFrom-SecureString | Out-File .\user32.txt
```

Then run these three commands to open a new PowerShell window as a new user, in
Administrator mode.
```
$pw = Get-Content .\user32.txt | ConvertTo-SecureString
$pp = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList "azrpocdev1\user32",$pw
Start-Process -FilePath "powershell.exe" -Credential $pp -ArgumentList '-noprofile -command & {Start-Process -FilePath "powershell.exe" -Verb RunAs}'
```

I'll bet that would make a nice script or function.

_NOTE: Remember to customize the commands to use your own filename, domain
name, and username._

