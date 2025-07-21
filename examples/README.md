# CellForge Examples

This section contains usage examples of CellForge in different programming languages.

## Prerequisites

Make sure the CellForge library is compiled:
```bash
make
```

## Examples by language

### Python
```bash
cd examples/python
python3 demo.py
```

### C++
```bash
cd examples/cpp
g++ -std=c++17 demo.cpp -ldl -o demo
./demo
```

### Node.js
```bash
cd examples/node
npm install ffi-napi  # If not already installed
node demo.js
```

### PHP
```bash
cd examples/php
php demo.php
```

### Ruby
```bash
cd examples/ruby
ruby demo.rb
# or directly
./demo.rb
```

### WebAssembly
Serve the HTML file with a web server (required for ES6 modules):
```bash
cd examples/wasm
python3 -m http.server 8000
# Then open http://localhost:8000/demo.html
```

## Expected output

All examples should display:
```
Hello from CellForge!
``` 