#include <stdint.h>

int errno = 0;

int32_t __wasi_args_sizes_get(int32_t *argc, int32_t *argv_buf_size) {
  *argc = 0;
  *argv_buf_size = 0;
  return 0;
}

int32_t __wasi_args_get(int32_t *argv, int32_t *argv_buf) { return 0; }
