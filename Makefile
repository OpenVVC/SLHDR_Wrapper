include config.mak

SLHDR_INC_SSE:=$(SSE_FOLDER)/include
LD_FLAGS_SSE+=$(SSE_FOLDER)/lib/libSLHDRPostprocessor.so
LD_FLAGS_SSE+=$(SSE_FOLDER)/lib/libSLHDRCommon.so

SLHDR_INC_AVX2:=$(AVX2_FOLDER)/include
LD_FLAGS_AVX2+=$(AVX2_FOLDER)/lib/libSLHDRPostprocessor.so
LD_FLAGS_AVX2+=$(AVX2_FOLDER)/lib/libSLHDRCommon.so


all: pp_slhdr_sse.so pp_slhdr_avx2.so

pp_slhdr_sse.so: pp_wrapper_slhdr_sse.o
	$(CC) -shared $^ -o $@ $(LD_FLAGS_SSE) $(LD_FLAGS)

pp_slhdr_avx2.so: pp_wrapper_slhdr_avx2.o
	$(CC) -shared $^ -o $@ $(LD_FLAGS_AVX2) $(LD_FLAGS)

%_sse.o: %.cpp
	$(CXX) -std=c++11 -c $< -o $@ -MMD -MF $(@:.o=.d) -MT $@ $(CFLAGS) $(CFLAGS_SSE) -I$(SLHDR_INC_SSE)

%_avx2.o: %.cpp
	$(CXX) -std=c++11 -c $< -o $@ -MMD -MF $(@:.o=.d) -MT $@ $(CFLAGS) $(CFLAGS_AVX2) -I$(SLHDR_INC_AVX2)

clean:
	$(RM) *.so *.o *.d
