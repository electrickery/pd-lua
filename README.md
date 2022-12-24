pdlua -- a Lua embedding for Pd
Copyright (C) 2007,2008,2009,2013 Claude Heiland-Allen <claude@mathr.co.uk>
Copyright (C) 2012 Martin Peach martin.peach@sympatico.ca

# LICENSE

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

## Maintainers notes

NOTE by fjkraan: This is a fork of aggraef's pdlua, with a pd-lib-builder 
build system for Deken distribution. Other minor edits are expected to 
make the library behave betetr in a Vanilla/Deken environment. The chapters 
from 'Compilation Instructions' on are obsolete. The origin for this fork is: 
https://github.com/electrickery/pd-lua

NOTES by aggraef: Since the contents of the original README has become rather
outdated, I've updated the information below.

# PDlua

pdlua works with all Pd flavors out there and makes Pd external programming
incredibly easy (please check the included examples and the tutorial in the
corresponding subdirectories). Originally written by Claude Heiland-Allen,
pdlua has gone through the hands of a few people over the years, including
mrpeach (maintainer since 2011), zmoelnig a.k.a. umlaeute (loader update,
Debian package), and myself (Arch package, Lua 5.3 support, tutorial). Please
also check my brief account on the history of pd-lua below.

Lua 5.3 is highly recommended with the latest version, Lua 5.4 should work as
well. Lua 5.2 probably still works, too, but this hasn't been tested
recently. Even older Lua versions are completely untested and unsupported at
this point - use at your own risk.

If you haven't used pdlua before, please make sure to check the included
tutorial first. See:

https://agraef.github.io/pd-lua/tutorial/pd-lua-intro.html

This contains a fairly gentle introduction to pdlua, walks you through the
creation of a basic example, and then goes on to cover all major features of
pdlua, including the special facilities for tables, clocks, receivers, and
live-coding, in quite some detail. This will be helpful when embarking on your
own projects, or trying to make sense of the included examples.


## History and Credits:

pdlua was originally written by Claude Heiland-Allen, with contributions by
Frank Barknecht and Martin Peach, according to the original source.

Claude's repository is still online at https://code.mathr.co.uk/pdlua; please
also check Claude's website at https://mathr.co.uk/, and
https://mathr.co.uk/blog/lua.html for Lua-related content on his blog
(including pdlua's original announcement).

Martin Peach took over maintenance of pdlua in 2011, you can find that part of
the history in Pd's old svn repository at SourceForge, including IOhannes
Zmölnig's loader update for Pd 0.47. See
https://sourceforge.net/p/pure-data/svn/HEAD/tree/trunk/externals/loaders/pdlua/

The present source is a fork of umlaeute's repository at
https://anonscm.debian.org/git/pkg-multimedia/pd-lua.git, from which the
official Debian packages are built. This in turn is apparently based on the
0.7.3 version of pdlua in Pd's svn repository.


Compilation Instructions:

The source should compile out of the box on (at least) Linux, macOS and
Windows, just make sure that you have Lua and Pd installed and run `make`.
Ready-to-use binaries for the older Lua 5.1 and 5.2 versions are available
from Deken and as a Debian package, respectively. The latest (Lua 5.3)
binaries are on https://github.com/agraef/pd-lua.

If you want/need to compile from source, the following details the
requirements for the three most popular platforms.

Linux:

Both Lua 5.3 and Pd should be available in your package repositories, if not
then they're easy to install from source, cf. https://www.lua.org/download.html
and http://msp.ucsd.edu/software.html.

macOS/OS X:

Lua 5.3 is available in Homebrew (https://brew.sh/) and MacPorts
(https://www.macports.org/), but it's also easy to install from source once
you have XCode up and running. As distributed, the build requires that you
have the Pd header files somewhere under /Applications/Pd-*/Contents
/Resources/include (which should be the case if you're running a recent Pd
distribution by MSP); otherwise you may have to set the `PD_INCLUDE` make
variable accordingly.

Windows:

Compilation is a breeze using mingw (either the old one at http://mingw.org/
or the new msys2-based installation at http://www.msys2.org/). The Lua that
ships with msys2 is still 5.2 at the time of this writing, so you'll want to
compile Lua 5.3 from source and install it in the mingw environment using
`make install`. The build also assumes that you have a recent Pd installation
as distributed by MSP, please check the comments in the mingw section of the
Makefile for details. This is necessary so that the header files and pd.dll
are found during compilation and linkage, respectively.

Installation:

After a successful compile, you can go about installing the external with the
usual `make install` (which copies the external to its own directory named
pdlua). This should generally do something sensible on each of the supported
platforms. Note that the installation may require root privileges.

Linux: By default, installation goes into /usr/local/lib/pd/extra, which
should be one of the directories on Pd's search path.

macOS/OS X: Installation goes into ~/Library/Pd by default. Move the pdlua
folder to /Library/Pd for a system-wide installation.

Windows/mingw: Installation goes into the extra subdirectory of your Pd
installation, so it will be available to all users by default.

It's generally advisable to do a staged install using `DESTDIR` first so that
you can review the installation directory layout beforehand and adjust it if
needed. To these ends, run `make install`, e.g., as follows:

    make install DESTDIR=$PWD/BUILD

This will leave the installed external in a folder BUILD inside the current
directory from where you can move the pdlua subdirectory to any location on
Pd's library search path that you see fit.

Finally, having finished installation, to enable pd-lua in Pd just add `pdlua`
to your startup libraries (after adding its parent directory to Pd's search
path if necessary) and you should be set.
