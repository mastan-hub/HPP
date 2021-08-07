CC = gcc
LD = gcc
CFLAGS = -O3
LDFLAGS = 
RM = /bin/rm -f
OBJS = alloc_all_mem.o
EXECUTABLE = alloc_all_mem

all:$(EXECUTABLE)

$(EXECUTABLE): $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) -o $(EXECUTABLE)

alloc_all_mem.o: alloc_all_mem.c
	$(CC) $(CFLAGS) -c alloc_all_mem.c

clean:
	$(RM) $(EXECUTABLE) $(OBJS)
