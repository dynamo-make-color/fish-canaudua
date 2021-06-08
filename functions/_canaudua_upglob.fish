function _canaudua_upglob -a pattern_type
  set -l path .

  while test (realpath $path) != "/" -a (realpath $path) != (realpath $HOME/..)
    _canaudua_glob $pattern_type $path; and return 0
    set path $path/..
  end
  return 1
end

function _canaudua_glob -a pattern_type directory
  set -l mtime (stat -c '%Y' $directory)
  set -l folder (realpath $directory | string escape --style=var)
  set -l cache_var canaudua_glob_{$folder}_{$pattern_type}
  set -l pattern_var canaudua_{$pattern_type}_glob

  # Search in cache before
  test "$cache_var" = 0; and return 1
  test "$cache_var" = "$mtime"; and return 0

  # Find with pattern
  test -z (find (realpath $directory) -maxdepth 1 -regextype posix-extended -iregex $$pattern_var -print -quit 2>/dev/null); and set -U $cache_var 0; and return 1

  # Set cache for glob search
  set -U $cache_var $mtime

  return 0
end
