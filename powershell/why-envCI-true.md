# Why you might need `env:CI="true"` in your script

If you're going to be using the JFrog CLI in your script, then the first 
executable line in your script should be
```
$env:CI="true"
```

Copy and paste that line.

Without that line, your JSON data is prefaced by this prompt:

```
To avoid this message in the future, set the CI environment variable to true. The CLI commands require the
URL and authentication details Configuring JFrog CLI with these parameters now will save you having to
include them as command options. You can also configure these parameters later using the 'jfrog c' command.
Configure now? (y/n) [n]?
```

... which is just fine if you're working interactively, but in a script it 
really SUCKS.
