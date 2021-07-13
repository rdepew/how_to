# Git aliases

## How to create a git alias

You can create aliases for any git command. For example, if you do this:
```
$ git config --global alias.co checkout
```

... then you never have to type `checkout` again. Instead of typing:
```
$ git checkout -b new_branch
```

... you can type:
```
$ git co -b new_branch
```

## An alias for unstaging

If you want to unstage or un-add a file that has been staged but not
committed, normally you would type
```
$ git reset HEAD -- thisfile.c
```

But if you create an easy-to-remember alias for `reset HEAD --`, you can
use the alias instead:
```
$ git config --global alias.unstage 'reset HEAD --'
$ git unstage thisfile.c
```

## An alias for the last commit

One useful alias to see the details of the last commit is this one:
```
$ git config --global alias.last 'log -1 HEAD'
$ git last
```

## Git aliases vs. bash aliases

Keep in mind that you can always add a bigger alias to your bash aliases, 
like in `.bash_aliases` or `.bashrc`:
```
alias co='git checkout'
alias unstage='git reset HEAD --'
alias last='git log -1 HEAD'
```

Both are good. Which one you use is up to you.
