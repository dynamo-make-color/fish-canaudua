function _canaudua_glob -a pattern_type
  set -l mtime (stat -c '%Y' .)
  set -l folder (pwd | string escape --style=var)
  set -l cache_var canaudua_glob_{$folder}_{$pattern_type}
  set -l pattern_var canaudua_{$pattern_type}_glob

  # Search in cache before
  test "$cache_var" = "$mtime"; and return 0

  # Find with pattern
  test -z (find . -maxdepth 1 -iregex $$pattern_var -print -quit 2>/dev/null); and return 1

  # Set cache for glob search
  set -U $cache_var $mtime

  return 0
end
