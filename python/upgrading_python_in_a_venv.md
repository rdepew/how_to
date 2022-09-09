# Upgrading Python in a virtual environment

What if you just finished installing a new version of Python on your
PC? You have a whole stack of virtual environments that use old 
versions of Python. How can you upgrade them all to the new version?

It's simple. 

First, you make a list of all of your virtual environments. Then
you upgrade each of them with a simple, one-line command. You don't
even have to activate the virtual environment to do it.

Suppose that the path to one of your virtual environments is
`C:\workspace\thisproject\.venv\blabla`. Then you run this command
```
python -m venv --upgrade C:\workspace\thisproject\.venv\blabla
# or
python3 -m venv --upgrade C:\workspace\thisproject\.venv\blabla
```
