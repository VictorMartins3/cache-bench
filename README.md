# cache-bench

Benchmark showing how memory access patterns dominate performance, even over SIMD optimization.

## Why This Matters

A 10000×10000 matrix traversed row-major (sequential) vs column-major (random). Same algorithm, same compiler optimizations. Row-major is ~6.9× faster because it fills CPU cache lines efficiently. Column-major thrashes the cache, forcing constant main memory fetches. This shows that **data layout beats SIMD**—fix your memory access patterns first, optimizations later.

## Build

```bash
make
```

Creates 4 binaries: `row_major`, `col_major`, `row_major_native`, `col_major_native`.

## Benchmark

```bash
hyperfine ./row_major ./col_major ./row_major_native ./col_major_native
```

## Measure Cache Misses (Linux)

```bash
perf stat -e cache-references,cache-misses ./row_major
perf stat -e cache-references,cache-misses ./col_major
perf stat -e cache-references,cache-misses ./row_major_native
perf stat -e cache-references,cache-misses ./col_major_native
```

Or use the helper script:

```bash
./run_bench.sh
```

## Results

Fill in your own numbers:

| Binary | Time | Miss Rate | Notes |
|--------|------|-----------|-------|
| row_major | — | — | Sequential, -O3 |
| row_major_native | — | — | Sequential, -O3 -march=native |
| col_major | — | — | Random, -O3 |
| col_major_native | — | — | Random, -O3 -march=native |

**What to expect:**
- Row-major: ~50ms, 1-5% miss rate
- Column-major: ~300ms, 50-80% miss rate
- SIMD (native) barely changes these numbers

## Further Reading

- [What Every Programmer Should Know About Memory](https://people.freebsd.org/~lstewart/articles/cpumemory.pdf) - Ulrich Drepper
- [Optimizing Software with Intel C++ Compiler](https://www.intel.com/content/dam/www/public/us/en/documents/optimization-guide/optimizing-software-with-intel-compiler.pdf) - Intel
- [The GNU C Library: Optimizing for the Memory Hierarchy](https://sourceware.org/glibc/wiki/Performance)
- [NUMA Aware Performance Considerations](https://www.kernel.org/doc/Documentation/vm/numa.txt) - Linux Kernel Docs

---

All code is public domain. No dependencies beyond stdlib.
