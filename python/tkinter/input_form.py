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
        self.result = "something"

    def dismiss(self):
        self.window.grab_release()
        self.window.destroy()

