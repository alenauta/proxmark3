CC = gcc
LD = gcc
CFLAGS = -std=c99 -Wall -O3 -c
LDFLAGS =

OBJS = crypto1.o crapto1.o
HEADERS = crapto1.h
EXES = nonce2key
WINEXES = nonce2key.exe

all: $(OBJS) $(EXES)

%.o : %.c
	$(CC) $(CFLAGS) -o $@ $<

% : %.c
	$(LD) $(LDFLAGS) -o $@ $(OBJS) $<

clean: 
	rm -f $(OBJS) $(EXES) $(WINEXES)
