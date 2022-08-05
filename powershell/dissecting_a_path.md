# Dissecting a path in powershell

## Parent and Leaf

Let's start with 
```
$a = "C:\workspace\acm_source\azure-pipelines.yml"
```

Then 
```
$b = Split-Path $a -Leaf
Write-Host $b
```
yields 'azure-pipelines.yml'

And
```
$c = Split-Path $a -Parent
# or, since -Parent is the default,
$c = Split-Path $a 
Write-Host $c
```
yields 'C:\workspace\acm_source' 

## Using `Split-Path` repeatedly

You can use `Split-Path` repeatedly to get all the way to the drive
specification.

```
$b = Split-Path $a
Write-Host $b
$c = Split-Path $b
Write-Host $c
$d = Split-Path $c
Write-Host $d
$e = Split-Path $d
Write-Host $e
```
yields:
'
azure-pipelines.yml
C:\workspace\acm_source
C:\workspace
C:\
'
and then a blank line, because C:\ can't be split.

## Wild cards

Lets' change $a to include a wildcard.
```
$a = "C:\workspace\acm_source\pipelines\*.yml"
```

Then 
```
$b = Split-Path $a -Leaf
Write-Host $b
```
yields '\*.yml'

and
```
$b2 = Split-Path $a -Leaf -Resolve
```
yields 'cd-build.yml ci-build.yml release.yml setup-tasks.yml'
because it _resolves_ the wild card.


## Basename and extension

This only works if PowerShell knows that the variable is a filename.

Assume you're in a directory that has a file "azure-pipelines.yml".

Then 
```
$a = Get-ChildItem .\azure-pipelines.yml
$b = $a.Fullname
$c = $a.Name
$d = $a.Basename
$e = $a.Extension
Write-Host $a
Write-Host $b
Write-Host $c
Write-Host $d
Write-Host $e
```
yields the following:

C:\workspace\integration-testing\azure-pipelines.yml (the Get-ChildItem output)
C:\workspace\integration-testing\azure-pipelines.yml (the FullName)
azure-pipelines.yml (the Name)
azure-pipelines (the Basename)
.yml (the Extension)

The Get-ChildItem output is a Path object; the other variables are strings.
