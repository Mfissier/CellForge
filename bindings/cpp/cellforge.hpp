#pragma once
#include <dlfcn.h>
#include <stdexcept>
#include <string>
#include <filesystem>

class CellForge {
private:
    void* _lib;
    char* (*_cellforge_func)();

public:
    CellForge(const std::string& lib_path = "") {
        // Default to ../../lib/libcellforge.so
        std::filesystem::path base = std::filesystem::path(__FILE__).parent_path().parent_path().parent_path() / "lib" / "libcellforge.so";
        std::filesystem::path path = lib_path.empty() ? base : std::filesystem::path(lib_path);
        
        if (!std::filesystem::exists(path)) {
            throw std::runtime_error("Missing CellForge library at " + path.string() + "\nRun `make` from the project root to build it.");
        }
        
        // Load the shared library
        _lib = dlopen(path.c_str(), RTLD_LAZY);
        if (!_lib) {
            throw std::runtime_error("Failed to load library: " + std::string(dlerror()));
        }
        
        // Get the cellforge function
        _cellforge_func = (char* (*)()) dlsym(_lib, "cellforge");
        if (!_cellforge_func) {
            dlclose(_lib);
            throw std::runtime_error("Failed to find cellforge function: " + std::string(dlerror()));
        }
    }
    
    ~CellForge() {
        if (_lib) {
            dlclose(_lib);
        }
    }
    
    std::string hello() {
        char* result = _cellforge_func();
        return std::string(result);
    }
}; 