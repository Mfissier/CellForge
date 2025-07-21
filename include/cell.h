#ifndef CELLFORGE_H
#define CELLFORGE_H

// This block ensures compatibility with C++ compilers.
// It prevents name mangling so that the C functions can be called
// from C++ code using their plain C names.
// This is only needed for C++ — not required for Python, JS, or other FFI languages.
#ifdef __cplusplus
extern "C" {
#endif

//===============================================
    const char* cellforge();
//===============================================

#ifdef __cplusplus
}
#endif

#endif // CELLFORGE_H