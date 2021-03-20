function _canaudua_prompt
  set -l left_prompt (_canaudua_side_prompt left)
  set -l right_prompt (_canaudua_side_prompt right)

  printf '%s' $left_prompt' '
end
