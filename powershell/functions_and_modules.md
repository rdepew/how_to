# Including functions and modules in your PowerShell projects

This is about including functions and modules in individual 
projects -- functionality similar to `include mystuff.py` in a Python project.

For information about global functions and modules, see the document 
'powershell_aliases.md'.

# Functions

If your project is a single PowerShell file, you can include a function
or functions at the top of the file, like this:

```
function do_this {
  # does stuff
}

function do_that {
  # does other stuff
}

# the main part of script
do_this()
do_that()
```

But if you get a lot of functions, you may want to move the out of your
main PowerShell file. You can put them in a separate file. Call it
Utilities.ps1, or Project-Functions.ps1, or some other useful name. Then you
will need to 'dot-source' them at the beginning of your project file.

You dot-source a file in PowerShell scripts the same way you do in Linux:
type a dot (period), a space, and then the thing you are dot-sourcing.
However, you don't dot-source the _name_ of the file; you dot-source the
_object_ that the name refers to.
```
$the-thing-youre-dot-sourcing = Get-Item c:/path/to/the/thing.ps1
. $the-thing-youre-dot-sourcing
```

PowerShell understands that if it can't find the requested functions in the
current file, it should look for them in the dot-sourced file.

So the example project file above becomes:

```
$utils = Get-Item c:/path/to/Utilities.ps1
. $utils
# ...
# ...
# ...
do_this()
do_that()
```

Actually, with those functions in a separate file, they are now portable 
and you can include them in any project. 
