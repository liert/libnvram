CC = arm-linux-gnueabi-gcc
# CC = arm-linux-gnueabihf-gcc

# x86
CFLAGS=-O2 -fPIC -Wall -U_FILE_OFFSET_BITS -U_TIME_BITS -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=softfp
# x64
# CFLAGS=-O2 -fPIC -Wall # -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=softfp
LDFLAGS=-shared -nostdlib

OBJECTS=$(SOURCES:.c=.o)
SOURCES=nvram.c
TARGET=libnvram.so

all: $(SOURCES) $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.c.o:
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -f *.o libnvram.so test

.PHONY: clean
