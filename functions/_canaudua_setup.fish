function _canaudua_setup
  set fish_bind_mode $fish_bind_mode
  set -g canaudua_left_prompt_$fish_pid (_canaudua_prompt)

  set -q canaudua_left_items; or set -U canaudua_left_items pwd
  set -q canaudua_right_items; or set -U canaudua_right_items time
end
