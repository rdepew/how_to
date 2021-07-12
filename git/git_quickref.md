# Git quick reference

## To download a git repository

```
git clone http://<repository-details>
# or 
git clone ssh://<repository-details>
```

## To check status of a repo

git status

## A great graphical interface

```
sudo apt install gitk
gitk --all &
```

## If you can't do a graphical interface

```
sudo apt install tig
tig
```

## To check out an existing branch

```
git checkout <branchname>
```
If you don't know the branchname, then hit TAB after `git checkout` and
git will list your options.

## To create a new branch

```
git checkout -b <name-of-new-branch>
```

## To check in your changes

1. Add the files to the list to be committed.
2. Commit the changes.
  - See notes below for commit messages.
3. Push the changes to the 'origin' server.

```
git add <file1> <file2> ...
# or, to add all changes (don't forget the dot on the end)
git add -u .
git commit
git push
# or, if it's a brand new branch, never been pushed to master
git push -u origin <name-of-new-branch>
```

## To merge your branch with the master branch

IMPORTANT: Before doing these steps, make sure that the branch you want
to merge is all committed and pushed.

ALSO IMPORTANT: The "--no-ff" option is preferred. This preserves
your branch as a separate branch from the master. If you omit "--no-ff",
then, when you merge, it looks like you made all the changes in the master
branch.  For the first branch, like a first proto or proof of concept, this 
is okay, but for later branches, you'll want to keep the master as clean as
possible.

```
git checkout master
git pull # to make sure your MASTER branch is up-to-date
git merge --no-ff  <name-of-branch-to-merge>
git push
```

## To delete a local branch

You can't delete the branch you're currently on, so first switch to master.

```
git checkout master
git branch -d <name-of-branch-to-delete>
# If that doesn't work, use capital D
git branch -D <name-of-branch-to-delete>
```

## To delete a remote branch

The first one is new and easier to remember. It's a double-dash-delete.
The second one is the classic. Space, colon, branch name.

```
git push origin --delete <name-of-branch-to-delete>
# OR 
git push origin :<name-of-branch-to-delete>
```
