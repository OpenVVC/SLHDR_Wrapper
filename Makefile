include config.mak

CFLAGS_AVX2:=$(CFLAGS) -I$(AVX_INCDIR)
CFLAGS_SSE:=$(CFLAGS) -I$(SSE_INCDIR)

LD_FLAGS_AVX2:=$(AVX2_LD_PATH) $(AVX2_LD_FLAGS)
LD_FLAGS_SSE:=$(SSE_LD_PATH) $(SSE_LD_FLAGS)

INSTALL=cp -p
MKDIR=mkdir -p
LN=ln -sf

all: pp_slhdr_sse.so pp_slhdr_avx2.so

pp_slhdr_sse.so: pp_wrapper_slhdr_sse.o
	$(CC) -shared $^ -o $@ $(LD_FLAGS_SSE)

pp_slhdr_avx2.so: pp_wrapper_slhdr_avx2.o
	$(CC) -shared $^ -o $@ $(LD_FLAGS_AVX2)

%_sse.o: %.cpp
	$(CXX) -std=c++11 -c $< -o $@ -MMD -MF $(@:.o=.d) -MT $@ $(CFLAGS_SSE)

%_avx2.o: %.cpp
	$(CXX) -std=c++11 -c $< -o $@ -MMD -MF $(@:.o=.d) -MT $@ $(CFLAGS_AVX2)

install: install_headers install_lib

install_headers: pp_wrapper_slhdr.h
	$(MKDIR) $(INCDIR)
	$(INSTALL) $< $(INCDIR)/

install_lib: pp_slhdr_avx2.so
	$(MKDIR) $(LIBDIR)
	$(INSTALL) $< $(LIBDIR)/
	$(LN) $< $(LIBDIR)/lib_cwrap.so

clean:
	$(RM) *.so *.o *.d
