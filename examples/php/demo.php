<?php

require_once '../../bindings/php/cellforge.php';

function main() {
    try {
        $cf = new CellForge();
        echo $cf->hello() . PHP_EOL;
    } catch (Exception $e) {
        echo "Error: " . $e->getMessage() . PHP_EOL;
        exit(1);
    }
}

if (php_sapi_name() === 'cli') {
    main();
} 