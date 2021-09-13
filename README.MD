# SLHDR WRAPPER

This repository is C wrapper to use Interdigital SLHDR library.

## Help
```
Usage: configure [options]
Options: [defaults in brackets after descriptions]

Options:
  --help                   print this message
  --cxx=<compiler>         define used compiler[g++]

  --srcdir=DIR             path to slhdr library[]

  --prefix=PREFIX          install in PREFIX [/usr/local]
  --libdir=LIBDIR          install library in LIBDIR [PREFIX/lib]
  --incdir=DIR             install headers in DIR [PREFIX/include]
  --pkgdir=DIR             install pkg-config files in DIR [LIBDIR/pkgconfig]

  --suffix=SUFFIX          add suffix SUFFIX to generated library name []
```

## Build Step
`g++` in version 7 or higher is required to build this wrapper
```
./configure --srcdir=/absolute/path/to/slhdr/libs
make
make install
```

## Contributors
Wrapper written for OpenVVC decoder library by:
* Thomas AMESTOY
