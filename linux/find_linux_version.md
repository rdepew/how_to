# Finding out your Linux version

It used to be that your only option was the `uname` command,
especially `uname -a`, which gave you a response like this:

```
Linux AUTOSOL1119 5.4.72-microsoft-standard-WSL2 #1 SMP 
Wed Oct 28 23:40:43 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
```

That gives you some useful information, like the fact that
it's Linux, the name fo the host it's running on, the kernel
version, and the kernel compilation date.

But that's not what you want. What you really want is 
`lsb_release -a`, which gives you a response like this:

```
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 22.04.1 LTS
Release:	22.04
Codename:	jammy
```
