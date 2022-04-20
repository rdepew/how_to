# Queue time variables in Azure pipelines

## How your pipeline sees it

Your pipeline sees a queue time variable the same way as any other
global variable that you define in the `variables:` section of your YAML file.

## One-time only

This isn't a very useful feature, except during early development and 
debugging.

1. Navigate to the appropriate pipeline on ADO. (For example, go to 
  `https://dev.azure.com/AUTOSOLN/QA/_build` and select a pipeline.)
2. Select RUN PIPELINE in the upper right corner.
3. Select the branch/tag or enter the commit ID as usual.
4. Under _Advanced options_, select Variables.
5. Select ADD VARIABLE in the lower right corner.
6. "Name" is the variable name you will use in your pipeline. "Value" is 
  the value you want to assign to the variable.
7. Select CREATE in the lower right corner. Now you must hit the left-arrow
  at the top of the Variables menu, NOT the X, to return to the RUN PIPELINE
  menu. 
8. Select RUN to run the pipeline.



## Forever

This is more useful, and "how to do it" is documented, but "how to get to
where you can do it" is _not_ so well documented.

Two warnings:
1. You have to do it from the graphical pipeline editor. You cannot make
  it happen by editing anything in your YAML file.
2. It's saved in the Azure DevOps pipeline, permanently, and for all branches.
  You will not commit it and push it to Git. It doesn't work that way.

Okay, here's how to do it.
1. Navigate to the appropriate pipeline on ADO. (For example, go to 
  `https://dev.azure.com/AUTOSOLN/QA/_build` and select a pipeline.)
2. In the upper right corner, select EDIT instead of RUN PIPELINE.
3. Now your pipeline is displayed in an editing window. Don't mess with it.
  Instead, select VARIABLES in the upper right corner.
4. Select the `+` to create a new variable. "Name" is the variable name you
  will use in your pipeline. "Value" is the default value. You can leave it 
  blank if you want. 
5. The two checkboxes are really important.
  a. Enable "Keep this value secret" if the variable is a password, or 
    or something you don't want recorded anywhere in plaintext.
  b. ALWAYS enable "Let users override this value when running this pipeline."
    This means that users can (or must) review and edit this value when 
    running the pipeline.
  c. I believe that the API and the CLI have provisions for editing the 
    variable value when running the pipeline.

That's it. When a user runs the pipeline as described above in section 
"One-time only", the variable will already be defined. Under 
_Advanced options_, the user must select the variable, edit it, and select 
UPDATE in order to change the value before running the pipeline.

