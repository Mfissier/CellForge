CC = gcc
CFLAGS = -Wall -Wextra -Werror -fPIC -Iinclude
SRC = src/cell.c
OUT_DIR = lib
OUT_SO = $(OUT_DIR)/libcellforge.so
STATIC_OUT = lib/libcellforge.a
EXEC_TEST = tests/exec_test

all: shared

shared:
	mkdir -p $(OUT_DIR)
	$(CC) $(CFLAGS) -shared -o $(OUT_SO) $(SRC)
static:
	mkdir -p lib
	$(CC) -c $(CFLAGS) $(SRC) -o lib/cell.o
	ar rcs $(STATIC_OUT) lib/cell.o
	gcc -Iinclude tests/main.c lib/libcellforge.a -o $(EXEC_TEST)

clean_static:
	rm -rf $(STATIC_OUT)
	rm -rf $(EXEC_TEST)

clean:
	rm -rf $(OUT_DIR)