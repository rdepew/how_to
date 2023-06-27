# Powershell environment variables

## List all environment variables

Pick one. They all do the same thing.

```
ls env:*
gci env:*
Get-ChildItem env:*
```

## List one environment variable

Suppose you want to know the name of your computer. It's saved in the
environment variable COMPUTERNAME.

So pick one. They all do the same thing.

```
echo $env:COMPUTERNAME
Write-Host $env:COMPUTERNAME
```

## Use an environment variable

You can use an environment variable anywhere that you would use an argument,
a parameter, or a Powershell variable.

* `gci $env:HOMEPATH` will list the contents of your home directory.
* `cd $env:HOMEPATH` will change to your home directory.
* `notepad $env:HOMEPATH/blah.txt` will open the Notepadd app and edit the
  file 'blah.txt' in :wqyour home directory.
