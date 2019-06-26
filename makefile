my_basic : main.o my_basic.o
	emcc -o output/my_basic.js main.o my_basic.o -s WASM=1 -lm -lrt -s EXPORTED_FUNCTIONS='["_eval"]' -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]'

main.o : shell/main.c core/my_basic.h
	emcc -Os -c shell/main.c -Wno-unused-result

my_basic.o : core/my_basic.c core/my_basic.h
	emcc -Os -c core/my_basic.c -Wno-multichar -Wno-overflow -Wno-unused-result

clean :
	rm -f main.o my_basic.o core/my_basic.o shell/main.o
