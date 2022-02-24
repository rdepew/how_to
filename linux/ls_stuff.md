# ls stuff

The Linux command `ls` is like the Windows command 'dir`.
It lists the contents of your folder or directory.
Think of `ls` as short for "list".

Just `ls` will list the contents (all the files and subfolders)
in the current folder.

`ls ACM_results` will list the contents of the ACM_results subfolder.

`ls *pkg` will list all files in the current folder that end with "pkg".

`ls -l` is "list long". It gives you more details about the contents.

'ls -a` is "list all". It adds hidden files and folders to the output.

`ls ..` is "list the parent directory". If you are currently in
/c/users/ks/source/repos, then `ls ..` will list the contents of 
/c/users/ks/source.
