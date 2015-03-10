.PHONY:all build test clean install update

all:build test install

update:cleanup build install

cleanup:
			rm -rf add.o sub.o libtiger.so
			rm -rf /lib/libtiger.so

build:libtiger.so

libtiger.so:add.o sub.o
				gcc -shared -o libtiger.so add.o sub.o
				
add.o:add.c
				gcc -fpic -c add.c
				
sub.o:sub.c
				gcc -fpic -c sub.c
				
test:main

main:main.c
			gcc -o main main.c -L. -ltiger
			
install:
			cp libtiger.so /lib/libtiger.so
			
clean:
			rm -rf /lib/libtiger.so
			rm -rf add.o sub.o libtiger.so main
			
