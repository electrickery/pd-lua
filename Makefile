# Makefile.pdlua for Makefile.pdlibbuilder. 
# 

lib.name = pdlua

UNAME := $(shell uname -s)

ifeq ($(UNAME),Darwin)
  ldlibs = -framework Lua
endif

ifeq ($(UNAME),Linux)
  ldlibs = -llua5.3
  cflags = -I/usr/include/lua5.3 -std=c99 -DHASHTABLE_COPY_KEYS
endif

ifeq (MINGW,$(findstring MINGW,$(UNAME)))
  ldlibs = -llua53 "$(LIBRARY_NAME).def"
  cflags = /usr/include/lua -std=c99 -DHASHTABLE_COPY_KEYS
endif

uname := $(shell uname -s)
ifeq (MINGW,$(findstring MINGW,$(uname)))
  ldlibs = -lwsock32 -lpthread
endif

pdlua.class.sources = pdlua.c  

datadirs = examples doc tutorial tutorial/examples

datafiles = \
COPYING \
hello.lua \
hello.pd_lua \
hello.pd_luax \
hello-help.pd \
README \
pd.lua \
pdlua-help.pd \
pdlua-meta.pd \
pdluax-help.pd

# pthreadGC2.dll is required for Windows installation. It can be found in
# the MinGW directory (usually C:\MinGW\bin) directory and should be 
# copied to the current directory before installation or packaging.
ifeq (MINGW,$(findstring MINGW,$(uname)))
  datafiles += pthreadGC2.dll
endif

PDLIBBUILDER_DIR=pd-lib-builder/
include $(PDLIBBUILDER_DIR)/Makefile.pdlibbuilder
