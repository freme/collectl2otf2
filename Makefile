## -*- mode: makefile -*-

all: collectl2otf

collectl2otf.o: collectl2otf.c
	gcc -std=c99 `otf2-config --cflags` \
            -c collectl2otf.c \
            -o collectl2otf.o

collectl2otf: collectl2otf.o
	gcc collectl2otf.o \
            `otf2-config --ldflags` \
            `otf2-config --libs` \
            -o collectl2otf

clean:
	$(RM) collectl2otf *.o
	$(RM) -r ArchivePuath
	$(RM) -r bin man doc

collectl:
	./build_collectl.sh

