# When a string is not recognized as a cmdlet

This is an annoying thing about PowerShell.

One of many annoying things about PowerShell.

Let's say that you have defined a variable, like this:
```
$blah = 'hello'
```

Or maybe you're in an Azure pipeline, and it's defined like this:
```
variables:
  - blah2: 'hello'
```

Then you want to use the string in a comparison, like one of these two:
```
if( $blah -eq 'hello' ) { DoSomething() }
# or
if( $(blah2) -eq 'hello' ) { DoSomething() }
```

When you execute it, you get this exceedingly dumb error message:
```
hello : The term 'hello' is not recognized as the name of a cmdlet, function,
script file, or operable program. Check the spelling of the name, or if a 
path was included, verify that the path is correct and try again.
At C:\path\to\your_script.ps1:87 char:5
+ if( hello -eq 'hello') {
+     ~~~~
```

It's beyond annoying. From the variable declaration, it should be obvious
that it's a string, right? PowerShell's default behaviour should be to 
try to execute it, and, if it can't execute it, to treat it as an object --
maybe try integer first, then float, then string. 

But nooooooooo, PowerShell takes a perfectly good string, assume it's the
name of something to execute, and errors out. Stupid thing.

The fix is easy, but not clearly documented anywhere: enclose the variable
in quotes.
```
if( '$blah' -eq 'hello' ) { DoSomething() }
# or
if( '$(blah2)' -eq 'hello' ) { DoSomething() }
```

You shouldn't have to do this. But hey, it's PowerShell.

Also, it doesn't matter if you use 'single quotes' or "double quotes". 
Sometimes it does matter in PowerShell, but that's another annoyance
for another time.

