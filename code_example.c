/*
 * Namu Dark edge-case demo (C)
 * Goal: exercise comments, strings, keywords, types, functions, numbers, macros, and punctuation.
 */

#include <stdint.h>
#include <stdbool.h>

#define STR2(x) #x
#define STR(x) STR2(x)
#define CLAMP(v, lo, hi) (((v) < (lo)) ? (lo) : (((v) > (hi)) ? (hi) : (v)))

enum level { LV_OK = 0, LV_WARN = 1, LV_FAIL = 2 };

struct node {
  uint32_t id;
  const char *name;
  double value;
};

static inline uint32_t rotl32(uint32_t x, unsigned r)
{
  return (x << (r & 31U)) | (x >> ((32U - r) & 31U));
}

static int parse_u32(const char *s, uint32_t *out)
{
  if (!s || !out) return -1;

  uint32_t v = 0;
  for (const unsigned char *p = (const unsigned char *)s; *p; ++p) {
    if (*p < '0' || *p > '9') break;
    v = v * 10U + (uint32_t)(*p - '0');
  }

  *out = v;
  return 0;
}

int main(void)
{
  struct node n = { .id = 0xCAFEu, .name = "Hanji\\nInk\\tBlue", .value = 3.14159 };
  const char *rx = "^(?:[A-Z]+\\d{2,4})$";

  uint32_t x = 123456789u;
  x = rotl32(x, 13u) ^ 0xA5A5A5A5u;
  x = CLAMP(x, 0u, 0xffffffffu);

  uint32_t out = 0;
  int rc = parse_u32("42", &out);
  if (rc != 0) return LV_FAIL;

  /* punctuation stress */
  bool ok = (out == 42u) && (n.id != 0u) && (rx[0] == '^');
  return ok ? LV_OK : LV_WARN;
}
