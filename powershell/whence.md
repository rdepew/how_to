# Whence

In LinuxLand, `whence` is an indispensable command. It helps you
figure out what the other commands are doing.

`whence` also goes by `where`, `whereis`, `what`, and other
mnemonically useful names.

In PowerShell, the `Get-Command` cmdlet does the same thing.

Try `Get-Command ls` and `Get-Command dir`. You will see that 
`Get-Command` is an alias for `Get-ChildItem`.

Try `Get-Command services`. You will see that `services` is
a short form of `C:\windows\system32\services.exe`.

Try `Get-Command Get-Command`. You will see that `Get-Command`
is a cmdlet, part of the PowerShell Core.

