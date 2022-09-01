# Returning info from an input form

This could also be called:

# Creating a Modal Window

or:

# How do I return information from a child window to the parent program?

## Introduction

### The problem statement

Since a tkinter UI is event-driven, and is governed by the `root.mainloop()`
statement at the end of the file, it doesn't work like classical imperative
or functional programs. There is not a `return` statement that you can
use to pass results from the window back to the calling program.

This matters, for example, when you need to create a child window, a form
that the user fills out with information, which you then want to utilize
in the main window -- or in a different program.

### Global variables ain't the answer.

The easiest thing to do, and definitely the most tempting, is to create
some global variables and write the needed information to them.

This is only slightly better than writing the information to disk, and
then reading it back in the main program.

We try to avoid global variables as much as possible. They make the 
program less portable and harder to maintain/debug. See also "code smell"
and "technical debt". 

### Turn the second window into an OOP class.

The trick is to write the child window as a class.  (I've been doing this
for decades, and I still don't quite have the hang of OOP. But this is a
great chance to learn.)

Then, when we create the child window in my main program, as an instance of
the class, it opens the window and sets up all of the functionality. When
we fill in the form in the child window, it writes the information to an
attribute of the class -- which I can then read from the main program.

### Also, make the second window a modal window.

Yeah, so _modal_ is a software term that has been around for a long time.
I've heard it before, but never understood it. Now I do.

As mentioned at the top of this doc, a tkinter program follows the
event-driven paradigm, and runsin a `mainloop()` that never ends. Anything
that happens in the program should happen quickly, and not bog down the
mainloop. Ideally, the main window and child windows should exist
independently.

But for our input form to work, its window must take priority over all other
windows in the application. It must be displayed on top of the others, and
everything else that's happening must come to a screeching halt until this
window is closed. I know it defies the principles or assumptions of the 
event-driven paradigm, but that's what has to happen.

That's what _modal_ means.

One example of this is an app that stops and throws up a "You must enter
a password (or license, or authentication token) to continue" popup.
Nothing happens until you satisfy the requirements of that popup.

## Strategy

Here's how we're going to do it.

### The main window -- just to set things up

We'll create the main window in the usual way, and call it `root` like usual.
(You don't have to call it `root`. That's just custom.)

```
#! /usr/bin/python

from tkinter import *
from tkinter import ttk

# Set up the main window
root = Tk()
root.title("This is the main window")
root.minsize(300,200)
frame = ttk.Frame(root, padding=5)
frame.grid(row=0, column=0, sticky=(N, W, E, S))
ttk.Label(frame, text="Glorfindel the Mighty").grid(row=0, column=0)
# This is where we will insert the call to the child window
# root.mainloop() is the mandatory last line in the main window script.
root.mainloop()
```

Okay, that will set up a small, do-nothing main window for us. To 
close it, we simply click the Close box in the upper-right corner.

### The basic input form

The input form will be defined in its own file. 
You can define it as a simple function in `input-form.py` like this:

```
#!/usr/bin/python 

from tkinter import *
from tkinter import ttk
import input_form as ip

def modal_window(root, *args):
    window = Toplevel(root, borderwidth=5)
    window.title("Child window")
    window.minsize(300,200)
    inputFrame = ttk.Frame(window, padding=10)
    inputFrame.grid(row=0, column=0, sticky=(N, S, E, W))
    buttonFrame = ttk.Frame(window, padding=10)
    buttonFrame.grid(row=99, column=0, sticky=(E, W))
    ttk.Button(buttonframe, text="Close", command=window.destroy).grid(row=0, column=0)
```

Some things to note:
1. `Toplevel()` is the widget for a child window. Here, we have 
  identified it as a child of the `root = Tk()` window that we created
  in `main.py`. Simply put, `Toplevel()` is the child window's equivalent
  to `Tk()`. It doesn't require a `grid()` or `pack()`.
2. The rudimentary "Close" button in the buttonFrame closes the window. We
  will add more buttons and functionality as we go along.

Then we will need to add two lines to `main.py` in order to use the function.
After the two `from tkinter import` statements, add this line:
```
import input_form as ip
```

That makes `input_form.py` a module that we can use in `main.py`, using the
shortcut `ip`.

After the "This is where" comment near the end of `main.py`, add these two lines:
```
data = {"name": "Lancelot", "quest": "grail", "colour": "blue"}
form = ip.modal_window(root, data)
```

(We won't do anything with the `data` variable; it's just a placeholder.)

Now, if we run `python3 main.py`, we'll see a main window, and a child window
with a Close button. The Close button simply closes the child window.

The problem, as stated at the top, is that we can't get any data back from
the child window. The `form =` part of `form = ip.modal_window(root, data)`
dosn't do anything, because `modal_window()` doesn't return anything.

### Turning `modal_window()` into a class

By rewriting `modal_window()` as a class, we can add a class attribute, a
variable into which we can write the result. We can then read the result
in `main.py`.

We will replace the `modal_window()` function definition with the 
`ModalWindow()` class definition.  We will use the class method `__init__()`
to draw the child window. 
```
class ModalWindow:
    def __init__(self, root, *args):
        self.window = Toplevel(root, borderwidth=5)
        self.window.title("Child window")
        self.window.minsize(300,200)
        inputframe = ttk.Frame(self.window, padding=10)
        inputframe.grid(row=0, column=0, sticky=(N, S, E, W))
        buttonframe = ttk.Frame(self.window, padding=10)
        buttonframe.grid(row=99, column=0, sticky=(E, W))
        ttk.Button(buttonframe, text="Close", command=self.window.destroy).grid(row=0, column=0)
```

Then, in `main.py`, we will change the  
```
form = ip.modal_window(root, data)
```
to 
```
form = ip.ModalWindow(root, data)
```

### Getting the results from the input form

We will set up a `result` variable in the modal window by inserting this line
at the beginning of the  the `__init__()` method:
```
        self.result = ""
```

Then we will add another method to `ModalWindow`, after the `__init__()`
method, a callback, to change the result to something else:
```
    def set_result(self):
        self.result = "something else" # too literal?
```

Finally, we will add a second button to call `set_result`, by adding this line
just below the "Close" button definition:
```
        ttk.Button(buttonframe, text="Set result", command=self.set_result).grid(row=0, column=1)
```

To see the result, all we need to do in main is add this statement after 
the `form = ` line:
```
print(form.result)
```

If we run it, it prints nothing but a blank line.  Why doesn't it work?
Because the input form is not _modal_.

### Make the ModalWindow modal

Seven commmands are required to make the window truly modal. Five of them
will be executed when the window is created, and two will be executed when
it is closed.

At the end of ModalWindow's `__init__()` method, after the `ttk.Button` 
definitions, add these five lines. You don't need to include the comments; 
the comments are included here by way of explanation.

```
        self.window.protocol("WM_DELETE_WINDOW", self.dismiss) # Intercept the close.
        self.window.transient(root)    # This window is related to root.
        self.window.wait_visibility()  # Wait for the window to appear ...
        self.window.grab_set()         # ... then grab all focus and input.
        self.window.wait_window()      # Block other windows until this one is destroyed.
```

Add another method to the class, called `dismiss()`. It includes the other
two lines that make a modal window:
```
    def dismiss(self):
        self.window.grab_release()  # Release focus and input
        self.window.destroy()       # Close the window
```

After `dismiss()` is executed, the ModalWindow object still exists, but its
window is gone. The `result` attribute still exists as well. It doesn't get
destroyed.

Finally, replace the `self.window.destroy` command in the "Close"
button definition with `self.dismiss`, to make sure the window is closed
properly:
```
        ttk.Button(buttonframe, text="Close", command=self.dismiss).grid(row=0, column=0)
```

The `WM_DELETE_WINDOW` intercept and the `ttk.Button` command ensure that 
the `dismiss()` callback will be used to exit the window, whether it is closed
using the "Close" button or the close icon in the upper-right corner.

## Make it your own

1. **Input**: You can define other classes or methods to act on the input
  data passed to the ModalWindow.
2. **Output**: You can define more than one result variable. We only defined
  one here for illustration purposes.

## References

On creating a class and getting information from it:
[Returning a value from a tkinter form](https://stackoverflow.com/questions/51832502/returning-a-value-from-a-tkinter-form)

On making the window a modal window: 
See the "Rolling Your Own" section of the [Windows and Dialogs](https://tkdocs.tutorial/windows.html)
documentation.

## Source code

main.py:
```
#! /usr/bin/python

from tkinter import *
from tkinter import ttk
import input_form as ip

# Set up the main window
root = Tk()
root.title("This is the main window")
root.minsize(300,200)
frame = ttk.Frame(root, padding=5)
frame.grid(row=0, column=0, sticky=(N, W, E, S))
ttk.Label(frame, text="Glorfindel the Mighty").grid(row=0, column=0)
# This is where we will insert the call to the child window
data = {"name": "Lancelot", "quest": "grail", "colour": "blue"}
form = ip.ModalWindow(root, data)
print(form.result)
# root.mainloop() is the mandatory last line in the main window script.
root.mainloop()
```

input_form.py:
```
#!/usr/bin/python 

from tkinter import *
from tkinter import ttk

class ModalWindow:
    def __init__(self, root, *args):
        self.result = ""
        self.window = Toplevel(root, borderwidth=5)
        self.window.title("Child window")
        self.window.minsize(300,200)
        inputframe = ttk.Frame(self.window, padding=10)
        inputframe.grid(row=0, column=0, sticky=(N, S, E, W))
        buttonframe = ttk.Frame(self.window, padding=10)
        buttonframe.grid(row=99, column=0, sticky=(E, W))
        ttk.Button(buttonframe, text="Close", command=self.dismiss).grid(row=0, column=0)
        ttk.Button(buttonframe, text="Set result", command=self.set_result).grid(row=0, column=1)
        self.window.protocol("WM_DELETE_WINDOW", self.dismiss) 
        self.window.transient(root)
        self.window.wait_visibility()
        self.window.grab_set()
        self.window.wait_window()

    def set_result(self):
        self.result = "something else"

    def dismiss(self):
        self.window.grab_release()
        self.window.destroy()
```


