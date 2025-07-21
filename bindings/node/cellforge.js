const ffi = require('ffi-napi');
const path = require('path');
const fs = require('fs');

class CellForge {
    constructor(libPath = null) {
        // Default to ../../lib/libcellforge.so
        const basePath = path.join(__dirname, '..', '..', 'lib', 'libcellforge.so');
        const finalPath = libPath || basePath;
        
        if (!fs.existsSync(finalPath)) {
            throw new Error(`Missing CellForge library at ${finalPath}\nRun \`make\` from the project root to build it.`);
        }
        
        // Load the shared library
        this._lib = ffi.Library(finalPath, {
            'cellforge': ['string', []]
        });
    }
    
    hello() {
        return this._lib.cellforge();
    }
}

module.exports = CellForge; 