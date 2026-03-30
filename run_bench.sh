#!/bin/bash
set -e

binaries=(row_major col_major row_major_native col_major_native)

echo "Verifying binaries..."
for bin in "${binaries[@]}"; do
    if [ ! -x "./$bin" ]; then
        echo "Error: $bin not found. Run 'make' first."
        exit 1
    fi
done

echo
echo "Running hyperfine benchmark..."
hyperfine "${binaries[@]/#/./}"

echo
echo "To measure cache misses (Linux only):"
echo "  perf stat -e cache-references,cache-misses ./row_major"
echo "  perf stat -e cache-references,cache-misses ./col_major"
echo "  perf stat -e cache-references,cache-misses ./row_major_native"
echo "  perf stat -e cache-references,cache-misses ./col_major_native"
