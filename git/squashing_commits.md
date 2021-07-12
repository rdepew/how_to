# Squashing commits

## The easy way -- without rebasing

If you want to squash the previous 'x' commits into a single one, 
you can use the following commands:
```
git reset --soft HEAD~x
git commit
```

... replacing x with the number of previous commits you want to be 
included in your squashed commit.

**NOTE 1:** The latest commit, the one you're sitting on right now,
is `HEAD~1`. So
```
git reset --soft HEAD~1
```

... will do exactly nothing.

## The hard way -- rebasing

## sources

https://devtut.github.io/git/squashing.html#squash-recent-commits-without-rebasing
