CC = gcc
CFLAGS = -Wall -Wextra -Werror -fPIC -Iinclude
SRC = src/cell.c
OUT_DIR = lib
OUT_SO = $(OUT_DIR)/libcellforge.so
STATIC_OUT = lib/libcellforge.a
EXEC_TEST = tests/exec

all: shared

shared:
	mkdir -p $(OUT_DIR)
	$(CC) $(CFLAGS) -shared -o $(OUT_SO) $(SRC)

static:
	mkdir -p lib
	$(CC) -c $(CFLAGS) $(SRC) -o lib/cell.o
	ar rcs $(STATIC_OUT) lib/cell.o
	gcc -Iinclude tests/main.c lib/libcellforge.a -o $(EXEC_TEST)

# Install all dependencies for all language bindings
install:
	@echo "🔧 Installing CellForge dependencies..."
	@chmod +x install.sh
	@./install.sh

# Run tests for all available language bindings
test: shared
	@echo "🧪 Testing CellForge bindings..."
	@echo "Testing Python..."
	@cd examples/python && python3 demo.py
	@echo "✅ Python test passed"
	@echo ""


# Development setup
dev-setup: install shared test

clean_static:
	rm -rf $(STATIC_OUT)
	rm -rf $(EXEC_TEST)

clean:
	rm -rf $(OUT_DIR)
	rm -rf /tests/exec_test
# Force rebuild

rebuild: clean shared

.PHONY: all shared static install test test-quick dev-setup clean_static clean clean-all rebuild