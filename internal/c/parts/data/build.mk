
MINIZ_SRCS := miniz.c

MODP_B64_SRCS := modp_b64.cpp

DATA_PROCESSING_SRCS := \
	checksum.cpp \
	compression.cpp \
	encoding.cpp \
	hashing.cpp

MINIZ_OBJS := $(patsubst %.c,$(PATH_INTERNAL_C)/parts/data/%.o,$(MINIZ_SRCS))

MODP_B64_OBJS := $(patsubst %.cpp,$(PATH_INTERNAL_C)/parts/data/%.o,$(MODP_B64_SRCS))

DATA_PROCESSING_OBJS := $(patsubst %.cpp,$(PATH_INTERNAL_C)/parts/data/%.o,$(DATA_PROCESSING_SRCS))

$(PATH_INTERNAL_C)/parts/data/%.o: $(PATH_INTERNAL_C)/parts/data/%.c
	$(CC) -O3 $(CFLAGS) -DDEPENDENCY_CONSOLE_ONLY -DMINIZ_NO_STDIO -DMINIZ_NO_TIME -DMINIZ_NO_ARCHIVE_APIS -DMINIZ_NO_ARCHIVE_WRITING_APIS -Wall $< -c -o $@

$(PATH_INTERNAL_C)/parts/data/%.o: $(PATH_INTERNAL_C)/parts/data/%.cpp
	$(CXX) -O3 $(CXXFLAGS) -DDEPENDENCY_CONSOLE_ONLY -Wall $< -c -o $@

DATA_PROCESSING_LIB := $(PATH_INTERNAL_C)/parts/data/data_processing.a

$(DATA_PROCESSING_LIB): $(MINIZ_OBJS) $(MODP_B64_OBJS) $(DATA_PROCESSING_OBJS)
	$(AR) rcs $@ $(MINIZ_OBJS) $(MODP_B64_OBJS) $(DATA_PROCESSING_OBJS)

CLEAN_LIST += $(DATA_PROCESSING_LIB) $(MINIZ_OBJS) $(MODP_B64_OBJS) $(DATA_PROCESSING_OBJS)
