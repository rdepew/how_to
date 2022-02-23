# How to find disk usage in Windows 10

Windows 10 doens't have the handy `du` and `dh` commands like Linux has.

Well, that's not exactly true. PowerShell has both `du` and `dh`, but
they're not as handy or useful or functional as the Linux versions.

Windows can do it, though. It's built into Settings.

From the Start menu, choose Settings (the gear icon in the lower left),
then System, then Storage.

You may have to click on the disk you want to examine, like
"Local Disk (C:)".

If it only shows you "Temporary Files", then click the "show other 
options" link just below "Temporary Files".

You should see a list of categories like:
* System & reserved
* Apps & games
* Documents
* Pictures
* and so on ...

... each accompanied by a bar graph showing relative usage of each
category. 

Click on the category to drill down deeper into the folder(s) in that
category.

