#include "../../bindings/cpp/cellforge.hpp"
#include <iostream>

int main() {
    try {
        CellForge cf;
        std::cout << cf.hello() << std::endl;
    } catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }
    return 0;
} 