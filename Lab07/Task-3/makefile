CC = gcc
LD = gcc
CFLAGS = -g -O3 -Wall
LDFLAGS = 
RM = /bin/rm -f
OBJS = main.o buttonread.o
EXECUTABLE = buttons

all:$(EXECUTABLE)

$(EXECUTABLE): $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) -o $(EXECUTABLE)

buttonread.o: buttonread.h buttonread.c
	$(CC) $(CFLAGS) -c buttonread.c

main.o: main.c buttonread.h
	$(CC) $(CFLAGS) -c main.c 

clean:
	$(RM) $(EXECUTABLE) $(OBJS)
