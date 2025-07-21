import os
import pathlib
import ctypes

class CellForge:
#
    """
    High‑level Python wrapper around the CellForge C library.
    """

    def __init__(self, lib_path: str | os.PathLike = None):
    #
        # Default to ../../lib/libcellforge.so
        base = pathlib.Path(__file__).resolve().parents[2] / "lib" / "libcellforge.so"
        if lib_path:
            self._path = pathlib.Path(lib_path)
        else:
            self._path = base

        if not self._path.exists() :
        #
            raise FileNotFoundError
            (
                f"Missing CellForge library at {self._path}\n"
                "Run `make` from the project root to build it."
            )
        #===============================================
        # SETTING THE RESTYPE OF THE CELLFORGE FUNCTION

        # Load the shared library
        self._lib = ctypes.cdll.LoadLibrary(str(self._path))
        # Tell Python that cellforge() returns a C string
        self._lib.cellforge.restype = ctypes.c_char_p

        #===============================================
    #   
    def hello(self) -> str:
    #
        """Call the C function and decode the returned bytes."""
        return self._lib.cellforge().decode()
    #
#