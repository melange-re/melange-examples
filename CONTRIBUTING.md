# Contributing an example

## Creating a new folder under `examples`

To start working on your example, create a new folder under `examples` with the
next number in the sequence + identifying name, e.g. `8-tailwind`.

Each example should be self-contained, meaning users should be able to copy the
folder and have everything needed to start working.

So all examples should contain at least these files:
- `.gitignore`
- opam file
- `Makefile`
- `README.md`
- `dune-project` and `dune`

If the example uses JavaScript packages, include `package.json` as well (plus
lockfile).

The best approach is probably to take one of the existing examples folders, copy
it, and proceed from there.

## Working across examples

The `melange-examples` project is configured in a way that each project can be
built as if it was on its own. That's why `dune-project` files are included on
each project.

As there is no `dune-project` at the top level, the Dune root (more info in the
Dune ["Finding the
root"](https://dune.readthedocs.io/en/latest/usage.html#finding-the-root) docs)
is on each example folder, and so `dune` has to be called from there.

To be able to orchestrate builds and tests across all examples, a series of
Makefiles are included with some structure:
- `install`: commands needed to install deps. Generally it will be `opam
  install`, plus `npm install` if the project requires any JavaScript packages
- `build`: commands needed to build the example. Generally it will be at least
  `dune build` plus any other scripts
- `test`: commands to test the project

## Adding tests

It is recommended to include some tests for your example. See some inspiration
in the `1-node` example [dune file](./examples/1-node/src/dune), which includes
a rule with alias `runtest`. For simple cases, the test can be just running the
application, or making sure all bundling works.

## Updating `melange-examples.opam` and `Makefile`

When adding an example, remember to:

- add it to the main `melange-examples.opam`
- add it to the main `Makefile`'s `install`, `build` and `test` commands

so that it gets built and tested in CI.
