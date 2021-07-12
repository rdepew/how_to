# Installing Go on Ubuntu

## Introduction

This also works on Debian. Probably other Linux OSes as well. We'll see.

Copied from https://www.hostingadvice.com/how-to/install-golang-on-ubuntu/

**MAKE SURE TO READ THE ADDITIONAL NOTES AT THE END.**

## 1. Clone the Repo and Add to User Directory

```
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
```

This command uses cURL to grab the GitHub repo and install it within your 
user directory. The file that this repo is placed in is ~/.gvm.

## 2. Open Your ~/.bashrc and Source the GVM Directory

```
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
```

All we are doing here is linking the gvm binary to our environmental 
variables. This allows you to run GVM from any path on your command line.

## 3. Logout and Login with Your User

The easiest way to make the changes in your .bashrc take effect is to just log
out and log back into your shell.

## 4. Check to Make Sure that GVM is Installed

```
$ gvm version
Go Version Manager v1.0.22 installed at /home/myuser/.gvm
```

This command will tell you which version of GVM is installed. If it reports a
version back, then you have successfully installed GVM. Well done!

## 5. Install Go (Golang)

First let’s check the versions of Go that are available.

```
$ gvm listall
...
go1.2rc5
go1.3
go1.3.1
go1.3.2
go1.3.3
go1.3beta1
go1.3beta2
go1.3rc1
go1.3rc2
go1.4
go1.4beta1
go1.4rc1
go1.4rc2
```

As you can see, GVM includes the beta versions of software and release
candidates (rc).

Let’s install Go 1.4.
```
$ gvm install go1.4
Downloading Go source...
Installing go1.4...
* Compiling...
```

If this errors out, with an error like "Can't find go1.4", then use the -B
option to compile from binary. See the additional notes at the end.

## 6. Tell GVM Which Version of Go to Use

Now that we have Go installed on our system, let’s let GVM know we wish to use
that version.
```
$ gvm use go1.4
Now using version go1.4
```

Sweet. Everything is going great so far.

## 7. Verify Go Is Installed Correctly

```
$ go version
go version go1.4 linux/amd64
```

We are done! GVM makes this process simple, and upgrading, changing versions,
and uninstalling Go is now simple as well.

## Additional notes.

This is stuff I discovered while following the instructions from
hostingadvice.com . Some of this is from the comments, and som is stuff I
found out on my own.

To install some later versions of Go, you need to install go1.4 first, AND
you need to install both from binaries rather than plain source code.
```
gvm install go1.4 -B
gvm install go1.13.6 -B
```

If you don't want to do `gvm use` every time you login, then set a default
version of Go, like this:
```
gvm use go1.13.6 --default
```

To check versions:
```
$ gvm version
Go Version Manager v1.0.22 installed at /home/rdepew/.gvm
$ go version
go version go1.13.6 linux/amd64
```

As of 6 Mar 2020, the Bierstadt team is using version 1.13.6.

