# Pretty-printing JSON in Vim

This isn't a perfect solution, but it will do.

Most JSON files, when you open them in VIM, are a mess. All of the JSON
is on one line. Syntactically, it's all correct, but it's awfully hard
to read.

## Requirements

You must have Python installed on your computer, because you're going
to use a Python module called json.tool. This module is built into
Python, so you don't need to install it separately.

## How to do it

If your entire file is JSON, then you can pretty-print the whole 
thing:
```
:%!python -m json.tool
```

If the JSON is between lines 10 and 22, then you can pretty-print
between those lines:
```
:10,22!python -m json.tool
```

Suppose you have bookmarks 'a' and 'b' defined. Then you can 
pretty-print between the bookmarks:
```
:'a,'b!python -m json.tool
```

## Don't save unless you really want to

The module json.tool changes the text in Vim. If you try to quit,
Vim will ask if you want to save your changes. You probably don't.

If all you wanted to do was inspect the JSON and try to make sense
of it, then don't save the prettied-up version.

Syntactically, the prettied-up version is still correct. It will 
work as well as the original single-line version. So you can save
it if you wish. Functionally, there's no advantage to either format.

But generally speaking, if the original version worked fine, then
stick with the original version. If it ain't broke, don't fix it.

## Sources

I found this in 
https://pascalprecht.github.io/posts/pretty-print-json-in-vim .
