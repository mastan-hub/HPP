FLAGS = -lm

all: O0 O1 O1native O2 O2native O3 O3native Os Osnative O3nativefastmath

clean:
	rm -f O0 O1 O1native O2 O2native O3 O3native Os Osnative O3nativefastmath

O0: 
	gcc Multigrid0.c $(FLAGS) -o O0
	gcc Multigrid0.c $(FLAGS) -S -o O0.s	
	
O1: 
	gcc Multigrid0.c $(FLAGS) -O1 -o O1	
	gcc Multigrid0.c $(FLAGS) -O1 -S -o O1.s		
	
O2: 
	gcc Multigrid0.c $(FLAGS) -O2 -o O2	
	gcc Multigrid0.c $(FLAGS) -O2 -S -o O2.s			

O3: 
	gcc Multigrid0.c $(FLAGS) -O3 -o O3	
	gcc Multigrid0.c $(FLAGS) -O3 -S -o O3.s			

Os: 
	gcc Multigrid0.c $(FLAGS) -Os -o Os	
	gcc Multigrid0.c $(FLAGS) -Os -S -o Os.s			
	
	
O1native: 
	gcc Multigrid0.c $(FLAGS) -O1 -march=native -o O1native	
	gcc Multigrid0.c $(FLAGS) -O1 -march=native -S -o O1native.s		
	
O2native: 
	gcc Multigrid0.c $(FLAGS) -O2 -march=native -o O2native	
	gcc Multigrid0.c $(FLAGS) -O2 -march=native -S -o O2native.s			

O3native: 
	gcc Multigrid0.c $(FLAGS) -O3 -march=native -o O3native	
	gcc Multigrid0.c $(FLAGS) -O3 -march=native -S -o O3native.s			
	
Osnative: 
	gcc Multigrid0.c $(FLAGS) -Os -march=native -o Osnative	
	gcc Multigrid0.c $(FLAGS) -Os -march=native -S -o Osnative.s	
	
O3nativefastmath:
	gcc Multigrid0.c $(FLAGS) -O3 -march=native -ffast-math -o O3nativefastmath
	gcc Multigrid0.c $(FLAGS) -O3 -march=native -ffast-math -S -o O3nativefastmath.s			
			
