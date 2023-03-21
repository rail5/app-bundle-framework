# app-bundle-framework
(WIP) Distro-agnostic, easy, portable *nix App Bundles

## Goals
The goal is to make universal (distro-agnostic) Linux app deployment as easy as:

`$ makeapp binary-name`

App Bundles include all necessary binaries & shared libraries to run. Running them ought to be as simple as:

`$ runapp program.app`

This is still very much a work-in-progress, and is not anywhere near production-ready (although the current makeapp & runapp scripts **are** usable for basic command-line apps in their current state)
