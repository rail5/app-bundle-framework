# app-bundle-framework
(WIP) Distro-agnostic, easy, portable Linux App Bundles

## Goals
The goal is to make universal (distro-agnostic) Linux app deployment as easy as:

`$ makeapp binary-name`

App Bundles include all necessary binaries & shared libraries to run. Running them ought to be as simple as:

`$ runapp program.app`

This is still a work-in-progress, and is not fully production-ready yet. Currently, this is perfectly usable for basic command-line apps (see 'helloworld-example' and 'arguments-example')

--

Try making an App Bundle of a program on your computer! For example:

`$ makeapp /usr/bin/htop`

Will (if you have 'htop' installed) make a bundle in the *current working directory* called **htop.app**. This App Bundle can then be shipped to any other Linux system, on its own, and run with:

`$ runapp /location/of/htop.app`

## Structure

The App Bundle structure is as follows:

  - Root directory (**some-program.app**)
    - **bin/**: subdirectory containing binaries
    - **libs/**: subdirectory containing shared libraries
    - **resources/**: subdirectory containing icons etc
    - **appinfo**: XML manifest containing the information needed to run the app (App name, main binary, icon, etc)

See 'bundle-structure-example.app' for an example App Bundle (or run `$ make app` on one of the other examples to see what is created)

## Requirements

'makeapp' requires **patchelf** in order to ship your App Bundle with *libc* (or other interpreter) in the libs/ subdirectory. By doing this, we can ensure that App Bundles will run on systems with other versions of *libc* etc.

On Debian-based systems, patchelf can be installed with:

`# apt install patchelf`
