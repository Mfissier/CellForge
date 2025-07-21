import sys
import os
from pathlib import Path

# Add the bindings/python directory to Python path
current_dir = Path(__file__).resolve().parent
bindings_path = current_dir.parent.parent / "bindings" / "python"
sys.path.insert(0, str(bindings_path))

from cellforge import CellForge

def main():
    # Use the variable
    cell = CellForge()
    print(cell.hello())

    # Or use the class directly
    print(CellForge().hello())

if __name__ == "__main__":
    main()
