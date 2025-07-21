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
	@echo "Testing Node.js..."
	@cd examples/node && node demo.js
	@echo "✅ Node.js test passed"
	@echo ""
	@if command -v g++ >/dev/null 2>&1; then \
		echo "Testing C++..."; \
		cd examples/cpp && g++ -std=c++17 demo.cpp -ldl -o demo && ./demo && rm -f demo; \
		echo "✅ C++ test passed"; \
	else \
		echo "⚠️  C++ compiler not found - skipping C++ test"; \
	fi
	@echo ""
	@if command -v php >/dev/null 2>&1; then \
		echo "Testing PHP..."; \
		cd examples/php && php demo.php; \
		echo "✅ PHP test passed"; \
	else \
		echo "⚠️  PHP not found - skipping PHP test"; \
	fi
	@echo ""
	@if command -v ruby >/dev/null 2>&1; then \
		echo "Testing Ruby..."; \
		cd examples/ruby && ruby demo.rb; \
		echo "✅ Ruby test passed"; \
	else \
		echo "⚠️  Ruby not found - skipping Ruby test"; \
	fi
	@echo ""
	@echo "🎉 All available tests completed!"

# Quick test with just available languages
test-quick: shared
	@echo "🚀 Quick test (Python + Node.js only)..."
	@cd examples/python && python3 demo.py
	@cd examples/node && node demo.js
	@echo "✅ Quick tests passed!"

# Development setup
dev-setup: install shared test

clean_static:
	rm -rf $(STATIC_OUT)
	rm -rf $(EXEC_TEST)

clean:
	rm -rf $(OUT_DIR)
	rm -f examples/cpp/demo

# Full clean including dependencies
clean-all: clean
	rm -rf bindings/node/node_modules
	rm -rf bindings/node/package-lock.json

# Force rebuild
rebuild: clean shared

.PHONY: all shared static install test test-quick dev-setup clean_static clean clean-all rebuild