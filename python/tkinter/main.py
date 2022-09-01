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

