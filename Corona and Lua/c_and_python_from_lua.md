# Calling C and Python and Java functions from Lu\

## Calling C functions from Lua

* DuckDuckGo search results:
  https://duckduckgo.com/?q=calling+c+functions+in+lua&t=ffab&atb=v145-1&ia=web
* The official doc: https://www.lua.org/pil/26.html
* Another official doc, but older:
  https://www.lua.org/manual/2.1/subsection3_5_5.html
  and
  https://www.lua.org/manual/2.1/subsection3_7_5.html#exCFunction
* This is C++, but it's VERY practical and may help:
  http://gamedevgeek.com/tutorials/calling-c-functions-from-lua/ 
* **HERE'S A FANTASTIC TUTORIAL SERIES ON YOUTUBE.** Especially pay 
  attention to tuts 23 through 28. Well, the link doesn't work. 
  Go to **YouTube**, search for "KarmaKilledtheCat", and click on the 
  "Lua Tutorials" link.
* This one contains good advice and a practical example. 
  https://chsasank.github.io/lua-c-wrapping.html
* This university tutorial has a section called "Calling C/C++ funtions
  from Lua". Note that their example uses the `lua_tonumber()` function,
  which can cause segmentation faults if there's a problem with the 
  arguments. The **chasank** reference above suggests using the
  `lua_checknumber()` function instead. **This might be the most useful
  reference.
* This short article doesn't have anything practical, but it gives a strong
  justification for writing Lua stuff in C.
  https://www.slant.co/versus/112/1418/~java_vs_lua

DuckDuckGo didn't find this one. From an awesome advanced tutorial on
Lua, this is a section on Lua and C.
* https://riptutorial.com/lua/topic/671/introduction-to-lua-c-api

## Calling Python functions from Lua

For the purposes of my Corona project, I'm not sure this buys me anything,
unless there's an Android-compatible Python that I'm not aware of. I'll
ruminate on that in the next section.

* DuckDuckGo search results:
  https://duckduckgo.com/?q=calling+python+functions+from+lua&t=ffab&atb=v145-1&ia=web
* According to [this link on StackOverflow](https://stackoverflow.com/questions/20400390/how-to-call-a-python-function-from-lua)
  there are two Python(?) libraries that support this. One is called 
  [lunatic-python](https://github.com/bastibe/lunatic-python)
  and the other is called [lupa](https://pypi.org/project/lupa/).
  Lupa seems fresher.

## Python on Android

Hmm. This is something I hadn't even considered.

* DuckDuckGo search results:
  https://duckduckgo.com/?q=python+on+android&t=ffab&atb=v145-1&ia=web
* One of the first hits on that page is 
  [this 2017 article](https://www.androidauthority.com/an-introduction-to-python-on-android-759685/), 
  talking about **QPython**, **sl4a**, and **Kivy**, a toolchain that lets you
  go all the way to deploying a Python app as an APK on an Android device.  In
  the conclusion, he says that "Python isn't ideal for developing professional
  apps but it's a great way to create scripts and tools for your own use."
  Maybe it's better to stick with Lua and Corona.
* [This StackOverflow post](https://stackoverflow.com/questions/101754/is-there-a-way-to-run-python-on-android)
  has a strong endorsement of **Kivy**, and also favorably mentions 
  **QPython** and **sl4a**. 
* Ditto [this article on Medium](https://medium.com/@umerfarooq_26378/tools-to-run-python-on-android-9060663972b4). _x

## Calling Java functions from Lua

Short version: Don't. It can't be done.

* DuckDuckGo search results:
  https://duckduckgo.com/?q=calling+java+functions+from+lua&t=ffab&atb=v145-1&ia=web

