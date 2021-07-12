# Storing Git username and password

It can be a pain, having to type your username and password every time you do a
`git push` or `git pull`. The command `config credential.helper` lets Git
remember your username and password. But you can't just use it by itself.

Execute the command just before doing a push or pull. On the push or pull,
you will have to enter your credentials one last time. DON'T MESS THEM UP.

The credential helper stores your usernames and passwords in a dotfile on
your computer. See https://git-scm.com/docs/git-credential-store/1.7.12.1
for more information.

The command:
```
$ git config --global credential.helper store
$ git push    # or git pull
```
