function _canaudua_prompt
  set -l left_prompt (_canaudua_side_prompt left)
  set -l right_prompt (_canaudua_side_prompt right)

  set -g canaudua_right_prompt_$canaudua_pid $right_prompt
  printf '%s' $left_prompt' '
end
