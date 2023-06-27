# Git in PowerShell

Git command-line works just fine in PowerShell, but it's missing a few 
important features from the Linux implementation. For example,
you can't do `git checkout -` to switch to the previous branch, and
you can't use Tab-autoocompletion.

There are a couple of PowerShell add-ins that fix those deficiencies.

## posh-git

I like this one. Rather than describe it here, I refer you to 
Github: https://github.com/dahlbyk/posh-git

Follow the instructions in the README to install it and to set it
up in your PowerShell profile.

## Clink

Sorry, Clink doesn't work with PowerShell.

Clink is older, and it only works with cmd.exe.
It's still very powerful, in that it tries to bring an 
entire bash-like experience to the Windows command line. See 
https://mridgers.github.io/clink/ if you're interested.
