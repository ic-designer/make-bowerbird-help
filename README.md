# Bowerbird Help Tools

[![Makefile CI](https://github.com/ic-designer/make-bowerbird-help/actions/workflows/makefile.yml/badge.svg)](https://github.com/ic-designer/make-bowerbird-help/actions/workflows/makefile.yml)

Creates a `help` target that will list specified targets alongside a user defined
description. An example output for when `make help` is ran on this repo is provide
below.

```console
$ make help
Available targets:
   check                   Runs the repository tests
   clean                   Deletes all files created by Make
   help                    Provides this help message
   test                    Runs the repository tests
```

Targets are automatically added returned by `make help` when a help tag is created. The
snippet below describes the necessary syntax used to create help tags. Refer to the
`Makefile` in this repo as a further example of help tags.


```
## <description>
<target-name>: [prerequisites | variable declarations]
```

Tags must meet the following requirements:
- Help tags must be declared on the line immediately preceding the target declaration.
- The help tag must use the prefix '`## `'. (Note the required space)
