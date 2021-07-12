ls: cannot access '.': Input/Output Error

I think that's the exact wording.

This is a WSL problem. Reported at https://github.com/microsoft/WSL/issues/4377 .

Two ways to fix it:

## Kill WSL and start over

1. In a PowerShell window, execute the command 
```
wsl.exe --shutdown
```

2. Just restart your WSL session.

## Unmount and remount C:\ drive

From the webpage:

> Since the server is fine and it's only the client that's disconnected,
> you can actually recover from this without restarting WSL, by just
> unmounting (sudo umount /mnt/c) and remounting (sudo mount C:\\ /mnt/c;
> adjust for the appropriate drive letter as needed), but you'd have to
> make sure that you match the right mount options too (especially the
> automatically added ones, such as the default owner uid and gid).
