CC = gcc
LD = gcc
CFLAGS = -O3 -Wall -fopenmp -pthread
LDFLAGS = 
RM = /bin/rm -f
BIN = sparsemult matmult generator

all:$(BIN)

# ls: LS.c
# 	$(CC) $(CFLAGS) -o $@ $< $(LIBS)

# ls2: LS2.c
# 	$(CC) $(CFLAGS) -o $@ $< $(LIBS)

sparsemult: sparsemult.c
	$(CC) $(CFLAGS) -o $@ $< $(LIBS)

matmult: matmult.c
	$(CC) $(CFLAGS) -o $@ $< $(LIBS)

generator: generator.c
	$(CC) $(CFLAGS) -o $@ $< $(LIBS)

clean:
	$(RM) $(BIN)

















# CC = gcc
# LD = gcc
# CFLAGS = -O3 -Wall -fopenmp -pthread
# LDFLAGS = 
# RM = /bin/rm -f
# OBJS = main1.c
# EXECUTABLE = exfile

# all:$(EXECUTABLE)

# $(EXECUTABLE): $(OBJS)
# 	$(CC) $(CFLAGS) -o $(EXECUTABLE) $(OBJS)

# clean:
# 	$(RM) $(EXECUTABLE)