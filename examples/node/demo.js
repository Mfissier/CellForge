const CellForge = require('../../bindings/node/cellforge');

function main() {
    try {
        const cf = new CellForge();
        console.log(cf.hello());
    } catch (error) {
        console.error('Error:', error.message);
        process.exit(1);
    }
}

if (require.main === module) {
    main();
} 