# Rebasing a branch

Suppose I have a branch, `ray-dev`, that is a branch of another branch,
called `development`. Some important changes have been made to the 
`development` branch, and I need to incorporate those changes into 
`ray-dev`. 

That means that I need to base `ray-dev` on the latest `development`
commit -- or, in Git terms, I need to **rebase** `ray-dev` on the
latest `development` commit.

```
git checkout ray-dev
git pull --rebase
# Do stuff to make sure that ray-dev is all clean and up-to-date,
#   that is, internally consistent.
git checkout development
git pull --rebase # to make sure that development is up-to-date
git checkout ray-dev
git rebase development
# If you have conflicts, resolve the conflicts and do this:
git rebase --continue
# But if you can't resolve the conflicts, then 
git rebase --abort
# FINALLY:
git push
# or, if the push doesn't work
git push -u origin ray-dev
```

