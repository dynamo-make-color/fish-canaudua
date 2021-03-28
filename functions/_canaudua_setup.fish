function _canaudua_setup -a fish_bind_mode
  # Inherit variables from last process while async
  set -g fish_bind_mode $fish_bind_mode

  for setting in items glyph color
    printf 'set -U canaudua_%s\n' (cat ~/.config/fish/functions/setting/$setting) | source
  end

  set -l left_prompt (_canaudua_side_prompt left)
  set -l right_prompt (_canaudua_side_prompt right)
  set -U canaudua_left_prompt_$canaudua_pid $left_prompt' '
  set -U canaudua_right_prompt_$canaudua_pid $right_prompt
end
