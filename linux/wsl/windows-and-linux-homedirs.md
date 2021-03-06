# Windows and Linux home directories

You can get to the Windows file system and your Windows home directory
from WSL. Likewise, you can get to the Linux file system and your
Linux home directory from Windows.

C:\users\rdepew <-> /mnt/c/users/rdepew

/home/rdepew <-> \\wsl.localhost\distroname\home\rdepew

## Implications for Visual Studio Code

### Running from Linux

If you started VSCode in WSL -- that is, you typed typing `code .` from a 
WSL bash prompt, then you will see "WSL: Ubuntu" in the lower-left corner 
of the VSCode window.

When you're running VSCode in WSL, then you should store your project files
in the WSL file system. That is, if you're working in a Linux command line,
then when storing your WSL projects:

* Use the Linux file system root directory: \\wsl.localhost\Ubuntu\home\r\blabla
  or /home/r/blabla
* Not the Windows file system root directory: /mnt/c/users/r/blabla
  or C:\users\r\blabla
* On my Windows 10 system running WSL2 it's \\wsl$\Debian\home\r\blabla

If you don't do this, things will run a LOT slower.

Here's an easy way to find out the path: From the Linux command line,
execute 'cd' to change to your home directory, then execute 'explorer.exe .'
(the "space dot" is important) to open a File Explorer window. In the 
Directory field at the top, where it says "> Network > wsl something", 
click the mouse once, and it will show you the Windows-formatted path to the 
Linux file system root directory.

### Running from Windows

It's the opposite if you started VSCode in Windows, either from the icon or
by typing `code .` from a Windows or PowerShell prompt. You will not see
"WSL: Ubuntu" in the lower-left corner.

* Use the Windows file system root directory: /mnt/c/users/r/blabla
  or C:\users\r\blabla
* Not the Linux file system root directory: \\wsl.localhost\Ubuntu\home\r\blabla
  or /home/r/blabla




