# Creating a Go program

## Choose a module path.
```
$ mkdir hello
$ cd hello
$ go mod init example.com/user/hello
go: creating new go.mod: module example.com/user/hello
$cat go.mod
module example.com/usr/hello

go 1.13
```
## Write the first file.
```
vi hello.go
# contents of the file:
package main

import "fmt"

func main() {
    fmt.Println("Hello from Go\n")
}
```

**NOTES:**
1. The first statement in a Go source file must be `package <name>` .
  Executable commands must always use `package main`.
2. The import statement works as you would expect. You can import
  one module per line, or multiple modules like this:
```
import {
    "fmt"
    "math"
    "sparkplug"
}
```

## Build and install it.
```
go install example.com/user/hello
```

The binary is installed in $HOME/go/bin/hello . If go/bin is in your
PATH variable, then you can just type `hello` to execute it.

Possible shortcuts to that long version of `go install` :
```
go install .    ### That's a dot, meaning 'current directory'
# or
go install      ### no dot
```

## Here's a bash command for adding the install directory to your PATH:
```
$ export PATH=$PATH:$(dirname $(go list -f '{{.Target}}' .))
```

## Run the program

If go/bin is in your PATH, then you can just type the name of the program,
from any directory, to execute the program.
```
$ hello
Hello from go
```

That means that `type -a <programname>` should also work.

## Check in to Git

Make sure that the file `go.mod` is included in the files you commit to Git.
