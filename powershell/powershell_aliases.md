# PowerShell Aliases and Functions

## First: The PowerShell home directory

The environment variable for PowerShell home is called `$env:PSModulePath` .

Actually, that's a lie. But if you type this:
```
$env:PSModulePath -split ';'
```
at a PS prompt, you will get some interesting output. It prints a path 
list that PS follows to find PS script modules. The first path in that 
list? Take the word `Modules` off the end, and that's the PowerShell 
home directory.

In my case, it's
```
C:\users\rdepew\OneDrive - AUTOSOL\Documents\WindowsPowerShell
```

This is where all of your custom PowerShell files will be kept.

### How to see a list of environment variables

Using environment variables like $env:PSModulePath will help you 
keep your aliases and functions compact.

Type this command to list all of the environment variables.
```
Get-Item -Path Env:
```

Typing the environment variable by itself will show you its value.
```
$env:HOMEPATH        # returns C:\users\rdepew
```

You can also use the environment variable as an argument to a command.
```
cd $env:HOMEPATH     # changes the current directory to C:\users\rdepew
```

## Aliases in your PowerShell profile file

PowerShell files have a suffix of `.ps1`. Your default PowerShell profile 
is named `Microsoft.PowerShell_profile.ps1` .

To get vi-like command-line editing, the equivalent of Linux `set -o vi`,
add this line to your profile file:
```
Set-PSReadLineOption -EditMode vi
```

In this file, aliases are set using the `New-Alias` command, like this:
```
New-Alias -Name vi -Value 'C:\Program Files (x86)\vim\vim82\vim.exe'
# or
Set-Alias -Name vi -Value 'C:\Program Files (x86)\vim\vim82\vim.exe'
```
From what I've been able to find out, `New-Alias` and `Set-Alias` are
identical.

### How to see a list of aliases

Use the PS command `alias` to see a list of all defined aliases. Note 
that `nal` is an alias for `New-Alias`,
and `sal` is an alias for `Set-Alias`.


## Instead of Aliases: Functions in a script module

Functions act in a manner similar to plain old aliases, but they can be
more powerful. You can put all of your functions in a file called a 
_PowerShell script module_.

Script modules go in the `Module` subdirectory of the `WindowsPowerShell` 
directory, and they use the suffix `.psm1`.

### How to create a function

There's an official naming convention for functions which requires you to 
combine an _approved verb_ with a noun, like `Add-Banana` or `Use-Synonym`. 
Note that the verbs and nouns are capitalized and hyphenated. You can see 
the list of _approved verbs_ by entering the command `Get-Verb` at the PS 
prompt.

I'm not going to use the naming convention. So there. However, if you put
a script module in `C:\Program Files\WindowsPowerShell\Modules` to make it 
universally available, you really, really should follow the naming 
convention.

Here's a webpage about making functions:
https://docs.microsoft.com/en-us/powershell/scripting/learn/ps101/09-functions?view=powershell-7.1

Here's a sample function. Note that this function could also be rendered as 
an alias. But as the above webpage shows, functions can be more powerful and 
more useful than aliases. So remember how to create an alias, but get a lot
of practice creating functions.

```
function server {
    cd "C:\Program Files (x86)\AutoSol\Communication Manager\Server"
}
```

You will want to group a bunch of functions together in a script module.

### How to create a script module

From
https://docs.microsoft.com/en-us/powershell/scripting/learn/ps101/10-script-modules?view=powershell-7.1

To create a script module that will autoload, you have to put it in a 
subdirectory of the Modules directory, with the same name as the script 
module. For example, suppose you create a module of your own custom functions 
and call it `Mine.psm1`.  This module will reside in the directory:
```
c:\users\rdepew\OneDrive - AUTOSOL\Documents\WindowsPowerShell\Modules\Mine
```

Practice by putting one function in the module for starters, the function 
`server` from the previous section.

When you first create and save the file, it is loaded automatically. It is
also autoloaded when you open a new PowerShell window. However, if you make
any changes to the file after that, you will need to reload it using the 
command:
```
Import-Module -Force Mine.html
```

### How to see a list of functions

Use the PS command `Get-ChildItem -Path Function` to see a list of all defined
functions. You can use the command several different ways.
```
Get-ChildItem -Path Function    # Does nothing, prints an error message
Get-ChildItem -Path Function:   # Sorts alphabetically by name, ignoring case
Get-ChildItem -Path Function:\  # Sorts alphabetically by name, ignoring case
Get-ChildItem -Path Function:\* # Sorts them into logical groups
Get-ChildItem -Path Function:\Get* # Shows all functions starting with "Get"
```
