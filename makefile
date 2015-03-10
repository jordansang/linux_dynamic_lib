.PHONY:all build test clean install update

all:build test install

update:cleanup build install

cleanup:
			rm -rf add.o sub.o libtiger.so
			rm -rf /lib/libtiger.so

build:libtiger.so

libtiger.so:add.o sub.o
				gcc -shared -o ./lib/libtiger.so ./src/add.o ./src/sub.o
				rm -rf ./src/add.o ./src/sub.o
				
add.o:
				gcc -fpic -o ./src/add.o -c ./src/add.c
				
sub.o:
				gcc -fpic -o ./src/sub.o -c ./src/sub.c
				
test:main

main:
			gcc -o ./bin/main ./src/main.c -L./lib -ltiger -I.
			
install:
			cp ./lib/libtiger.so /lib/libtiger.so
			
clean:
			rm -rf /lib/libtiger.so
			rm -rf ./src/add.o ./src/sub.o ./lib/libtiger.so ./bin/main
			
