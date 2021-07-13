# How to get the short path name for a directory path

## It's easiest in the Windows command prompt (command.com)

Go to the directory you want to know about, and enter the command:
```
for %I in (.) do echo %~sI
```

Here's an example:
```
c:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\Bin\amd64>for %I in (.) do echo %~sI

c:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\Bin\amd64>echo c:\PROGRA~2\MIB055~1\2017\PROFES~1\MSBuild\15.0\Bin\amd64
c:\PROGRA~2\MIB055~1\2017\PROFES~1\MSBuild\15.0\Bin\amd64
```

## It's not so easy in PowerShell, but it's still pretty slick

Save this script as (for example) 'shortname.ps1'.
```
New-Item 0.txt -type file | Out-Null #Creates 0.txt

$path = (dir 0.txt).FullName #Returns full path name of file

$object = New-Object -ComObject Scripting.FileSystemObject
$output = $object.GetFile($path)
$output.shortpath.trim("0.txt") | Out-Null #Generates 8.3 short file path output

Write-Host "`n`n The short path of this directory is" $output.shortpath.trim("0.txt") #Writes output

Remove-Item 0.txt #Deletes 0.txt
```

Then, to use it, go to the directory you want to know about and execute the script:
```
PS C:\Users\rdepew> cd 'C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\bin\amd64'
PS C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\bin\amd64> C:\users\rdepew\shortname.ps1
```


 The short path of this directory is C:\PROGRA~2\MIB055~1\2017\PROFES~1\MSBuild\15.0\bin\amd64\