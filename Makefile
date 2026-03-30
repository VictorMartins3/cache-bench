CC := gcc
CFLAGS := -O3 -Wall -Wextra
CFLAGS_NATIVE := -O3 -march=native -Wall -Wextra
RUSTC := rustc
RUSTFLAGS := -O

TARGETS := row_major col_major row_major_native col_major_native row_major_rs col_major_rs

all: $(TARGETS)

row_major: row_major.c
	$(CC) $(CFLAGS) -o $@ $<

col_major: col_major.c
	$(CC) $(CFLAGS) -o $@ $<

row_major_native: row_major.c
	$(CC) $(CFLAGS_NATIVE) -o $@ $<

col_major_native: col_major.c
	$(CC) $(CFLAGS_NATIVE) -o $@ $<

row_major_rs: row_major.rs
	$(RUSTC) $(RUSTFLAGS) -o $@ $<

col_major_rs: col_major.rs
	$(RUSTC) $(RUSTFLAGS) -o $@ $<

clean:
	rm -f $(TARGETS)

.PHONY: all clean
