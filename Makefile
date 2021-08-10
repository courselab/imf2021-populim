decode: bypass.o decode.o libcypher.so
	gcc -m32 bypass.o decode.o -L. -Wl,-rpath='$ORIGIN' -lcypher -o decode

bypass.o: bypass.c
	gcc -m32 -c $< -o $@

.PHONY: clean dist

run:
	./decode -k ABC -d crypt1.dat file1

dist:
	tar zcvf decode.tar.gz Makefile fix.S bypass.c decode.o libcypher.so
