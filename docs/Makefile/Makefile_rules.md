## 🛠️ Available Targets

### `make`
> Compiles the shared `.so` library  
**Creates:**
- `lib/libcellforge.so`

---

### `make static`
> Compiles the static `.a` library and a test executable  
**Creates:**
- `lib/libcellforge.a`
- `tests/exec_test`

---

### `make clean_static`
> Deletes static build artifacts  
**Removes:**
- `lib/libcellforge.a`
- `tests/exec_test`

---

### `make clean`
> Removes all build artifacts  
**Removes:**
- The entire `lib/` directory

---

## 🔎 Quick Test

To compile and test everything in native C:

```bash
make static
./tests/exec_test
