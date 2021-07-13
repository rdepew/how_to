# Using `ls` and `dir` in PowerShell

In PowerShell, `ls` and `dir` are aliases for `Get-ChildItem`. 
Another alias is `gci`. That makes sense.

`Get-ChildItem` does a directory listing that is similar to, but different
from, both `ls -l` and `dir`.

# A hint about `Get-ChildItem`

`Get-ChildItem` lists more than just files and directories. You'll have
to read about it to understand it fully. For example, `Get-Child Item env:`
lists all environment variables.

# Get a directory listing sorted by date

`gci -file | sort LastWriteTime -Descending`

To recursively list subdirectories, do this instead:

`gci -rec -file | sort LastWriteTime -Descending`

To redirect the output to a file instead of stdout:

`gci -file | sort LastWriteTime -Descending | out-file "filename.txt" -width 4096`
