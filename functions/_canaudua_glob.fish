function _canaudua_glob -a pattern
  test -z (find . -iregex $pattern -print -quit 2>/dev/null); and return 1; or return 0
end
