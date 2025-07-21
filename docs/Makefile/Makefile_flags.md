# 🛠️ Makefile Flags Explanation

This file documents the compilation flags used in CellForge's Makefile when building the shared C library (`libcellforge.so`).

## ✅ `-fPIC` — *Position Independent Code*
> Required for building **shared libraries** on Unix-based systems.
It allows the compiled code to be **safely loaded at any memory address**, which is mandatory when the library is dynamically loaded (e.g., via `dlopen()` or FFI).

---

## ✅ `-shared`
> Instructs the compiler to generate a **shared library** instead of a regular executable.
This creates a `.so` file (`libcellforge.so`) that can be loaded by any language supporting dynamic libraries (Python, Node.js, PHP, etc.).

---

## ✅ `-Iinclude`
> Tells the compiler where to find the project's **public headers**.
In our case, `cell.h` is located in `include/`.
