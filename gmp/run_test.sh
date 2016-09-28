gcc -I${PREFIX}/include -Wl,-rpath,${PREFIX}/lib -L${PREFIX}/lib test.c -lgmp -o test.out
./test.out
