include config.mak

CFLAGS:=$(CFLAGS) -I$(SRC_INCDIR)
LD_FLAGS:=$(LD_PATH) $(LD_FLAGS)

SRCS:=$(wildcard *.cpp)

.PHONY: install clean all

all: pp_slhdr$(SUFFIX).so

pp_slhdr$(SUFFIX).so: pp_wrapper_slhdr.o
	$(CC) -shared $^ -o $@ $(LD_FLAGS)

%.o: %.cpp %.d | $(DEPFILES)
	$(CXX) -std=c++11 -c $< -o $@ -MMD -MF $(@:.o=.d) -MT $@ $(CFLAGS)


DEPFILES := $(SRCS:%.cpp=%.d)

$(DEPFILES): ;

include $(wildcard $(DEPFILES))

slhdr_cwrap.pc:
	./genpkgcfg.sh

install: install_headers install_lib install_pkgcfg

install_headers: pp_wrapper_slhdr.h
	$(MKDIR) $(INCDIR)
	$(INSTALL) $< $(INCDIR)/

install_lib: pp_slhdr$(SUFFIX).so
	$(MKDIR) $(LIBDIR)
	$(INSTALL) $< $(LIBDIR)/
	$(LN) $< $(LIBDIR)/libslhdr_cwrap.so

install_pkgcfg: slhdr_cwrap.pc
	$(MKDIR) $(PKGDIR)
	$(INSTALL) $< $(PKGDIR)/

clean:
	$(RM) *.so *.o *.d *.pc
