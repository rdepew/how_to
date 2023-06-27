# Process Handles

## Introduction

Windows processes (that is, programs, services, apps) use "handles" to
access Windows resources. They're supposed to let go of those handles
when they close or exit, but they don't always do that.

## Finding out which handles a process uses

You can use Task Manager, but not all versions of Task Manager. I don't
even remember how.

Microsoft's SysInternals group wrote a useful tool called "Process
Explorer" that you can use to list a process's handles, and its
DLLs as well. You can read about it and download it from 


https://learn.microsoft.com/en-us/sysinternals/downloads/process-explorer

## Finding out which process is using a specific handle

This is useful, for example, when you get an error message like this:
```
The process cannot access the file 
'C:\Program Files\AutoSol\Communication Manager\Server\asiARCHIVE.exe' 
because it is being used by another process.
```

Microsoft's SysInternals group wrote a useful tool for this, too, called
"Handle". You can read about it and download it from 

https://learn.microsoft.com/en-us/sysinternals/downloads/handle

When you download it, just run `.\handle.exe`. It will call one of the 
other EXEs if it needs it.

`.\handle.exe` by itself lists all of the running processes, and all
of their handles. You can do this just to get the lay of the land.

But it's really useful when you need to find out who's using a 
particular file. Then you just go like this:

`.\handle.exe "C:\Program Files\AutoSol\Communication Manager\Server\asiARCHIVE.exe"`

Note that a path that includes spaces must be enclosed in quotation marks.

If you're doing this inside a Powershell script, you'll need to start
with the call operator, or ampersand, like this:

`& .\handle.exe "C:\Program Files\AutoSol\Communication Manager\Server\asiARCHIVE.exe"`

If you put 'handle.exe' and its siblings in a directory that's included in your
PATH variable, then you can invoke it with a simple 'handle', like this:

`handle "C:\Program Files\AutoSol\Communication Manager\Server\asiARCHIVE.exe"`

You can use just a piece of the filename, like this:

`handle asiARCHIVE`

... but be aware that 'handle' will return ALL handles that contain that 
snippet, 'asiARCHIVE'. You may end up with more output than you were expecting.
