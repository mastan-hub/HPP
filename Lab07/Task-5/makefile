CC = gcc
LD = gcc
CFLAGS = -g -O1
LDFLAGS = 
RM = /bin/rm -f
OBJS = main.o funcs.o
EXECUTABLE = stacktest

all:$(EXECUTABLE)

$(EXECUTABLE): $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) -o $(EXECUTABLE)

funcs.o: funcs.h funcs.c
	$(CC) $(CFLAGS) -c funcs.c

main.o: main.c funcs.h
	$(CC) $(CFLAGS) -c main.c 

clean:
	$(RM) $(EXECUTABLE) $(OBJS)
