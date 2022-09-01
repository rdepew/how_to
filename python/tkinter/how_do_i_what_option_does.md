# Seeing widget options in tkinter

Stolen from 
https://docs.python.org/3/library/tkinter.html#how-do-i-what-option-does

so I will know where to find it again.

## Here's the stolen text.

If you’re not sure how to do something in Tkinter, and you can’t immediately
find it in the tutorial or reference documentation you’re using, there are a
few strategies that can be helpful.

First, remember that the details of how individual widgets work may vary across
different versions of both Tkinter and Tcl/Tk. If you’re searching
documentation, make sure it corresponds to the Python and Tcl/Tk versions
installed on your system.

When searching for how to use an API, it helps to know the exact name of the
class, option, or method that you’re using. Introspection, either in an
interactive Python shell or with `print()`, can help you identify what you need.

To find out what configuration options are available on any widget, call its
`configure()` method, which returns a dictionary containing a variety of
information about each object, including its default and current values. Use
`keys()` to get just the names of each option.

```
btn = ttk.Button(frm, ...)
print(btn.configure().keys())
```

As most widgets have many configuration options in common, it can be useful to
find out which are specific to a particular widget class. Comparing the list of
options to that of a simpler widget, like a frame, is one way to do that.

```
print(set(btn.configure().keys()) - set(frm.configure().keys()))
```

Similarly, you can find the available methods for a widget object using the
standard dir() function. If you try it, you’ll see there are over 200 common
widget methods, so again identifying those specific to a widget class is
helpful.

```
print(dir(btn))
print(set(dir(btn)) - set(dir(frm)))
```

