# Go code organization

A Go repository contains one or more modules, but typically just one.

A module is a collection of related Go packages that are released
together. A file named `go.mod` declares the module path: the
import path prefix for all packages within the module.

A package is a colletion of source files in the same directory that are
compiled together. Functions, types, variables, and constants defined in one
source file are visible to all otehr source files within the same package.

