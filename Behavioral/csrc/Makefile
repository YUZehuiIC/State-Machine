# Makefile generated by VCS to build your model
# This file may be modified; VCS will not overwrite it unless -Mupdate is used

# define default verilog source directory 
VSRC=..

# Override TARGET_ARCH
TARGET_ARCH=

# Choose name of executable 
PRODUCTBASE=$(VSRC)/simv

PRODUCT=$(PRODUCTBASE)

# Product timestamp file. If product is newer than this one,
# we will also re-link the product.
PRODUCT_TIMESTAMP=product_timestamp

# Path to runtime library
DEPLIBS=
VCSUCLI=/net/numnum2/silo3/synopsys/vJ-2014/vcs/I-2014.03-SP1/linux/lib/libvcsucli.so
RUNTIME=/net/numnum2/silo3/synopsys/vJ-2014/vcs/I-2014.03-SP1/linux/lib/libvcsnew.so /net/numnum2/silo3/synopsys/vJ-2014/vcs/I-2014.03-SP1/linux/lib/libuclinative.so $(DEPLIBS) 

VCS_SAVE_RESTORE_OBJ=/net/numnum2/silo3/synopsys/vJ-2014/vcs/I-2014.03-SP1/linux/lib/vcs_save_restore_new.o

# Select your favorite compiler

# Linux:
VCS_CC=gcc

# User overrode default CC: 
VCS_CC=gcc
# Loader
LD=g++

# Strip Flags for target product
STRIPFLAGS= 
# Loader Flags
LDFLAGS= -m32 -m32 
# Picarchive Flags
PICLDFLAGS=-Wl,-rpath-link=./ -Wl,-rpath='$$ORIGIN'/simv.daidir/ -Wl,-rpath='$$ORIGIN'/simv.daidir//scsim.db.dir 

# C run time startup
CRT0=
# C run time startup
CRTN=
# Machine specific libraries
SYSLIBS=/net/numnum2/silo3/synopsys/vJ-2014/vcs/I-2014.03-SP1/linux/lib/ctype-stubs_32.a -ldl -lm  -lc -lpthread -ldl

# Default defines
SHELL=/bin/sh

VCSTMPSPECARG=
VCSTMPSPECENV=
# NOTE: if you have little space in /tmp, but plenty in /foo,
#and you are using gcc, uncomment the next line
#VCSTMPSPECENV=SNPS_VCS_TMPDIR=/foo

TMPSPECARG=$(VCSTMPSPECARG)
TMPSPECENV=$(VCSTMPSPECENV)
CC=$(TMPSPECENV) $(VCS_CC) $(TMPSPECARG)

# C flags for compilation
CFLAGS=-w  -pipe -m32 -fPIC -O -I/net/numnum2/silo3/synopsys/vJ-2014/vcs/I-2014.03-SP1/include   

# Partial linking
LD_PARTIAL=ld -r -m elf_i386 -o
ASFLAGS=--32
LIBS=/net/numnum2/silo3/synopsys/vJ-2014/vcs/I-2014.03-SP1/linux/lib/libzerosoft_rt_stubs.so /net/numnum2/silo3/synopsys/vJ-2014/vcs/I-2014.03-SP1/linux/lib/libvirsim.so /net/numnum2/silo3/synopsys/vJ-2014/vcs/I-2014.03-SP1/linux/lib/librterrorinf.so /net/numnum2/silo3/synopsys/vJ-2014/vcs/I-2014.03-SP1/linux/lib/libsnpsmalloc.so 
# Note: if make gives you errors about include, either get gmake, or
# replace the following line with the contents of the file filelist,
# EACH TIME IT CHANGES
# included file defines OBJS, and is automatically generated by vcs
include filelist

OBJS=$(VLOG_OBJS)  $(SYSC_OBJS)   $(VHDL_OBJS) 

product : $(PRODUCT_TIMESTAMP)
	@echo $(PRODUCT) up to date

objects : $(OBJS) $(DPI_STUB_OBJS) $(PLI_STUB_OBJS) 

clean   :
	rm -f $(VCS_OBJS)

clobber : clean
	rm -f $(PRODUCT) $(PRODUCT_TIMESTAMP) 

picclean :
	rm -f _csrc*.so linux_scvhdl_*.so pre_vcsobj_*.so share_vcsobj_*.so

$(PRODUCT_TIMESTAMP) : $(PRODUCT)
	-if [ -x $(PRODUCT) ]; then chmod -x $(PRODUCT); fi
	$(LD) $(CRT0) -o $(PRODUCT) $(STRIPFLAGS) $(LDFLAGS) $(PCLDFLAGS) $(PICLDFLAGS) $(OBJS)  $(LIBS)   $(RUNTIME) -Wl,-whole-archive $(VCSUCLI) -Wl,-no-whole-archive     $(LINK_TB) $(DPI_STUB_OBJS) $(PLI_STUB_OBJS)   $(VCS_SAVE_RESTORE_OBJ) $(SYSLIBS) $(CRTN)
	@touch $(PRODUCT_TIMESTAMP)

$(PRODUCT) :  picclean  $(LD_VERSION_CHECK)  $(OBJS) $(DOTLIBS) $(DPI_STUB_OBJS) $(PLI_STUB_OBJS) $(CMODLIB) $(RUNTIME)  $(VCSUCLI)  $(VCS_SAVE_RESTORE_OBJ) 
	@touch $(PRODUCT)

