# venv - Python virtual environments

From https://docs.python.org/3/tutorial/venv.html

## Creating an environment

You'll need a name for your environment. It can be any name.
If it's a dot-name, that's better because it will stay hidden.
.venv is a good name.
Dunno if it should go in the project dir or the user's home dir.

Let's do it in the project dir. That way, it will persist.
```
mkdir Environments
cd Environments
python3 -m venv <new-env-name>
# (Clue: I don't know the difference btwn venv and virtualenv.
#  But 'sudo apt install python3-virtualenv installs the latter.)
# and virtualenv <new-env-name> works the same way.
```

That creates the dir <new-env-name> in the Environments directory, and 
that's where it will store the Python files.

## Activating the environment

```
cd
# if Windows
<env-dir-name>\Scripts\activate.bat
# if PowerShell
<env-dir-name>\Scripts\activate
# or #
<env-dir-name>\Scripts\Activate.ps1
# if linux
cd ~/Environments
source <new-env-name>/bin/activate
# Or this, from any directory:
source ~/Environments/<new-env-name>/bin/activate
```

You can use the dot "." as a shortcut for "source".

## Installing Python packages

```
cd workspace/<project-dir>
source <env-dir-name>/bin/activate
# Always make sure you're in the venv before running PIP
pip3 install flask
python3 filename.py
```

## Deactivating the venv.

From inside the venv, type this simple command:
```
deactivate
```
Voice command accepted. Have a good day, Sir Axelrod.

## When you don't want the venv anymore:

```
rm -rf <env-dir-name>
```
