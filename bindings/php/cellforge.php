<?php

class CellForge {
    private $ffi;
    
    public function __construct(?string $libPath = null) {
        // Default to ../../lib/libcellforge.so
        $basePath = dirname(__FILE__, 3) . '/lib/libcellforge.so';
        $finalPath = $libPath ?? $basePath;
        
        if (!file_exists($finalPath)) {
            throw new Exception("Missing CellForge library at $finalPath\nRun `make` from the project root to build it.");
        }
        
        // Load the shared library with FFI
        $this->ffi = FFI::cdef("char* cellforge();", $finalPath);
    }
    
    public function hello(): string {
        $result = $this->ffi->cellforge();
        return \FFI::string($result);
    }
} 