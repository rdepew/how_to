# Renaming a branch

This is something that you won't want to do often, but you will 
want to do eventually.

__IMPORTANT:__ You will need to rename both the local branch
and the remote branch.

## Renaming the local branch

### If you currently have a different branch checked out

Let's say you have branch 'master' checked out. The branch you want
to rename is branch 'oldname', and you want to rename it to 'newname'.

Again, if you're not currently working in branch 'oldname', then you
just do this:

```
git branch -m oldname newname
```

### If you currently have that branch checked out

If you're currently working in branch 'oldname', then you just omit that 
argument from the command. 

```
git checkout oldname   # optional
git status             # make sure you're on branch oldname
git branch -m newname
```

## Renaming the remote branch

This will require two commands -- actually no, three commands. You check 
out the local branch to verify that you're in the right place, then you 
delete the old remote branch, and finally you create the new remote branch.

```
git checkout newname                 # make sure you're in the right place
git push -u origin --delete oldname  # delete the old remote branch
git push -u origin newname           # create the new remote branch
```

Note that there are a couple of different valid syntaxes for deleting a 
remote branch. I show this one because it's easier to understand.


