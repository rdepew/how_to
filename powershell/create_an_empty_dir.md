# Create an empty directory

Suppose you want an empty directory called 'blah'.

## Create a directory

That's easy.
```
mkdir blah
```

## What if the directory already exists?

If the directory already exists, then mkdir will return this error:
```
mkdir: An item with the specified name C:\path\to\blah already exists.
```

## So why not just delete the directory contents?

Now you need to delete everything in the directory. Should be easy.

## So you end up with an algorithm like this:

```
if a directory exists,
  then delete everything inside it
but if it doesn't exist,
  then create it.
```

If( Test-Path -Path blah) {
  # remove everyhing in it
} Else {
  mkdir blah
}

## This might be easier

```
if a directory exists
  then delete it and everything in it
Now create a fresh one
```

If( Test-Path -Path blah) {
  Remove-Item blah -Recurse
}
mkdir blah
