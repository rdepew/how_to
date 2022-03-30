# About vimrc

The file `.vimrc` or `_vimrc` is the Vim resource file. This is where
you put all of your customizations.

The best way to find out about vimrc is by running the command `:help vimrc`
while inside Vim. 

On my work PC, my Windows vimrc is at `C:\Users\Rdepew\_vimrc`, and my
Linux/WSL vimrc is at `/home/rdepew/.vimrc`. I tried to make the Linux
one a symbolic link to the Windows one, but because of some Windows 
incompatibilities it didn't work. Oh well.

You can have a separate `_gvimrc` or `.gvimrc` for gVim. Run the command
`:help gvimrc` for more information. But you can also put gVim-related
stuff in the regular vimrc file. For example:

* `set guifont=Terminal:h9:cOEM:qDRAFT` will change the default font
  in gVim. (That's just an example. Use whatever font you want. Run
  the command `:help gui-font` with the hyphen to find out more.
* `has("gui_running")` is a true/false test you can use in vimrc to 
  determine whether vim is running in a terminal or a gVim window, in
  order to apply customizations that just apply to one or the other.

As a best practice, always choose your color scheme in the last line 
of your vimrc. I prefer `industry` as my color scheme, and so the last
line of my vimrc is `colo industry`.

A quick search of 'vim industry color scheme' finds this link:
https://www.vim.org/scripts/script.php?script_id=4875




