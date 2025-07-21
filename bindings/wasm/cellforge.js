class CellForge {
    constructor(wasmPath = null) {
        // Default to ../../lib/cellforge.wasm (when WASM build is available)
        const basePath = new URL('../../lib/cellforge.wasm', import.meta.url).pathname;
        this.wasmPath = wasmPath || basePath;
        this.instance = null;
    }
    
    async init() {
        try {
            const wasmModule = await WebAssembly.instantiateStreaming(fetch(this.wasmPath));
            this.instance = wasmModule.instance;
        } catch (error) {
            throw new Error(`Missing CellForge WASM library at ${this.wasmPath}\nRun \`make wasm\` from the project root to build it.`);
        }
    }
    
    hello() {
        if (!this.instance) {
            throw new Error('CellForge WASM not initialized. Call init() first.');
        }
        
        // Call the exported cellforge function
        const ptr = this.instance.exports.cellforge();
        
        // Convert C string pointer to JavaScript string
        const memory = new Uint8Array(this.instance.exports.memory.buffer);
        let result = '';
        for (let i = ptr; memory[i] !== 0; i++) {
            result += String.fromCharCode(memory[i]);
        }
        
        return result;
    }
}

// For Node.js compatibility
if (typeof module !== 'undefined' && module.exports) {
    module.exports = CellForge;
} 