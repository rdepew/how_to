# Merging a branch to a parent branch

Suppose you have a branch called 'mybranch' and you want to merge it to a parent
branch, like master.

This is going to do a no-fast-forward merge. It's always safest to do a
no-fast-forward merge, so that the history of changes is preserved in a parallel
path to the master path.

```
git checkout mybranch
git pull --rebase # to make sure you have all changes
git checkout parentbranch (substiute 'develop' or 'master' for 'parentbranch')
git pull --rebase # to make sure you're merging to latest version of parentbranch
git merge --no-ff mybranch
git push
```

Keep the default commit message. Below it, add a blank line and (optionally)
a short description of the merged code.

If you want to delete the branches after:
```
git push -d origin mybranch # deletes the remote branch.
git branch -d mybranch      # deletes the local branch.
```

If git says that you can't delete the local branch, then you can use the `-D`
option instead of `-d`. BUT FIRST make sure that the merge completed
succesfully, and is preserved on the remote.

SPECIAL NOTE: DON'T FORGET THE 'git push' AT THE END!
