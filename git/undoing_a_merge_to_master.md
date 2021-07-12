# Undoing a merge to master

WHAT?! You accidentally merged your branch to master, when you 
meant to merge it to development?

Steve McKown taught me that you don't want to absolutely undo
the merge. That's like rewriting history, or turning back time,
and is a serious no-no.

So instead of undoing it, we're going to revert the change. This
is from https://www.christianengvall.se/undo-pushed-merge-git/ .
Here's the really abbreviated version. Better to read the webpage,
so you know why you're typing these magic spells.


git checkout master
git log
# copy and paste the merge commit's UUID, for use in the 'revert' command
git revert -m 1 <merge-commit>
git commit
git push

## Here's another way to do it

I haven't tried this. It looks like it does turn back time.

https://gist.github.com/carltondickson/28a90ccfed2f6b697aba

