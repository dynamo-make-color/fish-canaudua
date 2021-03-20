function canaudua_setup
  set fish_bind_mode $fish_bind_mode
  set -U canaudua_left_prompt_$fish_pid (canaudua_prompt)
end
