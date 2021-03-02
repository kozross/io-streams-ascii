# ``io-streams-ascii``

## What is this thing?

A small set of wrappers to allow ``io-streams`` to work with
[``text-ascii``](https://github.com/kozross/text-ascii).

## What are the goals of this project?

### Exception clarity

IO brings exceptions, and as they're explicit, it can often be hard to tell what
to handle where. We want clarity on this, and do the following to ensure it:

* The default API adds no exceptions of its own. If error conditions need to be
  handled, they are burned into the type system (such as by use of ``Either``).
* A dedicated module (`Exceptional`) contains all new exceptions, and any code
  using them.
* If any exceptions of our own are thrown by any function, we specify what they
  are in its documentation.

### Compatibility with the [`io-streams`](https://hackage.haskell.org/package/io-streams) API

We rely mostly on `io-streams` to do the heavy lifting, providing only wrappers
to use 'at the edges'. We don't aim to reimplement functionality that can be
easily done with `io-streams`, nor do we want to wrap it or become incompatible
with it in general.

### Discoverability, documentation and user-friendliness

In addition to documenting everything with Haddocks, we aim to clarify _every_
corner case. We care strongly about making this API easy to follow, learn and
understand.

### Low dependencies

We don't want to add too much to the mix. Other than `io-streams` and
`text-ascii` (and their transitive dependencies), we don't want anything extra.

## Why is there no cat stuff?

One cannot always be a Haskell catboy.

## What does this run on?

Currently, our CI checks the following versions of GHC:

* 8.6.5
* 8.8.4
* 8.10.4
* 9.0.1

We check on the following platforms:

* Windows
* Linux
* MacOS

## What can I do with this?

The project is licensed Apache 2.0 (SPDX code
[`Apache-2.0`](https://spdx.org/licenses/Apache-2.0.html)). For more details,
please see the `LICENSE.md` file.
