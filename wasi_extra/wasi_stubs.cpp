#include <cstddef>
#include <stdint.h>

extern "C" { // Avoid name mangling for missing definitions
int errno = 0;

int32_t __wasi_args_sizes_get(int32_t *argc, int32_t *argv_buf_size) {
  *argc = 0;
  *argv_buf_size = 0;
  return 0;
}

int32_t __wasi_args_get(int32_t *argv, int32_t *argv_buf) { return 0; }
}

// Needed since Swift 6.3.
namespace std {
inline namespace __2 {
size_t __hash_memory(const void *ptr, size_t len) {
  // Similar FNV-1a hash implementation
  const unsigned char *data = (const unsigned char *)ptr;
  size_t hash = 0x811c9dc5;
  for (size_t i = 0; i < len; ++i) {
    hash ^= data[i];
    hash *= 0x01000193;
  }
  return hash;
}
} // namespace __2
} // namespace std
