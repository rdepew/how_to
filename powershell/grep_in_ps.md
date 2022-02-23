# Grep in PowerShell

## WAIT! See the stuff at the end about Agent Ransack.

## Yeah, about grep ..

Windows doesn't have the useful Linux command `grep`, but you can make the
cmdlet `Select-String` work almost as well. In fact, once you understand
all of the `Select-String` options, you may be able to make it dance as 
nimbly as `grep`.

The basic format is this:
```
Select-String -Path "top\level\path\to\search" -Pattern "this pattern"
```

You can search for multiple patterns, like this:
```
Select-String -Path "the\path" -Pattern "pattern1","pattern2","pattern3"
```

The pattern can be a line of text, or it can be a regular expression. Use 
'single quotes' for regexes.
```
Select-String -Path "the\path" -Pattern '^reg[Ee]x'
```

## Customizing the output

`Select-String` returns more than just the lines that match the text. You
can format your output, with something like this:
```
Select-String -Path "path" -Pattern "xyz" | Select-Object Filename, Pattern, Line
```
Here are all the objects it returns:
* Pattern
* Filename
* Path
* Line
* LineNumber
* Matches (number of matches)
* Context
* IgnoreCase

You can use the -Context option to show lines above and below the matching line.



## Grep options and their PowerShell equivalent

-i ignore case. Default in PS. To make a searc case-sensitive, use option
    -CaseSensitive
-r recursive search. Default in PS.
-l list matching filenames only. -List only returns the first match in a file.
-v list only files that don't match. -NotMatch does the same thing. (Um, why?)
-something. Quiet mode, no output. -Quiet
The -Raw option shows only the line with the matching text. Without the Raw 
option, you can get a lot more output. See above.

## Sources
More examples are given in these sources.

* https://adamtheautomator.com/powershell-grep/
* https://antjanus.com/blog/web-development-tutorials/how-to-grep-in-powershell/
* https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-string?view=powershell-7.2

## AGENT RANSACK!

There's a tool for Windows called "Agent Ransack" that does grep-ish things.
It's free, and it might even be in the Windows Store. I dunno. But if it's
not in the Windows Store, it can be downloaded from 
https://www.mythicsoft.com/agentransack/
