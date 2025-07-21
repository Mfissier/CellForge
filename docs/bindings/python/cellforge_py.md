
### 🐍 Link Python CellForge
> bindings/python/cellforge.py
### high‑level wrapper
> demo.py > example usage
__init__

### 📁 Struct of files

**self** is the instance being created.
lib_path (*optional*) lets you override the default .so location.
Defaults to **lib/libcellforge.so**, checks existence, then loads it.
```
self._lib = ctypes.cdll.LoadLibrary(...)
```
Inserts the C library into memory, returns a handle.
```
self._lib.cellforge.restype = ctypes.c_char_p
```
> Declares that cellforge() returns a char * (C string), so Python can decode it.

