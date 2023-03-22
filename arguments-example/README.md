# app-bundle-framework
(WIP) Distro-agnostic, easy, portable Linux App Bundles

## "Arguments" example
This example prints all received command-line arguments to the terminal

For instance:

`$ ./arguments "one argument" two arguments`

Will print:

```
./arguments
one argument
two
arguments
```

## Building and running

To **build & run** this example App Bundle:

`$ make`

`$ make app`

`$ bash ../runapp ./arguments.app`
