function _canaudua_setup
  set -g canaudua_left_prompt_$fish_pid (_canaudua_prompt)

  for setting in items powerline color
    printf 'set -U canaudua_%s\n' (cat ~/.config/fish/functions/setting/$setting) | source
  end
end
