# WSL home directory

## First, the root directory

You can see the WSL root directory in Windows by opening a 
File Explorer window and entering this in the location field:
```
\\wsl$\<distro-name>\
```

## Second, the home directory

```
\\wsl$\<distro-name>\home\<username>
```

## WAIT! WAIT! DON'T TOUCH THAT LEVER!

**WARNING: MICROSOFT STRONGLY WARNS AGAINST MESSING WITH 
FILES IN THIS DIRECTORY FROM THE WINDOWS SIDE OF THE COMPUTER.**

Instead, it's better to copy them (using Linux, I guess) to
a safe location in the C:\Users\<username> tree.




